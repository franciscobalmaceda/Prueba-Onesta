const router = require('express').Router();
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

router.get('/', async (req, res, next) => {
  res.send({ message: 'Ok api is working 🚀' });
});

router.get('/cosechas', async (req, res, next) => {
  try {
    const cosechas = await prisma.cosechas.findMany({
      include: { cliente: true, agricultor: true, varfrut: { include: { fruta: true, variedad: true } } }
    });
    console.log(cosechas);
    res.json(cosechas);
  } catch (error) {
    console.log(error);
    next(error)
  }
});

module.exports = router;
