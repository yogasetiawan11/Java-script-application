# 1. Project Prerequisites
- Before we touch the code, you’ll need these tools installed on your local machine or server:

- Node.js (v20+): The runtime for our services.

- Docker & Docker Compose: Essential for containerizing each microservice.

- MongoDB: We will use a "Database per Service" approach.

- Prometheus & Grafana: For metrics collection and visualization.

- Postman: For testing API endpoints.

# 2. Microservices Architecture & Folder Structure
We will use a Monorepo structure for learning purposes, which is easier to manage when starting out but allows each service to be deployed independently.

Proposed Structure

mern-microservices/
├── auth-service/           # User Auth, JWT, Security
├── product-service/        # Product Catalog
├── order-service/          # Order Processing
├── api-gateway/            # Nginx or Node-based Gateway
├── prometheus/             # Prometheus configuration
│   └── prometheus.yml
├── docker-compose.yml      # Orchestrates all services
└── .env                    # Root environment variables


## Inner Service Structure
Each service (e.g., auth-service) will follow this secure, layered pattern:

Plaintext

auth-service/
├── src/
│   ├── controllers/    # Request handling
│   ├── models/         # Mongoose schemas
│   ├── routes/         # API endpoints
│   ├── middleware/     # Security (JWT, Rate Limiting)
│   ├── services/       # Business logic
│   ├── utils/          # Metrics & Helpers
│   └── app.js          # Entry point
├── package.json
└── Dockerfile


# 3. Implementing Prometheus Metrics
To make this "DevOps ready," we'll use ``prom-client`` to expose metrics. Every service should have a ``/metrics ``endpoint that Prometheus can scrape.

## Step 1: Install Dependencies
In each service folder:

```sh
npm install prom-client express-prom-bundle
```

## Step 2: Metrics Instrumentation [utils/metrics.js](mern-microservices/auth-service/src/utils/metrics.js)
This helper creates a registry to track HTTP request duration and count

## Step 3: Expose Metrics in [app.js](mern-microservices/auth-service/src/app.js)

