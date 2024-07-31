This repository contains a solution to Inpost Homework Assignment

## 1st assignment

Solution to the first part is in the `inpost-homework-api` folder + the `applicationset.yaml` file for creating Application Set in ArgoCD.

I tested with a local `minikube` with ArgoCD installed using their default Helm Chart + Application Set plugin

Note: there is another repository that contains the value files for first assignment: https://github.com/rskupnik/inpost-homework-values

## 2nd assignment

Solution to the second part is in the `2nd-assignment` folder.

I have decided to use AWS due to a few reasons:
- I could quickly spin up a LocalStack environment to test the terraform files
- I don't feel confident enough to create GCP resources without testing them properly on an actual GCP account

There is a `docker-compose.yml` file provided that spins up the relevant LocalStack container for testing. Note that RDS is only support in the PRO plan.

Due to time constraints, the web part of the app is hosted in a very bare-bones way. It's viable in a MVP scenario, but going further there are a few options I would consider:
- simplest one would be to add an Autoscaling Group + Load Balancer for traffic
- a more robust one would be to host the application in a k8s cluster