aws eks delete-nodegroup --cluster-name $clusterName --nodegroup-name $nodeGroupName
aws eks wait nodegroup-deleted --cluster-name $clusterName --nodegroup-name $nodeGroupName
aws eks delete-cluster --name $clusterName
aws eks wait cluster-deleted --name $clusterName