# Microservices Deployment on GKE with Helm, HelmFile, Prometheus, and Grafana

![1_h39yLFkFHazJroZkOuC3kA](https://github.com/user-attachments/assets/4be1740a-6bd1-424e-869c-2ba125edfa74)

## Overview

This project demonstrates the deployment of a **microservices-based application** on **Google Kubernetes Engine (GKE)** using **Helm** and **HelmFile** for deployment orchestration. The application is monitored using **Prometheus** and **Grafana**, which provide real-time metrics and alerting capabilities. This setup ensures a scalable, observable, and automated deployment pipeline, utilizing best practices in cloud-native architectures.


---

## Architecture Diagram

![appArchitecture](https://github.com/user-attachments/assets/270a77a8-9f65-49f0-b9a2-623064639eed)


The architecture consists of several microservices (e.g., `emailservice`, `cartservice`, `currencyservice`, etc.) communicating with each other within the Kubernetes cluster. Each service has been containerized and deployed on GKE, managed by Kubernetes' deployment and service constructs.

Key components:
- **Helm & HelmFile**: Used for templating and managing the microservices deployment.
- **Google Kubernetes Engine (GKE)**: A fully managed Kubernetes service for deploying the application.
- **Prometheus**: Collects real-time metrics from the application.
- **Grafana**: Visualizes these metrics and creates dashboards for monitoring.

---

## Microservices Breakdown

### Services Deployed
The application consists of several key microservices:
- **Email Service**: Handles email notifications.
- **Cart Service**: Manages user shopping cart data.
- **Currency Service**: Converts currency rates in real-time.
- **Product Catalog Service**: Provides product information to the frontend.
- **Checkout Service**: Manages the checkout and payment process.
- **Frontend**: The user-facing component that integrates all other services.
- **Redis Cache**: Acts as the caching layer for fast data access.

Each microservice is deployed with the following features:
- Multiple replicas for high availability and scalability.
- Health checks (liveness and readiness probes) for ensuring service reliability.
- Resource limitations to optimize Kubernetes resource usage (CPU and memory).

### Example Service Deployment (Helm)


The application deployment is managed via Helm charts for each service, ensuring consistency and ease of deployment across environments. The HelmFile automates the process of applying multiple Helm charts simultaneously, ensuring the entire application is deployed correctly.

![deploymentsuccesgke](https://github.com/user-attachments/assets/c1d8b26a-e643-4f80-87a0-d3b5ce1d31ea)

---

## Monitoring and Alerting

### Prometheus Integration

Prometheus is configured to scrape metrics from each microservice, collecting real-time data on CPU usage, memory, request latencies, and error rates. These metrics help monitor the performance and health of the application.

### Grafana Dashboards

Grafana provides an intuitive interface to visualize Prometheus metrics. Custom dashboards were created for each microservice, allowing detailed monitoring of the system's performance.

- **System Resource Dashboard**: Monitors overall CPU, memory, and pod statuses.
- **Application Performance Dashboard**: Displays request rates, latencies, and error counts.



---

## Key Features

- **Automated Deployments**: Helm and HelmFile enable automated and templated deployments across environments.
- **Scalability**: Each microservice has replicas, ensuring the application can handle increased traffic and failure scenarios.
- **Monitoring**: Real-time monitoring and alerting through Prometheus and Grafana, providing insights into application performance.
- **Resilience**: Health checks and resource quotas ensure that each microservice is healthy and properly utilizing resources.

---

## Project Highlights

- **Helm & HelmFile**: Simplified the deployment process with templated configurations for each microservice.
- **GKE**: Leveraged Google's managed Kubernetes platform for scalable, fault-tolerant deployments.
- **Prometheus & Grafana**: Implemented an observability stack for comprehensive monitoring and alerting.
- **High Availability**: Each microservice is deployed with multiple replicas to handle traffic spikes and ensure availability.
- **Resource Management**: Kubernetes resource requests and limits ensure that services are optimally utilizing CPU and memory.

---

## Setup Instructions

To reproduce the setup in your environment, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-repo/microservices-gke.git
      ```
   ## Deploy Helm Charts

   Using HelmFile, deploy the application onto your GKE cluster:

```bash
   helmfile sync
   ```
or use the config.yaml 
```bash
   kubectl apply -f config.yaml 
   ```

## Monitor with Prometheus & Grafana

Prometheus and Grafana are deployed using Helm charts. After deployment, access the Grafana dashboard to monitor real-time metrics.

## Access the Application

Once deployed, you can access the frontend via the GKE LoadBalancer external IP.

---

## Images of the Working Application

  
- **Application in Action**:

![theWebsite](https://github.com/user-attachments/assets/efde934c-04da-4170-a89c-d76321ceb755)

---


## Contact

For questions or more information, feel free to reach out via [LinkedIn](your-linkedin-profile) or open an issue in the GitHub repository.



