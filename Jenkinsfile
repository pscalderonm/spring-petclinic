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
