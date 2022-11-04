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
    }
}   
