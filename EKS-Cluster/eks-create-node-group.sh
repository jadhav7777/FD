aws eks create-nodegroup --cluster-name demo-cluster --nodegroup-name eks-demo-group --node-role  arn:aws:iam::898334718399:role/eksnoderole  --ami-type  AL2_x86_64 --instance-types t3.medium --subnets subnet-c23fbd8f --disk-size 20 
