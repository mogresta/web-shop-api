<?php

namespace App\Entity;

use ApiPlatform\Doctrine\Orm\Filter\RangeFilter;
use ApiPlatform\Doctrine\Orm\Filter\SearchFilter;
use ApiPlatform\Elasticsearch\Filter\OrderFilter;
use ApiPlatform\Metadata\ApiFilter;
use ApiPlatform\Metadata\ApiResource;
use ApiPlatform\Metadata\Get;
use ApiPlatform\Metadata\GetCollection;
use App\Controller\ProductController;
use App\Repository\ProductRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Attribute\Groups;

#[ORM\Entity(repositoryClass: ProductRepository::class)]
#[ApiResource(
    operations: [
        new Get(
            normalizationContext: [
                'groups' => [
                    'product:read',
                ]
            ],
        ),
        new GetCollection(
            paginationItemsPerPage: 10,
            normalizationContext: [
                'groups' => [
                    'product:index',
                ]
            ],
        ),
    ],
)]
#[ApiFilter(OrderFilter::class, properties: ['id' =>  'DESC', 'name', 'price'], arguments: ['orderParameterName' => 'order'])]
class Product
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    #[Groups(['product:read', 'product:index'])]
    private ?int $id = null;

    #[ORM\Column(type: Types::TEXT)]
    #[ApiFilter(SearchFilter::class, strategy:'partial')]
    #[Groups(['product:read', 'category:read', 'product:index'])]
    private ?string $sku = null;

    #[ORM\Column(type: Types::TEXT)]
    #[ApiFilter(SearchFilter::class, strategy:'partial')]
    #[Groups(['product:read', 'category:read', 'product:index'])]
    private ?string $name = null;

    #[ORM\Column(type: Types::TEXT)]
    #[ApiFilter(SearchFilter::class, strategy:'partial')]
    #[Groups(['product:read'])]
    private ?string $description = null;

    #[ORM\Column]
    #[ApiFilter(RangeFilter::class)]
    #[Groups(['product:read'])]
    private ?float $price = null;

    #[ORM\Column]
    private ?\DateTime $createdAt;

    #[ORM\OneToMany(mappedBy: 'product', targetEntity: ProductCategory::class)]
    #[Groups(['product:read', 'product:index'])]
    #[ApiFilter(SearchFilter::class, strategy:'partial', properties: ['productCategories.category.name'])]
    private Collection $productCategories;

    public function __construct()
    {
        $this->createdAt = new \DateTime();
        $this->productCategories = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getSku(): ?string
    {
        return $this->sku;
    }

    public function setSku(string $sku): static
    {
        $this->sku = $sku;

        return $this;
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

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): static
    {
        $this->description = $description;

        return $this;
    }

    public function getPrice(): ?float
    {
        return $this->price;
    }

    public function setPrice(float $price): static
    {
        $this->price = $price;

        return $this;
    }

    public function getCreatedAt(): ?\DateTime
    {
        return $this->createdAt;
    }

    /**
     * @return Collection<int, ProductCategory>
     */
    public function getProductCategories(): Collection
    {
        return $this->productCategories;
    }

    public function addProductCategory(ProductCategory $productCategory): static
    {
        if (!$this->productCategories->contains($productCategory)) {
            $this->productCategories->add($productCategory);
            $productCategory->setProduct($this);
        }

        return $this;
    }

    public function removeProductCategory(ProductCategory $productCategory): static
    {
        if ($this->productCategories->removeElement($productCategory)) {
            // set the owning side to null (unless already changed)
            if ($productCategory->getProduct() === $this) {
                $productCategory->setProduct(null);
            }
        }

        return $this;
    }
}
