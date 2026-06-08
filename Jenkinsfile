pipeline {
    agent any
    
    environment {
        // 1. REPLACE WITH YOUR ACTUAL DOCKER HUB USERNAME AND REPO NAME
        DOCKER_REPO = 'chintamani1804/simple-maven-app'
        IMAGE_TAG   = "${BUILD_NUMBER}"
        
        // 2. This matches the exact credential ID you created
        DOCKER_CREDS = credentials('DockerID')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'dependabot/maven/junit-junit-4.13.1', url: 'https://github.com/chintamanitare/simpleMavenJunit.git'
            }
        }
        
        stage('Build Jar') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('Docker Build') {
            steps {
                // Builds the docker image and tags it with both the build number and 'latest'
                sh "docker build -t ${DOCKER_REPO}:${IMAGE_TAG} -t ${DOCKER_REPO}:latest ."
            }
        }
        
        stage('Docker Push') {
            steps {
                // Securely logs into Docker Hub and pushes the images
                sh "echo \$DOCKER_CREDS_PSW | docker login -u \$DOCKER_CREDS_USR --password-stdin"
                sh "docker push ${DOCKER_REPO}:${IMAGE_TAG}"
                sh "docker push ${DOCKER_REPO}:latest"
            }
        }
    }
    
    
}
