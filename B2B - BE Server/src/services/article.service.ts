import { PrismaClient } from '@prisma/client';
import { v4 as uuidv4 } from 'uuid';

const prisma = new PrismaClient();

interface CreateArticleInput {
  title: string;
  content: string;
  summary: string;
  status: string;
  companyId: string;
  createdBy: string;
}

export async function createArticle(input: CreateArticleInput) {
  const { title, content, summary, status, companyId, createdBy } = input;
  const article = await prisma.newsArticle.create({
    data: {
      id: uuidv4(),
      title,
      content,
      summary,
      status,
      createdBy: createdBy,
      assignedTo: createdBy,
      companyId: companyId,
      createdAt: new Date(),
    },
  });

  await prisma.articleStatusHistory.create({
    data: {
      id: uuidv4(),
      articleId: article.id,
      fromStatus: 'none',
      toStatus: status,
      changedBy: createdBy,
      changedAt: new Date(),
    },
  });

  return article;
}