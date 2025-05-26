import { Router } from 'express';
import { z } from 'zod';
import { createArticle } from '../../../services/article.service';
import { authenticateToken } from '../../../middleware/auth.middleware';
import { validateRequest } from '../../../middleware/validate.middleware';
import { summarizeContent } from '../../../utils/openai.util';
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

const router = Router();

const createArticleSchema = z.object({
  title: z.string().min(1),
  content: z.string().min(1),
  summary: z.string().min(1),
  status: z.enum(['draft', 'pending', 'published']),
  companyId: z.string().uuid(),
});

router.post('/', authenticateToken, validateRequest(createArticleSchema), async (req, res) => {
  try {
    const { title, content, summary, status, companyId } = req.body;
    const userId = req.user.userId;
    const article = await createArticle({ title, content, summary, status, companyId, createdBy: userId });
    res.status(201).json({ data: article, message: 'Article created', status: 201 });
  } catch (error) {
    throw new Error('Article creation failed');
  }
});


router.post('/:articleId/openai/summarize', authenticateToken, async (req, res) => {
  try {
    const { articleId } = req.params;
    const article = await prisma.newsArticle.findUnique({ where: { id: articleId } });
    if (!article) {
      return res.status(404).json({ error: 'Article not found' });
    }
    const summary = await summarizeContent(article.content);
    await prisma.newsArticle.update({
      where: { id: articleId },
      data: { summary },
    });
    res.json({ data: { summary }, message: 'Summary generated', status: 200 });
  } catch (error) {
    throw new Error('Summarization failed');
  }
});

export default router;