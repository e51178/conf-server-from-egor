# Spring cloud config server / as separated containerized app

### Spring cloud config server

Config server is to be started before any other service-style apps.
<br/>
To start:<br/>
try to run runWithMinikube.sh <br/>
<code>
gradle build<br/>
gradle docker<br/>
gradle dockerRun
</code>
<br/>
To run in kuber:<br/>
<code>
minikube start<br/>
minikube docker-env<br/>
eval $(minikube -p minikube docker-env)<br/>
#pwd -> /home/planb/Work/confServer/conf-server-from-egor
docker build . -t conf-server-img<br/>
kubectl create -f deployment/kubernetes/DeplAndServ.yaml<br/> 
kubectl get all<br/>
</code>
<br/>

#useful cmd <br/>
eval $(minikube -p minikube docker-env)<br/>
kubectl delete all --all  #optional to cleanup everything<br/>
helm ls -a --all-namespaces | awk 'NR > 1 { print  "-n "$2, $1}' | xargs -L1 helm delete<br/>

