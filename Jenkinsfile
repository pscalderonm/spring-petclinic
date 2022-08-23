#!groovy

pipeline{
  
  agent none
  stages {
    
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.5.0'
          args '-v $HOME/.m2:/root/.m2'
        }
      }
      steps {
        sh 'mvn clean install'
      }
    }
    
    
    stage('Sonar Qube Analysis'){
      agent {
        docker {
          image 'maven:amazoncorretto'
        }
      }
      steps{
        withSonarQubeEnv(installationName:'SonarCloudSpace', credentialsId:'sona-cloud-key'){
          sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.8.0.2131:sonar'
        }
      }
    }
    
    stage('Docker build') {
      agent any
      steps {
        sh 'docker build -t grupo07/spring-petclinic:latest .'
      }
    }
  }
}
