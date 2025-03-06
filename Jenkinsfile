pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "httpd"
        DOCKER_TAG = "latest"
        ANSIBLE_INVENTORY = "etc/ansible/inventory"  // Relative path to your inventory file in the workspace
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout the code from GitHub
                git branch: 'main', url: 'https://github.com/Surajsuthar01/demo-repo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                }
            }
        }

        stage('Push Docker Image (Optional)') {
            steps {
                script {
                    // If you have a Docker registry, you can push the image here
                    // sh "docker login -u your-username -p your-password your-registry"
                    // sh "docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} your-registry/${DOCKER_IMAGE}:${DOCKER_TAG}"
                    // sh "docker push your-registry/${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }

        stage('Deploy with Ansible') {
            steps {
                script {
                    // Run the Ansible playbook to deploy the container
                    sh "ansible-playbook -i ${ANSIBLE_INVENTORY} ansible/deploy.yml"
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
