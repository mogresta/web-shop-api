<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

final class Version20240128144926 extends AbstractMigration
{
    public function getDescription(): string
    {
        return 'User table';
    }

    public function up(Schema $schema): void
    {
        $this->addSql('CREATE TABLE `user` (id INT AUTO_INCREMENT NOT NULL, billing_address_id INT NOT NULL, shipping_address_id INT NOT NULL, first_name LONGTEXT NOT NULL, last_name LONGTEXT NOT NULL, password LONGTEXT NOT NULL, email LONGTEXT NOT NULL, INDEX IDX_8D93D64979D0C0E4 (billing_address_id), INDEX IDX_8D93D6494D4CFF2B (shipping_address_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE `user` ADD CONSTRAINT FK_8D93D64979D0C0E4 FOREIGN KEY (billing_address_id) REFERENCES address (id)');
        $this->addSql('ALTER TABLE `user` ADD CONSTRAINT FK_8D93D6494D4CFF2B FOREIGN KEY (shipping_address_id) REFERENCES address (id)');
    }

    public function down(Schema $schema): void
    {
        $this->addSql('ALTER TABLE `user` DROP FOREIGN KEY FK_8D93D64979D0C0E4');
        $this->addSql('ALTER TABLE `user` DROP FOREIGN KEY FK_8D93D6494D4CFF2B');
        $this->addSql('DROP TABLE `user`');
    }
}
