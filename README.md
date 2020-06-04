# Final Cloud Nanodegree Repository

In this project, we are going to operationalise an api for predicting the income of an employee, given certain parameters like experience and scores.
The application consists of a flask server listening on a port for incoming requests, and a model which spurts out the predictions for those requests.

The pipeline for this app resides in this GitHub repository. We will link it to a continuous integration, continuous deployment Jenkins pipeline to ensure that the changes made to the code
are deployed to the Kubernetes Cluster in realtime. For the Kubernetes cluster, we have two deployments in a __Rolling Update__
kind of deployment.
This implies that we always have one instance running our application, i.e. __zero downtime__

<h3> Steps that went into creating this project - </h3>

1. Create a local app, write a flask application server, ensure it runs correctly.

2. Upload docker to repository, add a makefile for easier jenkins commands, add a linter.

3. Create a server, install and configure Jenkins and write docker credentials to it.

4. Setup kops (kubernetes ops) on the same server, create a s3 bucket and dns for it.

<details>
<summary><b>Creating a minimal configuration cluster with kops and aws </b></summary>

REQUISITES - aws access and secret keys, awscli, kops and kubectl.

* Create a s3 bucket, set env
```
export KOPS_STATE_STORE=s3://<your-bucket>`
```

* Create a gossip based Kubernetes cluster (name ends with .local), assign a keygen and create cluster as required
```
kops create secret --name white-polaris.k8s.local sshpublickey admin -i ~/.ssh/id_rsa.pub
kops create cluster white-polaris.k8s.local --master-size=t2.micro --node-size=t2.micro --node-count=1 --zones=eu-west-1a --master-zones=eu-west-1a
```

* Validate cluster

```
kops validate cluster
```
</details>

5. Create deployments and services for the application, connect the service to a load balancer.

6. Access the api or web app via the loadbalancer url

<h3> Files in repo </h3>

* app-deployment.yaml : kubernetes deployments configuration
* app-service.yaml : kubernetes service and lb configuration
* .hadolint.yaml : ignore specific errors for linting
* upload_docker.sh : bash script for pushing to docker repo
* post_request.sh : bash script for making a request to the deployed app


<h3> Creating a minimal configuration cluster with kops and aws </h3>

CLUSTER WAS CREATED BY HAND WITH [kops](https://github.com/kubernetes/kops/tree/master/docs) as shown below

REQUISITES - aws access and secret keys, awscli, kops and kubectl.

* Create a s3 bucket, set env
```
export KOPS_STATE_STORE=s3://<your-bucket>`
```

* Create a gossip based Kubernetes cluster (name ends with .local), assign a keygen and create cluster as required
```
kops create secret --name white-polaris.k8s.local sshpublickey admin -i ~/.ssh/id_rsa.pub
kops create cluster white-polaris.k8s.local --master-size=t2.micro --node-size=t2.micro --node-count=1 --zones=eu-west-1a --master-zones=eu-west-1a
```

* Validate cluster

```
kops validate cluster
```
