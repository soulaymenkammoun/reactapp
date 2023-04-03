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
            docker build -t reactapp
       dockerImage = docker.build("soulaymendocker123/reactapp:latest")
    }
    
         stage('Push image') {
             docker push soulaymendocker123/reactapp:latest
           
        }
    }
    }
}
