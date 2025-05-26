import { Router } from 'express';
import { z } from 'zod';
import { login } from '../../services/auth.service';
import { validateRequest } from '../../middleware/validate.middleware';

const router = Router();

const loginSchema = z.object({
  email: z.string().email(),
  password: z.string().min(6),
});

router.post('/login', validateRequest(loginSchema), async (req, res) => {
  try {
    const { email, password } = req.body;
    const { token, user } = await login(email, password);
    res.json({ data: { token, user: { id: user.id, name: user.name, email: user.email } }, message: 'Login successful', status: 200 });
  } catch (error) {
    throw new Error('Login failed');
  }
});

const signupSchema = z.object({
  name: z.string().min(1),
  email: z.string().email(),
  password: z.string().min(6),
});

router.post('/signup', validateRequest(signupSchema), async (req, res) => {
  try {
    const { name, email, password } = req.body;
    const user = await signup(name, email, password);
    res.status(201).json({ data: { id: user.id, name, email }, message: 'User created', status: 201 });
  } catch (error) {
    throw new Error('Signup failed');
  }
});

export default router;