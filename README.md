# Usage

## Docker registry location:
- https://hub.docker.com/repository/docker/rhcpranava/mocf-api
- To pull the image, use the following command:
```
docker pull docker.io/rhcpranava/mocf-api:latest
```

## OpenShift Usage:
- Use the k8s yaml file to create a pod
- Expose the pod
```
oc expose pod/mocf-mock-pod -n mocf-dummy
```
- Create a route
```
oc expose svc/mocf-mock-pod -n mocf-dummy
```
