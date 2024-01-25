<?php

namespace App\Repository;

use App\Entity\ContractList;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\OptimisticLockException;
use Doctrine\ORM\ORMException;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<ContractList>
 *
 * @method ContractList|null find($id, $lockMode = null, $lockVersion = null)
 * @method ContractList|null findOneBy(array $criteria, array $orderBy = null)
 * @method ContractList[]    findAll()
 * @method ContractList[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ContractListRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, ContractList::class);
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function save(ContractList $entity): void
    {
        $this->_em->persist($entity);
        $this->_em->flush();
    }

    /**
     * @throws ORMException
     * @throws OptimisticLockException
     */
    public function remove(ContractList $entity): void
    {
        $this->_em->remove($entity);
        $this->_em->flush();
    }
}
