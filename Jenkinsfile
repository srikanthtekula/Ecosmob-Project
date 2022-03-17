node{
  stage('Checkout') {
      checkout scm
	  echo " scm check out successful "
  }
  stage('Build Image'){
      sh 'docker build -t nginx_image:v2 .'
	  echo " docker build successful "
  }

/*
 stage('tag Image'){
      sh 'docker tag nginx_image:v2 srikanthtekula/nginx_image:v2'
	  echo "docker tag successful "
  } */
  
 stage('Tag Image'){
	      sh 'docker tag nginx_image:v2 3.110.119.24:5000/nginx_image:v2'
	  }
	  
 stage('Push the image to locally created registry'){
	      sh 'docker push 3.110.119.24:5000/nginx_image:v2'
	  }

stage('login to the dockerhub'){
withCredentials([usernamePassword(credentialsId: 'docker-login-credentials', passwordVariable: 'docker_pword', usernameVariable: 'docker_uname')]) {
    sh "docker login -u srikanthtekula -p $docker_pword"
   echo "docker login successful Username ::::::  $docker_uname Password    :::::: $docker_pword "
}
}

 stage('Push the image to docker hub registry'){
      sh 'docker push 3.110.119.24:5000/nginx_image:v2'
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
	  echo " ls -al lists out all the files that got checkout during scm checkout "
  }
  stage('check the nginx url'){
      sh 'curl 52.66.190.203:8085'
	  echo " checking the url status "
  }
}
