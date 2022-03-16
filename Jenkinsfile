node{
  stage('Checkout') {
      checkout scm
	  echo " scm check out successful "
  }
  stage('Build Image'){
      sh 'docker build -t nginx_image:v1 .'
	  echo " docker build successful "
  }

stage('tag Image'){
      sh 'docker tag nginx_image:v1 srikanthtekula/nginx_image:v1'
	  echo "docker tag successful "
  }
stage('login to the dockerhub'){
withCredentials([usernamePassword(credentialsId: 'docker-login-credentials', passwordVariable: 'pword', usernameVariable: 'uname')]) {
   sh "docker login -u $uname -p $pword"
   echo docker login successful $name :::::: $pword "
}
}
 
 stage('Push the image to docker hub registry'){
      sh 'docker push srikanthtekula/nginx_image:v1'
	  echo " push to the docker registry successful "
  }  
  stage('Run image'){
      sh 'docker-compose up -d'
	  echo " docker compose run successful "
  }
  stage('check the created container'){
      sh 'docker ps'
	  echo " docker ps "
  }
  stage('check files'){
      sh 'ls -al'
	  echo " ls -al "
  }
  stage('check the nginx url'){
      sh 'curl 52.66.190.203:8085'
	  echo " checking the url status "
  }
}


 /* stage('Build Image'){
      sh 'docker image tag myimagev1 52.66.190.203:5000/myimagev1'
  }
  stage('Upload the image to dockerhub'){
      sh 'docker push 52.66.190.203:5000/myimagev1 ' 
  }  */ 