<?php

declare(strict_types=1);

namespace App\Services;

use App\Entity\ContractList;
use App\Entity\Order;
use App\Entity\OrderItem;
use App\Entity\OrderStatus;
use App\Entity\OrderType;
use App\Entity\Product;
use App\Repository\AddressRepository;
use App\Repository\ProductRepository;
use App\Repository\UserRepository;
use App\Enum\OrderStatus as OrderStatusEnum;
use App\Enum\OrderType as OrderTypeEnum;
use Doctrine\ORM\EntityManagerInterface;

class OrderHandler
{
    public function __construct(
        private ProductRepository $productRepository,
        private AddressRepository $addressRepository,
        private UserRepository $userRepository,
        private EntityManagerInterface $entityManager
    ){
    }
    public function create(array $orderData): Order
    {
        $order = new Order();

        $customer = $this->userRepository->find($orderData['customer']);
        $billingAddress = $this->addressRepository->find($orderData['billingAddress']);
        $shippingAddress = $this->addressRepository->find($orderData['shippingAddress']);

        $orderType = OrderTypeEnum::tryFrom($orderData['orderType']);
        $orderStatus = OrderStatusEnum::tryFrom($orderData['orderStatus']);

        $order->setType($this->entityManager->getReference(OrderType::class, $orderType->value))
            ->setStatus($this->entityManager->getReference(OrderStatus::class, $orderStatus->value))
            ->setCustomer($customer)
            ->setBillingAddress($billingAddress ?? $customer->getBillingAddress())
            ->setShippingAddress($shippingAddress ?? $customer->getShippingAddress())
        ;

        $productIds = array_map(function ($item) {
                return $item['product_id'];
            }, $orderData['orderItems']
        );
        $products = $this->productRepository->findAllById($productIds);

        $this->resolveStandardItemPrices($order, $orderData, $products);
        $order->setVatAmount(0.25)
            ->setDiscount(.0)
        ;

        $contract = $customer->getContractLists()->first();
        if (!empty($contract)) {
            $order->setVatAmount($contract->getVatAmount())
                ->setDiscount($contract->getDiscount())
            ;

            $this->resolveContractItemPrices($contract, $orderData);
        }

        $this->resolveTotals($order, $orderData);

        return $order;
    }

    private function resolveStandardItemPrices(Order $order, array &$orderData, array $products): void
    {
        foreach ($orderData['orderItems'] as $index => $item) {
            foreach ($products as $product) {
                if ($product->getId() === $item['product_id']) {
                    $orderData['orderItems'][$index]['price'] = $product->getPrice();

                    $this->resolveOrderItem($order, $product, $orderData['orderItems'][$index]['quantity']);
                }
            }
        }
    }

    private function resolveContractItemPrices(ContractList $contract, array &$orderData): void
    {
        $priceListProducts = $contract->getPriceList()->getProducts();

        foreach ($orderData['orderItems'] as $index => $item) {
            foreach ($priceListProducts as $priceListProduct) {
                if ($priceListProduct->getId() === $item['product_id']) {
                    $orderData['orderItems'][$index]['price'] = $priceListProduct->getPrice();
                }
            }
        }
    }

    private function resolveTotals(Order $order, array $orderData): void
    {
        $subTotal = 0;
        foreach ($orderData['orderItems'] as $item) {
            $subTotal += $item['price'] * $item['quantity'];
        }

        $discount = $subTotal * $order->getDiscount();
        $subTotalWithDiscount = $subTotal - $discount;

        $tax = $subTotalWithDiscount * $order->getVatAmount();
        $orderTotal = $subTotalWithDiscount + $tax;

        $order->setOrderSubtotal($subTotal)
            ->setOrderTotal($orderTotal)
        ;
    }

    private function resolveOrderItem(Order $order, Product $product, int $quantity): void
    {
        $orderItem = new OrderItem();

        $orderItem->setProduct($product)
            ->setQuantity($quantity);

        $order->addOrderItem($orderItem);
    }
}