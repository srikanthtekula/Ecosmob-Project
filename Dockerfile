FROM centos:7
RUN yum install epel-release -y
RUN yum install nginx -y
COPY ./index.html /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]