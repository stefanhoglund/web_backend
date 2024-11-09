import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  
  const newUser = await prisma.user.create({
    data: {
      email: "stefan.hoglund+1@gmail.com",
      username: "stefan1"
    }
  });

  console.log("New User:");
  console.log(newUser);


}

main()
  .catch((e) => {
    throw e;
  })
  .finally(async () => {
    await prisma.$disconnect();
  })

