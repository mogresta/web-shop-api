<?php

namespace App\Controller;

use App\Repository\OrderRepository;
use App\Services\OrderHandler;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;

class OrderController extends AbstractController
{
    public function __construct(
        private OrderHandler $orderhandler,
        private OrderRepository $orderRepository
    ){
    }

    #[Route('/api/order/create', name: 'create')]
    public function create(Request $request): Response
    {
        $orderData = json_decode($request->getContent(), true);

        try {
            $order = $this->orderhandler->create($orderData);

            $this->orderRepository->save($order);

            return new JsonResponse(['id' => $order->getId()], 200);
        } catch (\Exception $e) {

            return new JsonResponse(['error' => $e->getMessage(), 500]);
        }
    }
}
