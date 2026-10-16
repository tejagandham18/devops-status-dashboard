
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Test') {
            steps {
                bat '''
                    py -3 -m venv .venv
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
