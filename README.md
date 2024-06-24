# CICD Demo for a Flask Application using Docker Jenkins

## To run your application locally only using Docker
```bash
git clone https://github.com/sanket363/cicd-demo-flaskapp.git
cd cicd-demo-flaskapp
docker build -t flask-app:latest .
docker run -d -p 80:80 flask-app:latest
```

## TO check the runnning docker contianer
```bash
docker ps
```

