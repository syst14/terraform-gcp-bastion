Terraform bastion deployment
============================

This is a terraform module, which is creating infrastructure in GCP. It using "bastion" approach which providing one entry point to your functional part of infrastructure, separated by subnetworks. After applying this template, deployment results will be:
1. One VPC with two subnetworks (public and private)
2. Bastion host with public IP (in public subnetwork), which is using for providing access to "worker" instances trough ssh for further configuration or deploment. You could manage this connectiviti with routing. It not participate in processing functional requestst. 
3. Inside private network will be two objects - one is classical instance, which can be used as potential master of the multi-intance cluster. Second one is entitiy of instance template which can be managed wich auto-scaling, potential worker nodes.
All logical parts of infrastructure fully separated by modules and could be easly extended.
This template is also ready for multi deployment. The only "gcp_deployment_name" parameter is sensetive. All created resources will be marked with random string to avoid project conflicts.
Terraform working in "local mode", so I reccomend to implement remote backend for it -
https://www.terraform.io/docs/backends/types/remote.html
I also recommend you to create separate entity in API keys manegment in GCP, for easier way to monitor all terraform's activity.
https://www.terraform.io/docs/providers/google/index.html

Manual for deployment:
======================

Choose folder where you want work trough deployment lifecycle and save artifates of it.

```sh
init
```

In case of any error on this step, double check provider "google"{} section in main.tf file and provided GCP credentials.

```sh
plan
```

Or you can use provided default values for such kind of deployment

```sh
plan -tfvars
```

Please check result of the plan with deployment expectations.

```sh
apply
```

After successfull deployment, you also will see outputs with with all instances IPs and tags.
You could manage outputs independtly. 
https://www.terraform.io/docs/configuration/outputs.html
You could also get all outputs after deployment or use it as artifact.

```sh
output
```

To delete all created resources during deployment use destroy command (this proccess fully depending on tfstate file):

```sh
destroy
```
