#IAMCreateSnapshot do
#  Type "AWS::IAM::InstanceProfile"
#  Properties do
#    Path  "/"
#    Roles ""
#  end
#end
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
    Policies [
      _{
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
      }
  ]
  end
end

#ManagedPolicyArns ""
#Path ""
#Policies ""
