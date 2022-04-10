aws events put-rule --name "EC2-Actions_Minus-Snapshots" --event-pattern '
{
  "source": ["aws.ec2"],
  "source": [{
    "anything-but": ["snapshot"]
  }]
}'

aws sns create-topic --name EBS-EC2-VPC_Actions_Minus-Snapshots

aws events put-targets --rule EBS-EC2-VPC_Actions_Minus-Snapshots --targets "Id"="1","Arn"=$(aws sns list-topics --query 'Topics[0].TopicArn' --output text)

aws sns subscribe --topic-arn $(aws sns list-topics --query 'Topics[0].TopicArn' --output text) --protocol email --notification-endpoint josephedwardwork@gmail.com

