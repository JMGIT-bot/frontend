pipeline {
    agent any
    tools {
        nodejs 'nodeJS'
    }

    stages {
        stage('github clone') {
            steps {
               git branch: 'main', credentialsId: 'github_account', url: 'https://github.com/JMGIT-bot/frontend.git'
            }
        }
         stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Install Docker') {
            steps {
                sh '''
                    curl -fsSL https://get.docker.com -o get-docker.sh
                    sh get-docker.sh
                    usermod -aG docker jenkins
                    newgrp docker
                '''
            }
        }
        
        stage('Set Vite Permissions') {
            steps {
                sh 'chmod +x node_modules/.bin/vite'
            }
        }
        stage('Build Vue') {
            steps {
                sh 'npm run build'
            }
        }
         stage('Deploy') {
            steps {
                sh 'docker cp dist/. 22aa50b36f96:/usr/share/nginx/html/'
            }
        }
    }
} 