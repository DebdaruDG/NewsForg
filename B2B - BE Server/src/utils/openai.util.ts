import OpenAI from 'openai';
import { config } from '../config/env';

const openai = new OpenAI({ apiKey: config.openaiApiKey });

export async function summarizeContent(content: string) {
  try {
    const response = await openai.chat.completions.create({
      model: 'gpt-4',
      messages: [{ role: 'user', content: `Summarize this in 150 words or less: ${content}` }],
      max_tokens: 150,
    });
    return response.choices[0].message.content;
  } catch (error) {
    throw new Error('Failed to summarize content');
  }
}