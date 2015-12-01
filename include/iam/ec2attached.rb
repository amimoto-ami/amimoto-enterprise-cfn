_include 'include/iam/create-snapshot.rb'
_include 'include/iam/cf-invalidation.rb'

IAMForEC2 do
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
