_include 'include/iam/create-snapshot.rb'

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
