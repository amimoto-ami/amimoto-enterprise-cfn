EC2 do
  Type "AWS::EC2::Instance"
  Properties do
    AvailabilityZone "us-west-2a"
    DisableApiTermination "false"
    EbsOptimized "false"
    ImageId "ami-f0091d91"
    InstanceInitiatedShutdownBehavior "stop"
    InstanceType "t2.micro"
    KeyName { Ref "KeyName"}
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
  end
end

#"IamInstanceProfile" : String,
#"NetworkInterfaces" : [ EC2 Network Interface, ... ],
#"PrivateIpAddress" : String,
#"SecurityGroupIds" : [ String, ... ],
#"SecurityGroups" : [ String, ... ],
#"Volumes" : [ EC2 MountPoint, ... ],
