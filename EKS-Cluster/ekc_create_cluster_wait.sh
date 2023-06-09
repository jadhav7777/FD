aws eks create-cluster --name $clusterName --kubernetes-version 1.27  --role-arn $role_arn --resources-vpc-config subnetIds=subnet-c23fbd8f,subnet-71e4e318,subnet-f7c1868c,securityGroupIds=sg-47e75b2f,sg-8db408e5
aws eks wait cluster-active --name $clusterName 
aws eks update-kubeconfig --name $clusterName