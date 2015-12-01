IAMCfInvalidationRole do
  Type "AWS::IAM::Role"
  Properties do
    ManagedPolicyArns ["arn:aws:iam::aws:policy/CloudFrontFullAccess"]
    AssumeRolePolicyDocument do
      Version "2012-10-17"
      Statement do
        Effect "Allow"
        Principal do
          Service "ec2.amazonaws.com"
        end
        Action [
          "sts:AssumeRole"
        ]
      end
    end
    Path "/"
  end
end

IAMCfInvalidationAccessKey do
  Type "AWS::IAM::AccessKey"
  Properties do
    Status "Active"
    UserName do
      Ref "IAMCfInvalidationUser"
    end
  end
end

IAMCfInvalidationUser do
  Type "AWS::IAM::User"
  Properties do
    Path "/"
    ManagedPolicyArns [
      "arn:aws:iam::aws:policy/CloudFrontFullAccess",
      "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
    ]
  end
end
