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
         stage('Build image') {
            
       dockerImage = docker.build("soulaymendocker123/reactapp:latest")
    }
    
         stage('Push image') {
             withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
                 dockerImage.push()
        }
    }
    }
}
