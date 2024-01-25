<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20240128151738 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Price list product table';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('CREATE TABLE price_list_product (id INT AUTO_INCREMENT NOT NULL, product_id INT NOT NULL, price_list_id INT NOT NULL, price DOUBLE PRECISION NOT NULL, INDEX IDX_FBD6B5BD4584665A (product_id), INDEX IDX_FBD6B5BD5688DED7 (price_list_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE price_list_product ADD CONSTRAINT FK_FBD6B5BD4584665A FOREIGN KEY (product_id) REFERENCES product (id)');
        $this->addSql('ALTER TABLE price_list_product ADD CONSTRAINT FK_FBD6B5BD5688DED7 FOREIGN KEY (price_list_id) REFERENCES price_list (id)');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE price_list_product DROP FOREIGN KEY FK_FBD6B5BD4584665A');
        $this->addSql('ALTER TABLE price_list_product DROP FOREIGN KEY FK_FBD6B5BD5688DED7');
        $this->addSql('DROP TABLE price_list_product');
    }
}
