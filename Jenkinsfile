pipeline {
    agent any

    environment {
        PROJECT_DIR = 'D:/github/hello-world-java-docker'
        DOCKER_IMAGE = 'hello-world-java-docker'
        DOCKER_TAG = 'latest'
        CONTAINER_NAME = 'hello-world-java-docker'
        PORT = '8080'
    }

    stages {
        stage('Cleanup Docker') {
            steps {
                echo '🧹 Cleaning up old Docker container and image...'
                bat """
                    docker stop ${CONTAINER_NAME} || echo Container not running
                    docker rm ${CONTAINER_NAME} || echo Container not found
                    docker rmi ${DOCKER_IMAGE}:${DOCKER_TAG} || echo Image not found
                """
            }
        }

        stage('Checkout') {
            steps {
                echo '🔄 Checking out source code...'
                dir("${PROJECT_DIR}") {
                    checkout scm
                }
            }
        }

        stage('Build with Maven') {
            steps {
                echo '🔧 Building Java project using Maven...'
                dir("${PROJECT_DIR}") {
                    bat 'mvn clean package'
                }
            }
        }



        stage('Build Docker Image') {
            steps {
                echo '🐳 Building Docker image...'
                dir("${PROJECT_DIR}") {
                    bat "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                echo "🚀 Running Docker container on port ${PORT}..."
                bat "docker run -d -p ${PORT}:8080 --name ${CONTAINER_NAME} ${DOCKER_IMAGE}:${DOCKER_TAG}"
            }
        }
    }

        stage('Run Robot Tests') {
            steps {
                echo '🧪 Running API and UI tests with Robot Framework...'
                dir("${PROJECT_DIR}/tests") {
                    bat 'robot -d results api/api_tests.robot ui/ui_tests.robot'
                }
            }
        }
    post {
        success {
            echo '✅ Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed. Check logs for details.'
        }
    }
}