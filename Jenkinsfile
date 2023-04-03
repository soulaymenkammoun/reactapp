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

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dckr_pat_Xyb5Qdmg9w0Qgme9NdF-Jw_bzoo', usernameVariable: 'soulaymendocker123')]) {
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
}
