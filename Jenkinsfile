pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-flask-app'
        GIT_REPO_URL = 'https://github.com/yourusername/yourrepository.git'
        CONTAINER_NAME = 'my-flask-app'
    }

    stages {
        stage("Clone Code") {
            steps {
                echo "Cloning the code"
                git url: GIT_REPO_URL, branch: "main"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Stop Previous Container') {
            steps {
                script {
                    sh "docker stop $CONTAINER_NAME || true"
                    sh "docker rm $CONTAINER_NAME || true"
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    docker.image(DOCKER_IMAGE).run("-p 80:80 --name $CONTAINER_NAME")
                }
            }
        }
    }
}
