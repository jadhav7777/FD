aws eks create-nodegroup --cluster-name $clusterName --nodegroup-name $nodeGroupName --node-role $role_arn  --ami-type  $amiType --instance-types $instanceType --subnets subnet-c23fbd8f --disk-size 20 
