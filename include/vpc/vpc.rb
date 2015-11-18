_include 'include/vpc/subnet.rb'
_include 'include/vpc/route_table.rb'
_include 'include/vpc/association_routetable.rb'
VPC do
  Type "AWS::EC2::VPC"
  Properties do
    CidrBlock "10.0.0.0/16"
    InstanceTenancy "default"
    EnableDnsSupport "true"
    EnableDnsHostnames "true"
    Tags [
      _{
        Key "Name"
        Value "SampleVPC"
      },
      _{
        Key "Application"
        Value do
          Ref "AWS::StackName"
        end
      }
    ]
  end
end
