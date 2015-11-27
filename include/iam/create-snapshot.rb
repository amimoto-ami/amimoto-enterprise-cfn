IAMCreateSnapshotRole do
  Type "AWS::IAM::Role"
  Properties do
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

IAMCreateSnapshotPolicies do
  Type "AWS::IAM::Policy"
  Properties do
    PolicyName "iamtest"
    PolicyDocument do
      Version "2012-10-17"
      Statement [
        _{
          Effect "Allow"
          Action [
            "ec2:Describe*",
            "ec2:CreateSnapshot",
            "ec2:DeleteSnapshot"
          ]
          Resource "*"
        }
      ]
    end
    Roles [
      _{
        Ref "IAMCreateSnapshotRole"
      }
    ]
  end
end

IAMCreateSnapshot do
  Type "AWS::IAM::InstanceProfile"
  Properties do
    Path  "/"
    Roles [
      _{
        Ref "IAMCreateSnapshotRole"
      }
    ]
  end
end

#ManagedPolicyArns ""
#Path ""
#Policies ""
