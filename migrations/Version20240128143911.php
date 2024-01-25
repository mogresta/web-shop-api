<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20240128143911 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'Address table';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('CREATE TABLE address (id INT AUTO_INCREMENT NOT NULL, first_name LONGTEXT NOT NULL, last_name LONGTEXT NOT NULL, phone_number LONGTEXT DEFAULT NULL, street LONGTEXT NOT NULL, street2 LONGTEXT DEFAULT NULL, city LONGTEXT NOT NULL, state LONGTEXT DEFAULT NULL, country LONGTEXT NOT NULL, post_code VARCHAR(10) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('DROP TABLE address');
    }
}
