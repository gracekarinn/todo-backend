/*
  Warnings:

  - The values [Akedemik] on the enum `Type` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "Type_new" AS ENUM ('Akademik', 'PekerjaanRumah', 'Kepanitaan');
ALTER TABLE "Task" ALTER COLUMN "category" TYPE "Type_new" USING ("category"::text::"Type_new");
ALTER TYPE "Type" RENAME TO "Type_old";
ALTER TYPE "Type_new" RENAME TO "Type";
DROP TYPE "Type_old";
COMMIT;
