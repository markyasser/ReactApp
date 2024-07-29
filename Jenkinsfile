pipeline {
    agent any

    environment {
        // Define the Docker image name
        IMAGE_NAME = 'task-manager'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from your version control system
                git branch: 'main', url: 'https://github.com/your-repo/task-manager.git'
            }
        }

        stage('Build') {
            steps {
                script {
                    // Build the Docker image locally
                    sh 'docker build -t $IMAGE_NAME .'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Stop and remove any running container with the same name
                    sh '''
                        if [ "$(docker ps -q -f name=task-manager)" ]; then
                            docker stop task-manager
                            docker rm task-manager
                        fi
                    '''
                    // Run the new container
                    sh 'docker run -d -p 5000:5000 --name task-manager $IMAGE_NAME'
                }
            }
        }
    }

    post {
        always {
            // Clean up workspace after build
            cleanWs()
        }
    }
}
