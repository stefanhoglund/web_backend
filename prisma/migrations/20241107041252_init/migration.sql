-- CreateTable
CREATE TABLE "User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "dob" DATETIME NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT false,
    "activationCode" INTEGER NOT NULL DEFAULT 111066,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "ShoppingPreference" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "PasswordRequest" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "resetKey" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "_ShoppingPreferenceToUser" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_ShoppingPreferenceToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "ShoppingPreference" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_ShoppingPreferenceToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "ShoppingPreference_name_key" ON "ShoppingPreference"("name");

-- CreateIndex
CREATE UNIQUE INDEX "_ShoppingPreferenceToUser_AB_unique" ON "_ShoppingPreferenceToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_ShoppingPreferenceToUser_B_index" ON "_ShoppingPreferenceToUser"("B");
