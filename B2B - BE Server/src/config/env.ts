import dotenv from 'dotenv';

dotenv.config();

export const config = {
  databaseUrl: process.env.DATABASE_URL!,
  jwtSecret: process.env.JWT_SECRET!,
  openaiApiKey: process.env.OPENAI_API_KEY!,
  port: process.env.PORT || '3000',
};