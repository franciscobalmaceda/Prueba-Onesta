/*
  Warnings:

  - Added the required column `name` to the `Fruta` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `Variedad` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Fruta" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);
INSERT INTO "new_Fruta" ("id") SELECT "id" FROM "Fruta";
DROP TABLE "Fruta";
ALTER TABLE "new_Fruta" RENAME TO "Fruta";
CREATE UNIQUE INDEX "Fruta_name_key" ON "Fruta"("name");
CREATE TABLE "new_Variedad" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);
INSERT INTO "new_Variedad" ("id") SELECT "id" FROM "Variedad";
DROP TABLE "Variedad";
ALTER TABLE "new_Variedad" RENAME TO "Variedad";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
