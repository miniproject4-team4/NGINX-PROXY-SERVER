docker stop ng-proxy
docker rm ng-proxy
docker rmi ng-proxy:0.1.0
docker build -t ng-proxy:0.1.0 .
docker run -d --name ng-proxy -p 9003:80 ng-proxy:0.1.0
