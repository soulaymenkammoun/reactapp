pipeline {
    agent any
environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
    stages {
        stage('Gut hub pull stage ') {
            steps {
                script{
                    checkout([$class: 'GitSCM' , branches: [[name: '*/master']] ,
                       userRemoteConfigs: [[
                           
                           url :'https://github.com/soulaymenkammoun/reactapp.git']]])
                }
            
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t soulaymendocker123/reactapp:latest .'
                }
            }
        }

        	 stage('Docker login') {
    	agent any
      steps {
        sh 'echo "login Docker ...."'
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
  }
        stage('Push Docker Image') {
            steps {
                script {
                        sh 'docker push soulaymendocker123/reactapp:latest'
                    }
                }
            }
        
        
    }
}
