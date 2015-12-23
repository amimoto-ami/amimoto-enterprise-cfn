_include "include/iam/policies/allow-invalidation.rb"

IAMCfInvalidationRole do
  Type "AWS::IAM::Role"
  DependsOn "IAMPolicyForCloudFront"
  Properties do
    ManagedPolicyArns [
      _{
        Ref "IAMPolicyForCloudFront"
      }
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
