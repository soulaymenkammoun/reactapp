Pipeline
{
agent any
  satges{
    stage ('Pull'){
      steps{
        script{
          checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/soulaymenkammoun/reactapp.git']])
    }
      }
    }
  }
}
