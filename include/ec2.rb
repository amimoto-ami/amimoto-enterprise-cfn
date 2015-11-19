EC2 do
  Type "AWS::EC2::Instance"
  Properties do
    AvailabilityZone do
      Fn__FindInMap [
        "AZs",
        _{ Ref "AWS::Region"},
        "PRI"
      ]
    end
    DisableApiTermination "false"
    EbsOptimized "false"
    ImageId do
      Fn__FindInMap [
        "MPAmimotov4",
        _{ Ref "AWS::Region" },
        "AMI"
      ]
    end
    InstanceInitiatedShutdownBehavior "stop"
    InstanceType {
      Ref "InstanceType"
    }
    KeyName {
      Ref "KeyName"
    }
    Monitoring "false"
    SubnetId do
      Ref "PublicSubnet"
    end
    Tags [
      _{
        Key "Application"
        Value do
          Ref "AWS::StackName"
        end
      }
    ]
    Tenancy "default"
    UserData do
      Fn__Base64 (<<-EOS).undent
        #!/bin/bash
        yum install -y httpd
        service httpd start
      EOS
    end
    SecurityGroupIds [
      _{
        Ref "SecurityGroup"
      }
    ]
  end
end

#"IamInstanceProfile" : String,
#"PrivateIpAddress" : String,
#"SecurityGroups" : [ String, ... ],
#"Volumes" : [ EC2 MountPoint, ... ],
