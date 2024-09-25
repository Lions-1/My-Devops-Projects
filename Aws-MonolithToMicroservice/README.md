# Building Microservices and a CI/CD Pipeline with AWS
In this project, I transformed a monolithic application into a microservices-based architecture, leveraging AWS services to deploy, manage, and monitor the application. The project demonstrates how to deploy microservices using Amazon ECS, ECR, and Fargate, while automating the entire process using AWS CodeCommit, CodeDeploy, and CodePipeline. The application was designed for a coffee supplier management system, aiming to improve scalability, reliability, and flexibility.
## Project Report
You can read and also download the full  report [here](Building_Microservices_Aws.pdf).


## Key Technologies
- **Amazon VPC**: Securely hosts our microservices in an isolated cloud network.
- **Amazon EC2 & Load Balancer**: Ensures high availability and load balancing across microservices.
- **AWS CodeCommit, CodeDeploy & CodePipeline**: Automates code deployment and ensures a smooth CI/CD workflow.
- **Amazon ECS & ECR**: Manages containerized microservices and stores Docker images.
- **AWS Cloud9**: Cloud-based IDE for development and deployment.
- **Amazon RDS & CloudWatch**: Manages the database and monitors performance.

## Application Architecture
This application was developed using a microservices architecture, deployed on AWS. Each microservice has its own Docker container, and we used ECS with Fargate to manage these containers. The architecture includes an Application Load Balancer to distribute traffic and a CI/CD pipeline for continuous deployment.

![diagramme](https://github.com/user-attachments/assets/dbefc78a-eae4-4e1d-96d5-f949d5a60528)

## Microservices Deployed
- **Customer Microservice**: Manages customer-related data and operations.
- **Employee Microservice**: Handles employee-related tasks, with a focus on administrative operations.
  
Each microservice was containerized using Docker, and Docker images were pushed to Amazon ECR. These images were deployed in ECS clusters, with tasks defined for each service.

## Deployment Strategy
### Infrastructure Setup
- Created an **Amazon VPC** to ensure network isolation.
- Used **Amazon EC2** and **Application Load Balancer** for scalability and traffic distribution.
- Set up **Amazon ECS** to orchestrate Docker containers, with Fargate providing serverless compute capacity.
  
### CI/CD Pipeline
- **AWS CodeCommit**: Stores the source code for the application and microservices.
- **AWS CodeDeploy & CodePipeline**: Automates the build, testing, and deployment of the microservices. This allows for seamless blue/green deployments.
  
The pipeline automates the deployment of Docker images from ECR to ECS, ensuring smooth and error-free deployment of new versions.

<img width="770" alt="ci cd works" src="https://github.com/user-attachments/assets/a48818b7-e6c8-41ca-b48f-620c1add9c1d">


## Monitoring with CloudWatch & ALB
We used **Amazon CloudWatch** to monitor the health and performance of the application. CloudWatch logs provided insights into the application’s resource usage, and alerts were set up to notify on anomalies. 

The **Application Load Balancer** (ALB) was configured to route traffic between microservices and monitor their health using target groups and health checks.

## Steps to Deploy
### 1. Set up AWS Cloud9 for Development
The first step was setting up AWS Cloud9 to serve as the integrated development environment (IDE). The source code was copied to this IDE, where the necessary adjustments were made to convert the monolithic application into microservices.

### 2. Containerization with Docker
Each microservice was containerized using Docker. Dockerfiles were created for both the customer and employee microservices, and Docker containers were tested locally in AWS Cloud9.

### 3. Push Docker Images to ECR
The Docker images were tagged and pushed to **Amazon Elastic Container Registry (ECR)**, where they would be retrieved by the ECS tasks during deployment.
<img width="924" alt="verif of the ecr" src="https://github.com/user-attachments/assets/91c71392-a2b3-4d6e-9d7f-0939b03872a0">

### 4. Deploy ECS Cluster and Tasks
An ECS cluster was created using **AWS Fargate** to manage the Docker containers. Each microservice was defined as a task within the ECS cluster.


### 5. Create CI/CD Pipeline
A fully automated CI/CD pipeline was built using AWS CodePipeline and CodeDeploy, integrating with ECS to manage the deployment of the microservices. The pipeline is triggered by commits to CodeCommit and updates the application on ECS with the latest changes.

## Monitor with CloudWatch & ALB
We set up monitoring using **CloudWatch** and configured an **Application Load Balancer** to distribute traffic between different ECS services. Health checks and scaling were managed through target groups.

## Access the Application
Once the application is deployed, the frontend can be accessed via the **AWS Application Load Balancer (ALB)** external DNS or IP, which routes traffic to the appropriate microservices running on ECS.


## Images of the Working Application

### Application in Action:
![coffeShop](https://github.com/user-attachments/assets/1a6d7c56-f70b-48d3-873e-881821fb60c3)


## Conclusion
This project showcases how to build, containerize, and deploy microservices in a production-ready AWS environment, fully automated through a CI/CD pipeline. It ensures high availability, scalability, and efficient monitoring for microservice-based applications.


## Contact
For questions or more information, feel free to reach out via LinkedIn 



