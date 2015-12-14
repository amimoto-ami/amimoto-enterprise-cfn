AutoScaleSetting do
  Type "AWS::AutoScaling::LaunchConfiguration"
  Properties do
    #IamInstanceProfile
    ImageId do
      Fn__FindInMap [
        "MPAmimotov4",
        _{ Ref "AWS::Region" },
        "AMI"
      ]
    end
    InstanceType {
      Ref "InstanceType"
    }
    KeyName {
      Ref "KeyName"
    }
    SecurityGroups [
      _{
        Ref "SecurityGroup"
      }
    ]
    #UserData
  end
end
