AWSTemplateFormatVersion "2010-09-09"
Description (<<-EOS).undent
  This is Simple AMIMOTO Stack made by CloudFormation.
  VPC/PublicSubnet/EC2/EIP
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
  _include 'include/vpc/vpc.rb'
  _include "include/ec2/ec2.rb"
  _include "include/security_group.rb"
  _include "include/eip.rb"
  _include "include/s3/s3-media.rb"
end

Outputs do
  S3URL do
    Description "This is S3 Media Upload URL."
    Value do
      Fn__GetAtt "S3Media", "WebsiteURL"
    end
  end
end
