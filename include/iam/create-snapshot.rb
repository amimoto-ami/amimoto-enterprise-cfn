_include 'include/iam/policies/ebs-snapshot.rb'

IAMCreateSnapshotRole do
  Type "AWS::IAM::Role"
  Properties do
    ManagedPolicyArns [
      _{ Ref "IAMPolicyForSnapShot" }
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
