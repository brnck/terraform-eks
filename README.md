Just testing atlantis
# terraform-eks

## Requirements

Make sure you have all steps, described below, completed before proceeding to **How to** step

* AWS account
* AWS credentials: `access key_id` and `secret_access_key`
* Github personal access token with `repo` scope. Ref: https://www.runatlantis.io/docs/access-credentials.html#github
* Generate random secret for **Github Webhook** at https://www.random.org/passwords/?num=2&len=20&format=html&rnd=new
* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)
* [Terraform](https://www.terraform.io)
* [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
* [Helm3](https://helm.sh/docs/intro/install/)

## How to

Make sure you have configured AWS profile in `$HOME/.aws` OR export your configuration as environment variables:
```
$ export AWS_ACCESS_KEY_ID="anaccesskey"
$ export AWS_SECRET_ACCESS_KEY="asecretkey"
$ export AWS_DEFAULT_REGION="eu-west-1"
```

* `terraform init` - Initialize terraform
* `terraform apply` - Apply configuration
* `aws eks update-kubeconfig --name <eks_cluster_name>` - Set-up kube config. Context will be switched to created cluster
* `helm repo add stable https://kubernetes-charts.storage.googleapis.com` - Add stable charts repository to local environment
* `helm install nginx-ingress stable/nginx-ingress --set rbac.create=true` - Install nginx loadbalancer
* Wait for a couple of minutes then execute `kubectl describe services |grep ^LoadBalancer` - You will get your LB public DNS name
* `kubectl create ns atlantis`
* `cp atlantis/values.yaml atlantis/values_local.yaml` make a copy of a dist file
* Change `atlantis/values_local.yaml` to your preferred values (Override `ingress.host` value with LB public DNS name)

Deploy atlantis application
```
helm upgrade --install atlantis --namespace atlantis stable/atlantis -f atlantis/values_local.yaml
```

## Known issues/Missing things

* Find way to grant/remove/promote/demote users access with AWS IAM
