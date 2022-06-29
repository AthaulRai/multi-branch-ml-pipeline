pipeline {
    agent any

    stages {
      
              stage('Checkout') {
                    steps {
                        checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'ml_pipeline', url: 'https://github.com/AthaulRai/multi-branch-ml-pipeline.git']]])
                    }
                }

               stage('Build') {
                    steps {

                        git branch: 'main',credentialsId: 'ml_pipeline', url: 'https://github.com/AthaulRai/multi-branch-ml-pipeline.git'
                    }
                }
                stage('Hello Message') {
                    steps {
                        echo 'Hello from Main branch'

                    }
                }
       }
}

