#!groovy

pipeline{
  
  agent none
  stages {
    
    stage('Maven Install') {
      agent {
        docker {
          image 'maven:3.5.0'
        }
      }
      steps {
        withSonarQubeEnv(installationId:'SonarCloudSpace', credentialsId:'sona-cloud-key'){
          sh 'mvn clean install sonar:sonar'
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
    
    stage('Docker build') {
      agent any
      steps {
        sh 'docker build -t grupo07/spring-petclinic:latest .'
      }
    }
  }
}
