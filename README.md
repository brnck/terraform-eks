# terraform-eks

## Purpose

Homework task for **secret** company

## Tasks

* Create your AWS account.
* Deploy EKS and Atlantis application (https://www.runatlantis.io ) using Terraform and Helm.
* Configure the application to use your GitHub project repository.
* Create a pull request against your repository, to prove Atlantis is working.

## Functional requirements

* 1 VPC, 2 subnets, 1 EKS cluster.
* Worker autoscaling group with min 1, max 2 workers.
* K8s role based access is configured with two IAM roles - `eks-admin` (with admin access) and `eks-
read-only` (for read-only access).

## Non-functional requirements

* All infrastructure is deployed as a code.
* Deployment doesn't require manual steps.
* Code is pushed to GitHub, and shared with **secret** company for assessment.

## Evaluation criteria

* Are the requirements met?
* Can the infrastructure and application be deployed using your code?
* Does the deployment require manual intervention?
* Quality of code - is it reusable, is it clearly readable?
