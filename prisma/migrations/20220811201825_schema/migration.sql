-- CreateTable
CREATE TABLE "Cliente" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "mail" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Agricultor" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "mail" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Campo" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "agricultorId" INTEGER NOT NULL,
    CONSTRAINT "Campo_agricultorId_fkey" FOREIGN KEY ("agricultorId") REFERENCES "Agricultor" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Variedad" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- CreateTable
CREATE TABLE "Fruta" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT
);

-- CreateTable
CREATE TABLE "VariedadOnFrutas" (
    "frutaId" INTEGER NOT NULL,
    "variedadId" INTEGER NOT NULL,

    PRIMARY KEY ("frutaId", "variedadId"),
    CONSTRAINT "VariedadOnFrutas_frutaId_fkey" FOREIGN KEY ("frutaId") REFERENCES "Fruta" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "VariedadOnFrutas_variedadId_fkey" FOREIGN KEY ("variedadId") REFERENCES "Variedad" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Cosechas" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "variedadOnFrutasFrutaId" INTEGER NOT NULL,
    "variedadOnFrutasVariedadId" INTEGER NOT NULL,
    "clienteId" INTEGER NOT NULL,
    "agricultorId" INTEGER NOT NULL,
    "campoId" INTEGER NOT NULL,
    CONSTRAINT "Cosechas_variedadOnFrutasFrutaId_variedadOnFrutasVariedadId_fkey" FOREIGN KEY ("variedadOnFrutasFrutaId", "variedadOnFrutasVariedadId") REFERENCES "VariedadOnFrutas" ("frutaId", "variedadId") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Cosechas_clienteId_fkey" FOREIGN KEY ("clienteId") REFERENCES "Cliente" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Cosechas_agricultorId_fkey" FOREIGN KEY ("agricultorId") REFERENCES "Agricultor" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Cosechas_campoId_fkey" FOREIGN KEY ("campoId") REFERENCES "Campo" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Cliente_mail_key" ON "Cliente"("mail");

-- CreateIndex
CREATE UNIQUE INDEX "Agricultor_mail_key" ON "Agricultor"("mail");

-- CreateIndex
CREATE UNIQUE INDEX "Campo_name_location_key" ON "Campo"("name", "location");
