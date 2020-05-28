pipeline {
  agent any
  stages {
    stage('Lint') {
      steps {
        sh 'make lint'
      }
    }

    stage('Build Docker') {
      steps {
        sh 'make build'
      }
    }

    stage('Login to dockerhub') {
      steps {
        withCredentials(bindings: [string(credentialsId: 'docker-pwd', variable: 'dockerhubpwd')]) {
          sh 'docker login -u dipenc -p ${dockerhubpwd}'
        }

      }
    }

    stage('Upload Image') {
      steps {
        sh 'make upload'
      }
    }

    stage('Deploy Kubernetes') {
      steps {
        sh 'kubectl apply -f app_deployment.yaml'
        sh 'kubectl apply -f app_service.yaml'
        sh 'kubectl apply -f app_ingress.yaml'
      }
    }

  }
}