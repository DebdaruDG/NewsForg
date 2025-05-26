import { PrismaClient } from '@prisma/client';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { config } from '../config/env';
import { v4 as uuidv4 } from 'uuid';


const prisma = new PrismaClient();

export async function login(email: string, password: string) {
  const user = await prisma.user.findUnique({ where: { email } });
  if (!user || !bcrypt.compareSync(password, user.passwordHash)) {
    throw new Error('Invalid credentials');
  }
  if (!user.isActive) {
    throw new Error('Account is inactive');
  }
  const token = jwt.sign({ userId: user.id }, config.jwtSecret, { expiresIn: '1h' });
  return { token, user };
}


export async function signup(name: string, email: string, password: string) {
  const existingUser = await prisma.user.findUnique({ where: { email } });
  if (existingUser) {
    throw new Error('Email already exists');
  }
  const passwordHash = await bcrypt.hash(password, 10);
  const user = await prisma.user.create({
    data: {
      id: uuidv4(),
      name,
      email,
      passwordHash: passwordHash,
      isActive: true,
      createdAt: new Date(),
    },
  });
  return user;
}