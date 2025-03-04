pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "my-web-app"
        DOCKER_TAG = "latest"
        DEPLOYMENT_VM = "root@192.168.80.137"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Surajsuthar01/demo-repo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}", ".")
                }
            }
        }

        stage('Deploy to Second VM') {
            steps {
                script {
                    ansiblePlaybook(
                        playbook: 'ansible-playbook/playbook.yml',
                        inventory: 'ansible-playbook/inventory',
                        credentialsId: 'your-ssh-credentials-id'
                    )
                }
            }
        }
    }
}
