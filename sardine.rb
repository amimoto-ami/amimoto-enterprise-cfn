AWSTemplateFormatVersion "2010-09-09"
Description (<<-EOS).undent
  This is Simple AMIMOTO Stack made by CloudFormation.
  Easy Setup and Automatic make Snapshot(2Days).
  Use service is VPC,EC2,EIP,CloudWatch.
EOS

Mappings do
  _include "include/mapping/ami_hvm.rb"
  _include "include/mapping/az.rb"
end

Parameters do
  _include "params/keyname.rb"
  _include "params/ec2_instance.rb"
  _include "params/alert_mail.rb"
end

Resources do
  _include 'include/vpc/vpc.rb'
  _include "include/ec2/ec2.rb"
  _include "include/security_group.rb"
  _include "include/eip.rb"
  _include "include/cloudwatch/cw.rb"
  _include "include/sns/cw-alert.rb"
end

Outputs do
  _include "outputs/ec2.rb"
  _include "outputs/eip.rb"
end
