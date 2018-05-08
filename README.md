# Helm charts

To start, add the repo first:
```
helm repo add frankmariette-charts https://raw.githubusercontent.com/frankmariette/helm-charts/master/charts/
```

# Installation


## First Step
```
helm install --name es-operator \
    --namespace logging \
    frankmariette-charts/elasticsearch-operator
```

Check if the pods are running with:
```
kubectl get pods -n logging
```

Running the following command:
```
kubectl get CustomResourceDefinition
```
should give you a CRD of `elasticsearchclusters.enterprises.upmc.com`.

After this has been installed you can install the EFK stack with

```
helm install --name efk \
    --namespace logging \
    frankmariette-charts/efk
```

and finally after several minutes you should have a set of pods running with that you can see with 

```
kubectl get pods -n logging
```

# Accessing Kibana
Run `kubectl port-forward efk-kibana-<INSERT_POD_ID_HERE> 5601 -n logging`
and then go to `http://localhost:5601` to view the Kibana dashboard. If it is your first time here, 
you will need to setup an index. Add the index `kubernetes_cluster*`, choose a timestamp and then you are set. 


# Credit
Credit to @komljen on GitHub for this guide. This fork just has modifications needed for the RBAC instance as well as scaling the size up. 