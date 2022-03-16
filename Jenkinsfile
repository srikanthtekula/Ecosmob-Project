node("Centos"){
  stage('Checkout') {
      checkout scm
  }
  stage('Build Image'){
      sh 'docker build -t myimagev1 .'
  }

  stage('Build Image'){
      sh 'docker image tag myimagev1 52.66.190.203:5000/myimagev1'
  }
  stage('Upload the image to dockerhub'){
      sh 'docker push 52.66.190.203:5000/myimagev1 '
  }  
  stage('Run image'){
      sh 'docker-compose up -d'
  }
  stage('check the created container'){
      sh 'docker ps'
  }
  stage('check files'){
      sh 'ls -al'
  }
  stage('check the nginx url'){
      sh 'curl 52.66.190.203:8085'
  }
}
