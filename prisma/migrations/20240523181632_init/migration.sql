-- CreateEnum
CREATE TYPE "Type" AS ENUM ('Akedemik', 'PekerjaanRumah', 'Kepanitaan');

-- CreateTable
CREATE TABLE "Task" (
    "id" TEXT NOT NULL,
    "userID" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,
    "finish" BOOLEAN NOT NULL DEFAULT false,
    "category" "Type" NOT NULL,

    CONSTRAINT "Task_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Task_id_key" ON "Task"("id");
