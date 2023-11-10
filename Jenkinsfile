pipeline {
    agent any
    tools {
        maven "Maven"
    }
    stages {
        stage('build image') {
            steps {
                echo "building docker image"
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub credentials', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                        sh 'docker build -t agasprosper/backend-maven:${BUILD_ID} .'
                        sh "echo $PASS | docker login -u $USER --password-stdin"
                        sh 'docker push agasprosper/backend-maven:${BUILD_ID}'
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