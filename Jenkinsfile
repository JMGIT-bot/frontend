pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/JMGIT-bot/frontend.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Build Vue') {
            steps {
                sh 'npm run build'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker-compose restart nginx'  // Nginx 다시 시작 (Vue 반영)
            }
        }
    }
}
