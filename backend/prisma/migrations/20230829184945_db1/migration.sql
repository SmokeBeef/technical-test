-- CreateTable
CREATE TABLE `user` (
    `id` VARCHAR(191) NOT NULL,
    `nama` VARCHAR(191) NOT NULL,
    `username` VARCHAR(100) NOT NULL,
    `password` TEXT NOT NULL,
    `role` ENUM('admin', 'penyetuju') NOT NULL,
    `createAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATE NOT NULL,

    UNIQUE INDEX `user_username_key`(`username`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `kendaraan` (
    `id` VARCHAR(191) NOT NULL,
    `nama` VARCHAR(255) NOT NULL,
    `plat` CHAR(10) NOT NULL,
    `tipe` ENUM('barang', 'orang') NOT NULL,
    `status` ENUM('dipakai', 'tidak_dipakai') NOT NULL,
    `createAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `supir` (
    `id` VARCHAR(191) NOT NULL,
    `nama` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `pemesanan` (
    `id` VARCHAR(191) NOT NULL,
    `idSupir` VARCHAR(191) NOT NULL,
    `idKendaraan` VARCHAR(191) NOT NULL,
    `idPemesan` VARCHAR(191) NOT NULL,
    `status` ENUM('proses', 'disetujui', 'selesai') NOT NULL,
    `createAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `pemesanan_idKendaraan_fkey`(`idKendaraan`),
    INDEX `pemesanan_idPemesan_fkey`(`idPemesan`),
    INDEX `pemesanan_idSupir_fkey`(`idSupir`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `detailkendaraan` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `idKendaraan` VARCHAR(191) NOT NULL,
    `odoMeter` INTEGER NOT NULL,
    `bbm` INTEGER NOT NULL,

    INDEX `detailKendaraan_idKendaraan_fkey`(`idKendaraan`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `detailpemesanan` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `idPemesanan` VARCHAR(191) NOT NULL,
    `idPenyetuju` VARCHAR(191) NOT NULL,
    `status` ENUM('belum', 'setuju') NOT NULL DEFAULT 'belum',

    INDEX `detailPemesanan_idPenyetuju_fkey`(`idPenyetuju`),
    INDEX `detailPemesanan_idPemesanan_fkey`(`idPemesanan`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `pemesanan` ADD CONSTRAINT `pemesanan_idPemesan_fkey` FOREIGN KEY (`idPemesan`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pemesanan` ADD CONSTRAINT `pemesanan_idKendaraan_fkey` FOREIGN KEY (`idKendaraan`) REFERENCES `kendaraan`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pemesanan` ADD CONSTRAINT `pemesanan_idSupir_fkey` FOREIGN KEY (`idSupir`) REFERENCES `supir`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `detailkendaraan` ADD CONSTRAINT `detailkendaraan_idKendaraan_fkey` FOREIGN KEY (`idKendaraan`) REFERENCES `kendaraan`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `detailpemesanan` ADD CONSTRAINT `detailpemesanan_idPenyetuju_fkey` FOREIGN KEY (`idPenyetuju`) REFERENCES `user`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `detailpemesanan` ADD CONSTRAINT `detailpemesanan_idPemesanan_fkey` FOREIGN KEY (`idPemesanan`) REFERENCES `pemesanan`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
