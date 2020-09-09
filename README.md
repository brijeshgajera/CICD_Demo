# Jenkins Pipeline - CICD - Demo

This project contains 4 major components.
Please follow this link to see execution step by step.
https://www.brijeshgajera.com/index.php/2020/09/04/docker-container-jenkins-pipeline-robotframework-demo/

### 1. Jenkins
   - Please refer Jenkinsfile to get more aboute it.
   - It has 3 different stages in pipeline.
      1. Build
         - This stage pulls Robotframework docker image from remote repository.
      2. Setup
         - This stage will setup necessary environment(containers) to run this application.
      3. Test
         - In this stage, testing will happen. Here we are going to test Login and Registration feature of Website.
      
### 2. Docker-Compose
   - Here we are using Docker-Compose to setup environment for this project. Please refer docker-compose.yml for the same.
   
### 3. Directory "website"
   - This directory contains website written in php. we are testing Login and Registration feature of website in pipeline.
   
### 4. Directory "robotframework"
   - This directory contains test cases written in robotframework.
