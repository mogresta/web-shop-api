<?php

namespace App\Repository;

use App\Entity\PriceListProduct;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\OptimisticLockException;
use Doctrine\ORM\ORMException;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<PriceListProduct>
 *
 * @method PriceListProduct|null find($id, $lockMode = null, $lockVersion = null)
 * @method PriceListProduct|null findOneBy(array $criteria, array $orderBy = null)
 * @method PriceListProduct[]    findAll()
 * @method PriceListProduct[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PriceListProductRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, PriceListProduct::class);
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function save(PriceListProduct $entity): void
    {
        $this->_em->persist($entity);
        $this->_em->flush();
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function remove(PriceListProduct $entity): void
    {
        $this->_em->remove($entity);
        $this->_em->flush();
    }
}
