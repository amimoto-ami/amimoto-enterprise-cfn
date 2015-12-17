_include "include/iam/policies/s3-bucket.rb"

IAMS3MediaRole do
  Type "AWS::IAM::Role"
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

IAMS3MediaAccessKey do
  Type "AWS::IAM::AccessKey"
  Properties do
    Status "Active"
    UserName do
      Ref "IAMS3MediaUser"
    end
  end
end

IAMS3MediaUser do
  Type "AWS::IAM::User"
  Properties do
    Path "/"
    ManagedPolicyArns [
      _{ Ref "IAMPolicyForS3Media" }
    ]
  end
end
