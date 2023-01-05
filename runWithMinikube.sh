gradle build
gradle docker
minikube start
if ! grep -q 'conf-server.local' /etc/hosts; then
  ip=`minikube ip`
  sudo -- sh -c "echo '$ip conf-server.local'>> /etc/hosts"
fi
eval $(minikube -p minikube docker-env)
docker build . -t confserver
helm upgrade config-server deployment/helm/ --install
sleep 30
helm test config-server
echo "========== looks like all passed ============"
curl http://conf-server.local/helm/application/e2e

#helm ls -a --all-namespaces | awk 'NR > 1 { print  "-n "$2, $1}' | xargs -L1 helm delete
#kubectl delete all --all
