_include "include/iam/policies/s3-bucket.rb"

IAMS3MediaRole do
  Type "AWS::IAM::Role"
  DependsOn "IAMPolicyForS3Media"
  Properties do
    ManagedPolicyArns [
      _{ Ref "IAMPolicyForS3Media" }
    ]
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
