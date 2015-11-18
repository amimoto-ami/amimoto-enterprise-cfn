PublicSubnet do
  Type "AWS::EC2::Subnet"
  Properties do
    CidrBlock "10.0.0.0/24"
    AvailabilityZone "us-west-2a"
    MapPublicIpOnLaunch "false"
    VpcId do
      Ref "VPC"
    end
    Tags [
      _{
        Key "Name"
        Value do
          Ref "AWS::StackName"
        end
      }
    ]
  end
end

PrivateSubnet do
  Type "AWS::EC2::Subnet"
  Properties do
    CidrBlock "10.0.1.0/24"
    AvailabilityZone "us-west-2a"
    MapPublicIpOnLaunch "false"
    VpcId do
      Ref "VPC"
    end
    Tags [
      _{
        Key "Name"
        Value do
          Ref "AWS::StackName"
        end
      }
    ]
  end
end
