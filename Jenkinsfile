pipeline{
    agent any
    stages{
        stage("Clone Git Repo"){
            steps{
                git 'https://github.com/RutujaPawal/hello-worldnew.git'
            }
        }
        stage("Build Maven Project"){
            steps{
                sh "mvn clean install"
            }
        }
        stage('Docker Build and Tag') {
           steps {
                sh 'docker build -t samplewebapp:latest .' 
                sh 'docker tag samplewebapp rutujapawal/samplewebapp:latest'
                }
          }
    }
}   
