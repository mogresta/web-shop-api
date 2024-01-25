<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20240128152610 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Contract list table';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('CREATE TABLE contract_list (id INT AUTO_INCREMENT NOT NULL, customer_id INT NOT NULL, price_list_id INT NOT NULL, vat_required TINYINT(1) NOT NULL, vat_amount DOUBLE PRECISION NOT NULL, discount DOUBLE PRECISION NOT NULL, status TINYINT(1) NOT NULL, INDEX IDX_2CBDB6709395C3F3 (customer_id), INDEX IDX_2CBDB6705688DED7 (price_list_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE contract_list ADD CONSTRAINT FK_2CBDB6709395C3F3 FOREIGN KEY (customer_id) REFERENCES `user` (id)');
        $this->addSql('ALTER TABLE contract_list ADD CONSTRAINT FK_2CBDB6705688DED7 FOREIGN KEY (price_list_id) REFERENCES price_list (id)');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE contract_list DROP FOREIGN KEY FK_2CBDB6709395C3F3');
        $this->addSql('ALTER TABLE contract_list DROP FOREIGN KEY FK_2CBDB6705688DED7');
        $this->addSql('DROP TABLE contract_list');
    }
}
