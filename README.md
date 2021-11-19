# Usage

## Docker registry location:
- https://hub.docker.com/repository/docker/rhcpranava/mocf-api
- To pull the image, use the following command:
```
docker pull docker.io/rhcpranava/mocf-api:latest
```

## OpenShift Deployment:
- Use the k8s yaml file to create a pod
- Expose the pod
```
oc expose pod/mocf-mock-pod -n mocf-dummy
```
- Create a route
```
oc expose svc/mocf-mock-pod -n mocf-dummy
```

## Usage
Endpoints are as follows:
- /api/10k
- /api/1m
- /api/64k
- /api/50k
- /api/40k
- /api/30k
- /api/25k
- /api/20k
- /api/15k
- /api/10k
- /api/5k
