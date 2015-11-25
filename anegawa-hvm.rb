AWSTemplateFormatVersion "2010-09-09"
Description (<<-EOS).undent
  This is Simple AMIMOTO Stack made by CloudFormation.
  Named "OKEHAZAMA", Using ELB & Single EC2 stack.
EOS

Mappings do
  _include "include/mapping/ami_hvm.rb"
  _include "include/mapping/az.rb"
end

Parameters do
  _include "params/keyname.rb"
  _include "params/ec2_instance.rb"
end

Resources do
  _include 'include/vpc/private_subnet.rb'
  _include 'include/vpc/vpc.rb'
  _include "include/ec2.rb"
  _include "include/security_group.rb"
  _include "include/elb.rb"
end

Outputs do
  WebSiteURL do
    Description "WordPress Site URL  (Please wait a few minutes for the upgrade of WordPress to access for the first time.)"
    Value do
      Fn__Join [
        "",
        [
          "http://",
          _{
            Fn__GetAtt "ELB", "DNSName"
          }
        ]
      ]
    end
  end
  InstanceId do
    Description "Access for the first time, Please input it."
    Value do
      Ref "EC2"
    end
  end
end
