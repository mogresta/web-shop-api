<?php

namespace App\Entity;

use App\Repository\PriceListRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: PriceListRepository::class)]
class PriceList
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(type: Types::TEXT)]
    private ?string $name = null;

    #[ORM\Column]
    private ?bool $status = null;

    #[ORM\OneToMany(mappedBy: 'priceList', targetEntity: PriceListProduct::class)]
    private Collection $products;

    #[ORM\OneToMany(mappedBy: 'priceList', targetEntity: ContractList::class)]
    private Collection $contractLists;

    public function __construct()
    {
        $this->products = new ArrayCollection();
        $this->contractLists = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): static
    {
        $this->name = $name;

        return $this;
    }

    public function isStatus(): ?bool
    {
        return $this->status;
    }

    public function setStatus(bool $status): static
    {
        $this->status = $status;

        return $this;
    }

    /**
     * @return Collection<int, PriceListProduct>
     */
    public function getProducts(): Collection
    {
        return $this->products;
    }

    public function addProducts(PriceListProduct $product): static
    {
        if (!$this->products->contains($product)) {
            $this->products->add($product);
            $product->setPriceList($this);
        }

        return $this;
    }

    public function removeProduct(PriceListProduct $product): static
    {
        if ($this->products->removeElement($product)) {
            // set the owning side to null (unless already changed)
            if ($product->getPriceList() === $this) {
                $product->setPriceList(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, ContractList>
     */
    public function getContractLists(): Collection
    {
        return $this->contractLists;
    }

    public function addContractList(ContractList $contractList): static
    {
        if (!$this->contractLists->contains($contractList)) {
            $this->contractLists->add($contractList);
            $contractList->setPriceList($this);
        }

        return $this;
    }

    public function removeContractList(ContractList $contractList): static
    {
        if ($this->contractLists->removeElement($contractList)) {
            // set the owning side to null (unless already changed)
            if ($contractList->getPriceList() === $this) {
                $contractList->setPriceList(null);
            }
        }

        return $this;
    }
}
