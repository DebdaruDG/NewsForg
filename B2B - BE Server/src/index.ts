import express from 'express';
import cors from 'cors';
import { config } from './config/env';
import { errorHandler } from './middleware/error.middleware';

const app = express();

app.use(cors({ origin: 'https://your-frontend.com' })); // Adjust origin as needed
app.use(express.json());

// API routes
app.use('/api/v1/auth', require('./api/v1/auth'));
app.use('/api/v1/companies', require('./api/v1/companies'));
app.use('/api/v1/articles', require('./api/v1/articles'));
app.use('/api/v1/roles', require('./api/v1/roles'));

// Swagger API documentation
import swaggerUi from 'swagger-ui-express';
import swaggerDocument from '../swagger.json';
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

app.use(errorHandler);

app.listen(config.port, () => {
  console.log(`Server running on port ${config.port}`);
});