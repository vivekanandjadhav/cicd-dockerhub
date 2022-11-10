pipeline {
    agent any
    tools{
        maven "Maven3"
    }
    stages{
        stage("Build Maven Project"){
            steps{
               checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/RutujaPawal/CI-CD-using-Docker.git']]])
               sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t rutujapawal/devops-integration .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                      sh 'docker login -u rutujapawal -p ${dockerhubpwd}'
                      
                      sh 'docker push rutujapawal/devops-integration'
                    }    
                }
            }
        }
	stage('Run Docker container on Jenkins Agent') {
            steps {	    
                      sh "docker run -d -p 8003:8080 rutujapawal/devops-integration"
                 }
            }
	 stage('Run Docker container on remote hosts') {
             steps {
                sh "docker -H ssh://jenkins@13.234.231.172 run -d -p 8003:8080 rutujapawal/devops-integration"
            }    
        }
}  
