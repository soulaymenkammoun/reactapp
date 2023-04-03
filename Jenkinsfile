pipeline {
    agent any

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
                    def imageName = "reactapp"
                    def imageTag = "latest"
                    def dockerfile = "Dockerfile"
                    def dockerImage = docker.build("${imageName}:${imageTag}", "-f ${dockerfile} .")
                }
            }
        }

        	 stage('Docker login') {
    	agent any
      steps {
        sh 'echo "login Docker ...."'
      	sh 'docker login -u soulaymendocker123 -p 123456789'
      }
  }
        stage('Push Docker Image') {
            steps {
                script {
                        def imageName = "reactapp"
                        def imageTag = "latest"
                        def dockerImage = docker.image("${imageName}:${imageTag}")
                        dockerImage.push()
                    }
                }
            }
        
        
    }
}
