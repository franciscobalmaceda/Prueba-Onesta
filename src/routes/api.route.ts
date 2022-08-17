const router = require('express').Router();
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

router.get('/', async (req: any, res: { send: (arg0: { message: string; }) => void; }, next: any) => {
  res.send({ message: 'Ok api is working 🚀' });
});

router.get('/cosechas', async (req: any, res: { json: (arg0: any) => void; }, next: (arg0: any) => void) => {
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

router.post('/cliente', async (req: { body: any; }, res: { json: (arg0: any) => void; }, next: (arg0: any) => void) => {
  try {
    const cliente = await prisma.cliente.create({
      data: req.body
    });
    console.log(cliente);
    res.json(cliente);
  } catch (error) {
    console.log(error);
    next(error)
  }
});

router.post('/campo', async (req: { body: any; }, res: { json: (arg0: any) => void; }, next: (arg0: any) => void) => {
  try {
    const campo = await prisma.campo.create({
      data: req.body
    });
    console.log(campo);
    res.json(campo);
  } catch (error) {
    console.log(error);
    next(error)
  }
});

router.post('/agricultor', async (req: { body: any; }, res: { json: (arg0: any) => void; }, next: (arg0: any) => void) => {
  try {
    const agricultor = await prisma.agricultor.create({
      data: req.body
    });
    console.log(agricultor);
    res.json(agricultor);
  } catch (error) {
    console.log(error);
    next(error)
  }
});

router.post('/fruta', async (req: { body: any; }, res: { json: (arg0: any) => void; }, next: (arg0: any) => void) => {
  try {
    const fruta = await prisma.fruta.create({
      data: req.body
    });
    console.log(fruta);
    res.json(fruta);
  } catch (error) {
    console.log(error);
    next(error)
  }
});

module.exports = router;
