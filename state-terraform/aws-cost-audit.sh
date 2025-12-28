#!/bin/bash
set -e

REGION=$(aws configure get region)
ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

echo "========================================"
echo " AWS COST AUDIT"
echo " Account: $ACCOUNT_ID"
echo " Region : $REGION"
echo "========================================"

echo -e "\n🔹 EC2 Instances (running/stopped)"
aws ec2 describe-instances \
  --filters Name=instance-state-name,Values=running,stopped,stopping,pending \
  --query "Reservations[].Instances[].[InstanceId,State.Name,InstanceType]" \
  --output table

echo -e "\n🔹 NAT Gateways (VERY EXPENSIVE)"
aws ec2 describe-nat-gateways \
  --query "NatGateways[].[NatGatewayId,State,VpcId]" \
  --output table

echo -e "\n🔹 Elastic IPs (idle = cost)"
aws ec2 describe-addresses \
  --query "Addresses[].[PublicIp,AllocationId,AssociationId]" \
  --output table

echo -e "\n🔹 Load Balancers"
aws elbv2 describe-load-balancers \
  --query "LoadBalancers[].[LoadBalancerName,Type,State.Code]" \
  --output table

echo -e "\n🔹 EKS Clusters ($0.10/hour each)"
aws eks list-clusters --output table

echo -e "\n🔹 ECS Clusters"
aws ecs list-clusters --output table

echo -e "\n🔹 RDS Instances"
aws rds describe-db-instances \
  --query "DBInstances[].DBInstanceIdentifier" \
  --output table

echo -e "\n🔹 EBS Volumes"
aws ec2 describe-volumes \
  --query "Volumes[].[VolumeId,State,Size]" \
  --output table

echo -e "\n🔹 EBS Snapshots"
aws ec2 describe-snapshots --owner-ids self \
  --query "Snapshots[].SnapshotId" \
  --output table

echo -e "\n🔹 Lambda Functions"
aws lambda list-functions \
  --query "Functions[].FunctionName" \
  --output table

echo -e "\n🔹 CloudWatch Log Groups"
aws logs describe-log-groups \
  --query "logGroups[].logGroupName" \
  --output table

echo -e "\n🔹 AWS Config (EXPENSIVE)"
aws configservice describe-configuration-recorders
aws configservice describe-delivery-channels

echo -e "\n🔹 DynamoDB Tables (Terraform locks?)"
aws dynamodb list-tables --output table

echo -e "\n🔹 S3 Buckets"
aws s3 ls

echo -e "\n✅ Audit complete"

