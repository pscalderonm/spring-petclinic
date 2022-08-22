#!groovy

pipeline{
  
  agent none
  stages {
    
    stage('Sonar Qube Analysis'){
      agent {
        docker {
          image 'maven:3.5.0'
        }
      }
      steps{
        withSonarQubeEnv(installationName:'SonarCloudSpace', credentialsId:'sona-cloud-key'){
          sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar'
        }
      }
    }
    
    stage('Quality Gate'){
      steps{
        timeout(time:1, unit:'HOURS'){
          waitForQualityGate abortPipeline: true
        }
      }
    }
    
    
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.5.0'
        }
      }
      steps {
        sh 'mvn clean install'
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
