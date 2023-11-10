pipeline {
    agent any
    tools {
        maven "Maven"
    }
    stages {
        stage('build image') {
            steps {
                echo "building Maven application..."
                sh "mvn clean package --DskipTests=true"          
            }

            steps{
                echo "Building Dockerfile"
                script {
                withCredentials([usernamePassword(credentialsId: 'DockerHub-secret', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                    sh 'docker build -t agasprosper/employee-management-frontend:${BUILD_ID} .'
                    sh "echo $PASS | docker login -u $USER --password-stdin"
                    sh 'docker push agasprosper/employee-management-frontend:${BUILD_ID}'
                    }
                }
            } 
        }
        stage('deploy') {
            steps {
                echo "this is the deploy stage" 
            }
        }
    }
}

