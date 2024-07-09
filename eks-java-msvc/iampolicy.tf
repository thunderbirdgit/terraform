resource "aws_iam_policy" "eks_describe_availability_zones" {
  name        = "eks-describe-availability-zones"
  description = "Allows describing availability zones for EKS"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeAvailabilityZones",
                "iam:ListUserPolicies",
                "iam:CreatePolicy",
                "iam:GetPolicy",
                "iam:CreateRole"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "eks_describe_availability_zones" {
  policy_arn = aws_iam_policy.eks_describe_availability_zones.arn
  user       = "terraform-service-account"
}

