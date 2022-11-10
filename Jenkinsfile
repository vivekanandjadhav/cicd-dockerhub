Skip to content
Search or jump to…
Pull requests
Issues
Marketplace
Explore
 
@RutujaPawal 
RutujaPawal
/
devops-automation
Public
Code
Issues
Pull requests
Actions
Projects
Wiki
Security
Insights
Settings
devops-automation/Jenkinsfile
@RutujaPawal
RutujaPawal Update Jenkinsfile
Latest commit 8a3b195 23 hours ago
 History
 2 contributors
@basahota@RutujaPawal
33 lines (31 sloc)  1004 Bytes

pipeline {
    agent any
    tools{
        maven "Maven3"
    }
    stages{
        stage("Build Maven Project"){
            steps{
               checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Java-Techie-jt/devops-automation.git']]])
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
