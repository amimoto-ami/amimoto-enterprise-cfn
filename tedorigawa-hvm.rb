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
  _include "params/aurora_settings.rb"
end

Resources do
  _include 'include/vpc/vpc.rb'
  _include "include/ec2/ec2-with-rds.rb"
  _include "include/security_group.rb"
  _include "include/elb.rb"
  _include "include/rds_aurora/aurora.rb"
  _include "include/cloudwatch/cw.rb"
end

Outputs do
  _include "outputs/ec2.rb"
  _include "outputs/elb.rb"
end
