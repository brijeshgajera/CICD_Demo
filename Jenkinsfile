pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh "sudo chmod -R 777 *"
                sh "ls -lat"
                echo "Pulling robotframework docker image"
                script{
                    myImage = docker.image("ppodgorsek/robot-framework:latest")
                    myImage.pull()
                }
            }
        }
        stage('Setup') {
            steps {
                echo "Bringing up setup using docker-compose..."
                sh 'docker-compose up -d'
                sh 'docker exec -i website sh -c "docker-php-ext-install mysqli"'
                sh 'docker container restart website'
            }
        }
        stage('Test') {
            steps {
                echo "Executing robot scripts in container"
                sh 'docker run -v /var/lib/jenkins/workspace/CICD_Demo/robotframework/reports:/opt/robotframework/reports:Z -v /var/lib/jenkins/workspace/CICD_Demo/robotframework/tests:/opt/robotframework/tests:Z --network=cicd_demo_robot --rm -e ROBOT_OPTIONS="--variable SERVER:172.28.1.3" ppodgorsek/robot-framework:latest'
            }
        }
    }
}
