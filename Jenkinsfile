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
                script {
                    // Nginx 컨테이너 이름 정의
                    def nginxContainerName = 'nginx'

                    // Nginx 컨테이너의 웹 루트 디렉토리 경로 정의
                    def nginxWebRoot = '/usr/share/nginx/html/'

                    // Nginx 컨테이너에 dist 폴더의 내용 복사
                    sh "docker cp dist/. ${nginxContainerName}:${nginxWebRoot}"

                    // Nginx 설정 재로드
                    sh "docker exec ${nginxContainerName} nginx -s reload"
                }
            }
        }
    }
}
