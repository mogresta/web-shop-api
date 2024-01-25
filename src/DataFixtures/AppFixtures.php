<?php

namespace App\DataFixtures;

use App\Entity\Address;
use App\Entity\Category;
use App\Entity\ContractList;
use App\Entity\OrderStatus;
use App\Entity\OrderType;
use App\Entity\PriceList;
use App\Entity\PriceListProduct;
use App\Entity\Product;
use App\Entity\ProductCategory;
use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Faker\Factory;

class AppFixtures extends Fixture
{
    private $faker;
    private $categories;
    private $products;
    private $priceLists;
    private $users;

    public function __construct(
        private UserPasswordHasherInterface $hasher
    ){
    }

    public function load(ObjectManager $manager)
    {
        $this->faker = Factory::create();

        $this->addOrderStatuses($manager);
        $this->addOrderTypes($manager);

        $this->addUsers($manager);
        $this->addCategories($manager);
        $this->addProducts($manager);
        $this->addProductsToCategories($manager);
        $this->addPriceLists($manager);
        $this->addContractList($manager);

        $manager->flush();
    }

    private function addOrderStatuses(ObjectManager $manager): void
    {
        $statuses = [
            'New',
            'Shipped',
            'Waiting',
            'Cancelled',
            'Completed',
        ];

        foreach ($statuses as $status) {
            $orderStatus = new OrderStatus();
            $orderStatus->setname($status);

            $manager->persist($orderStatus);
        }
    }
    private function addOrderTypes(ObjectManager $manager): void
    {
        $newOrder = new OrderType();
        $newOrder->setname('Regular');

        $manager->persist($newOrder);
    }

    private function addUsers(ObjectManager $manager): void
    {
        for ($i = 0; $i < 10; $i++) {
            $user = new User();
            $firstName = $this->faker->firstName;
            $lastName = $this->faker->lastName;
            $user->setFirstName($firstName)
                ->setLastName($lastName)
                ->setEmail($firstName . '.' . $lastName . '@test.com')
            ;

            $password = $this->hasher->hashPassword($user, 'pass_1234');
            $user->setPassword($password);

            $manager->persist($user);

            $this->addAddresses($manager, $user);

            $this->users[] = $user;
        }
    }

    private function addAddresses(ObjectManager $manager, User $user): void
    {
        $billingAddress = new Address();
        $billingAddress->setFirstName($user->getFirstName())
            ->setLastName($user->getLastName())
            ->setPhoneNumber($this->faker->phoneNumber)
            ->setStreet($this->faker->streetAddress)
            ->setCity($this->faker->city)
            ->setCountry($this->faker->country)
            ->setPostCode($this->faker->postcode)
        ;

        $manager->persist($billingAddress);
        $user->setBillingAddress($billingAddress);

        $shippingAddress = new Address();
        $shippingAddress->setFirstName($user->getFirstName())
            ->setLastName($user->getLastName())
            ->setPhoneNumber($this->faker->phoneNumber)
            ->setStreet($this->faker->streetAddress)
            ->setCity($this->faker->city)
            ->setCountry($this->faker->countryCode)
            ->setPostCode($this->faker->postcode)
        ;

        $manager->persist($shippingAddress);
        $user->setShippingAddress($shippingAddress);
    }

    private function addCategories(ObjectManager $manager): void
    {
        for ($i = 0; $i < 10; $i++) {
            $category = new Category();

            $category->setName('category ' . $i)
                ->setDescription($this->faker->realText(200, 2))
            ;

            $manager->persist($category);

            $this->categories[] = $category;
        }
    }

    private function addProducts(ObjectManager $manager): void
    {
        for ($i = 0; $i < 30; $i++) {
            $product = new Product();

            $product->setName('product ' . $i)
                ->setSku($this->faker->numberBetween(10000, 99999))
                ->setPrice($this->faker->randomFloat(2, 5, 100))
                ->setCreatedAt($this->faker->dateTime)
                ->setDescription($this->faker->realText(200, 2))
            ;

            $manager->persist($product);

            $this->products[] = $product;
        }
    }

    private function addProductsToCategories(ObjectManager $manager): void
    {
        for ($i = 0; $i < 50; $i++) {
            $productCategory = new ProductCategory();

            $productCategory->setCategory($this->categories[rand(0, count($this->categories)-1)])
                ->setProduct($this->products[rand(0, count($this->products)-1)]);

            $manager->persist($productCategory);
        }
    }

    private function addPriceLists(ObjectManager $manager): void
    {
        for ($i = 0; $i < 5; $i++) {
            $priceList = new PriceList();

            $priceList->setName($this->faker->company)
                ->setStatus(1)
            ;

            $manager->persist($priceList);

            $this->priceLists[] = $priceList;

            $this->addProductsToPriceList($manager, $priceList);
        }
    }

    private function addProductsToPriceList(ObjectManager $manager, PriceList $priceList): void
    {
        $randomIterations = rand(0, 10);
        $productArray = $this->products;

        for ($i = 0; $i <= $randomIterations; $i++) {
            $product = array_pop($productArray);
            shuffle($productArray);

            $productToPriceList = new PriceListProduct();
            $productToPriceList->setPriceList($priceList)
                ->setProduct($product)
                ->setPrice($this->faker->randomFloat(2, 5, 100))
            ;

            $manager->persist($productToPriceList);
        }
    }

    private function addContractList(ObjectManager $manager): void
    {
        for ($i = 0; $i < 5; $i++) {
            $contractList = new ContractList();
            $vatRequired = rand(0, 1);

            $contractList->setCustomer($this->users[rand(0, count($this->users)-1)])
                ->setPriceList($this->priceLists[rand(0, count($this->priceLists)-1)])
                ->setVatRequired($vatRequired)
                ->setVatAmount(empty($vatRequired) ? 0 : $this->faker->randomFloat(2, 0.1, 0.4))
                ->setDiscount($this->faker->randomFloat(2, 0.1, 0.5))
                ->setStatus(1)
            ;

            $manager->persist($contractList);
        }
    }
}
