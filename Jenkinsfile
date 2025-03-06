pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "httpd"  // Name of the Docker image
        DOCKER_TAG = "latest"    // Tag for the Docker image
        ANSIBLE_INVENTORY = "inventory"  // Path to the Ansible inventory file
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
                // Build the Docker image
                sh "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
            }
        }

        // Optional: Push Docker Image stage
        /*
        stage('Push Docker Image') {
            steps {
                script {
                    // Uncomment and configure the following lines if you have a Docker registry
                    // withCredentials([usernamePassword(credentialsId: 'docker-registry-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    //     sh "echo ${DOCKER_PASS} | docker login -u ${DOCKER_USER} --password-stdin your-registry-url"
                    //     sh "docker tag ${DOCKER_IMAGE}:${DOCKER_TAG} your-registry-url/${DOCKER_IMAGE}:${DOCKER_TAG}"
                    //     sh "docker push your-registry-url/${DOCKER_IMAGE}:${DOCKER_TAG}"
                    // }
                }
            }
        }
        */

        stage('Deploy with Ansible') {
            steps {
                // Run the Ansible playbook to deploy the container
                sh "ansible-playbook -i ${ANSIBLE_INVENTORY} deploy.yml"
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
