<?php

namespace App\Repository;

use App\Entity\OrderType;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\OptimisticLockException;
use Doctrine\ORM\ORMException;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<OrderType>
 *
 * @method OrderType|null find($id, $lockMode = null, $lockVersion = null)
 * @method OrderType|null findOneBy(array $criteria, array $orderBy = null)
 * @method OrderType[]    findAll()
 * @method OrderType[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class OrderTypeRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, OrderType::class);
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function save(OrderType $entity): void
    {
        $this->_em->persist($entity);
        $this->_em->flush();
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function remove(OrderType $entity): void
    {
        $this->_em->remove($entity);
        $this->_em->flush();
    }
}
