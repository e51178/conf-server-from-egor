# Spring cloud config server / as separated containerized app

### Spring cloud config server

Config server is to be started before any other service-style apps.
<br/>
To start:<br/>
<code>
gradle build<br/>
gradle docker<br/>
gradle dockerRun
</code>
To run in kuber:
minikube start
minikube docker-env
eval $(minikube -p minikube docker-env)
pwd -> /home/planb/Work/confServer/conf-server-from-egor
docker build . -t confserver
kubectl create -f workingJob.yaml
kubectl get all

#testPart
cd serv&&docker build -t bokovets/kuber .
cd ../ & docker build . -t confserver
minikube start
eval $(minikube -p minikube docker-env)
kubectl delete all --all  #optional to cleanup everything 
kubectl apply DeplAndServ.yaml depl-svc-app-v1.yaml ingressTest.yaml
