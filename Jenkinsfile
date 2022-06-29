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
        stage('Run Pre-Processing File') {
            steps {
                script {
                    bat 'docker container exec model-1 python3 preprocessing.py'

                }

            }
        }
        stage('Run Training File') {
            steps {
                script {
                    bat 'docker container exec model-1 python3 train.py'

                }

            }
        }

        stage('Run Testing File') {
            steps {
                script {
                    bat 'docker container exec model-1 python3 test.py'

                }

            }
        }
        stage('Model Evaluation & Testing') {
            steps {
                script {
                    bat 'docker container exec model-1 cat /home/jovyan/results/train_metadata.json /home/jovyan/results/test_metadata.json'


                }

            }
        }
    }
}

