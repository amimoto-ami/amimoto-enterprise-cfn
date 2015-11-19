AWSTemplateFormatVersion "2010-09-09"
Description (<<-EOS).undent
  This is Simple EC2 Instance Formation
EOS

Mappings do
  _include "include/mapping/ami_hvm.rb"
end

Parameters do
  _include "params/keyname.rb"
  _include "params/ec2_instance.rb"
end

Resources do
  _include 'include/vpc/vpc.rb'
  _include "include/ec2.rb"
  _include "include/security_group.rb"
end