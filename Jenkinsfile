pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Surajsuthar01/demo-repo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-httpd .'
            }
        }

        stage('Save Docker Image as Tar') {
            steps {
                sh 'docker save -o my-httpd.tar my-httpd'
            }
        }

        stage('Copy Docker Image to Remote') {
            steps {
                sh 'scp my-httpd.tar root@192.168.80.137:/tmp/'
            }
        }

        stage('Load Image and Deploy via Ansible') {
            steps {
                sh 'ansible-playbook -i /etc/ansible/hosts deploy.yml'
            }
        }
    }
}
