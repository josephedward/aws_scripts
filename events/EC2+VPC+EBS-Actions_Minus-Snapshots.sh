aws events put-rule --name "EC2+VPC+EBS-Actions_Minus-Snapshots" --event-pattern `{ "source": ["aws.ec2", "aws.vpc", "aws.ebs"], "detail": {"source": [{ "anything-but": "snapshot" }]}}`
