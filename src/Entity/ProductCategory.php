<?php

namespace App\Entity;

use ApiPlatform\Doctrine\Orm\Filter\SearchFilter;
use ApiPlatform\Metadata\ApiFilter;
use ApiPlatform\Metadata\ApiResource;
use App\Repository\ProductCategoryRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Attribute\Groups;

#[ORM\Entity(repositoryClass: ProductCategoryRepository::class)]
#[ApiResource(
    operations:[],
)]
class ProductCategory
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\ManyToOne(inversedBy: 'productCategories')]
    #[ORM\JoinColumn(nullable: false)]
    #[Groups(['category:read'])]
    #[ApiFilter(SearchFilter::class, strategy:'partial')]
    private ?Product $product = null;

    #[ORM\ManyToOne(inversedBy: 'productCategories')]
    #[ORM\JoinColumn(nullable: false)]
    #[Groups(['product:read', 'product:index'])]
    #[ApiFilter(SearchFilter::class, strategy:'partial')]
    private ?Category $category = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getProduct(): ?Product
    {
        return $this->product;
    }

    public function setProduct(?Product $product): static
    {
        $this->product = $product;

        return $this;
    }

    public function getCategory(): ?Category
    {
        return $this->category;
    }

    public function setCategory(?Category $category): static
    {
        $this->category = $category;

        return $this;
    }
}
