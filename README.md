# Terraform deployment

## Overview
Terraform script for adding a deployment to k8s pods

Ensure you have `kubectl` set up, and connect to your k8s cluster

Update the variables in `/deployments/main.tf`  to change deployment config

## Prerequisits
Install [terraform](https://www.terraform.io/)

Create a namespace
```shell
kubectl create namespace go-apis
```

Export the PG_URI environment variable to connect to the remote tf state
```shell
export PG_URI=postgresql://<name>:<pw>@<host>:<port>/terraform_backend?sslmode=require
```

- Deploy service on each pod
```shell
make deploy
```

- Destroy service
```shell
make destroy
```

### Beware of Dragons
- On fresh install we need to run `make deploy` twice ?
