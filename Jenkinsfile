pipeline {
    agent any

    environment {
        IMAGE_NAME = 'flask_app_image_1'
        CONTAINER_NAME = 'flask_app_container_1'
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Cloning from GitHub...'
                sh 'ls -la'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                    docker run -d --name $CONTAINER_NAME -p 5051:5000 $IMAGE_NAME
                '''
                echo 'Flask app is now running inside a Docker container!'
            }
        }
    }
}