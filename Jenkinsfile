
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Check Python') {
            steps {
                bat '"C:\\Users\\Teja\\AppData\\Local\\Programs\\Python\\Python313\\python.exe" --version'
            }
        }

        stage('Test') {
            steps {
                bat '''
                    "C:\\Users\\Teja\\AppData\\Local\\Programs\\Python\\Python313\\python.exe" -m venv .venv
                    call .venv\\Scripts\\activate.bat
                    python -m pip install --upgrade pip
                    python -m pip install -r requirements.txt
                    python -m pytest Tests/ -v
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t devops-status-dashboard:1.0 .'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the console output.'
        }
    }
}
