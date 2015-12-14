AWSTemplateFormatVersion "2010-09-09"
Description (<<-EOS).undent
  This is Simple AMIMOTO Stack made by CloudFormation.
  Named "Anegawa", Using ELB & Single EC2 & RDS + CloudFront stack.
EOS

Mappings do
  _include "include/mapping/ami_hvm.rb"
  _include "include/mapping/az.rb"
end

Parameters do
  _include "params/keyname.rb"
  _include "params/ec2_instance.rb"
  _include "params/rds_settings.rb"
end

Resources do
  _include 'include/vpc/vpc.rb'
  _include "include/ec2/ec2-with-rds.rb"
  _include "include/security_group.rb"
  _include "include/elb.rb"
  _include "include/rds/rds.rb"
  _include "include/cloudfront/cf.rb"
  _include "include/cloudwatch/cw.rb"
end

Outputs do
  _include "outputs/cloudfront.rb"
  _include "outputs/ec2.rb"
end
