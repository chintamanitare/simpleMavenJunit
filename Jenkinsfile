pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'dependabot/maven/junit-junit-4.13.1', url: 'https://github.com/chintamanitare/simpleMavenJunit.git'
            }
        }
        
        stage('Build & Package') {
            steps {
                sh 'mvn clean package'
            }
        }
    }
}
