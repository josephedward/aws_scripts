aws events put-rule --name "EBS-EC2-VPC_Actions_Minus-Snapshots" --event-pattern '
{
    "source": ["aws.ebs", "aws.ec2", "aws.vpc"],
    "detail-type": ["EBS,EC2,and VPC Action Notification minus Snaphots"],
    "detail": {"source": [{ "anything-but": "snapshot" }]}
  }'

aws sns create-topic --name EBS-EC2-VPC_Actions_Minus-Snapshots

aws events put-targets --rule EBS-EC2-VPC_Actions_Minus-Snapshots --targets "Id"="1","Arn"=$(aws sns list-topics --query 'Topics[0].TopicArn' --output text)




{
    "RuleArn": "arn:aws:events:us-east-1:369871242120:rule/EBS-EC2-VPC_Actions_Minus-Snapshots"
}
{
    "TopicArn": "arn:aws:sns:us-east-1:369871242120:EBS-EC2-VPC_Actions_Minus-Snapshots"
}
