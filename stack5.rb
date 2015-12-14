AWSTemplateFormatVersion "2010-09-09"
Description (<<-EOS).undent
  This is Powerful & Scalable AMIMOTO Stack made by CloudFormation.
  Added RDS, Database change more scalable.
  Easy Setup and Automatic make Snapshot(2Days).
  Use service is VPC,EC2,EIP,CloudWatch,CloudFront,S3,RDS(MariaDB).
EOS

Mappings do
  _include "include/mapping/ami_hvm.rb"
  _include "include/mapping/az.rb"
end

Parameters do
  _include "params/keyname.rb"
  _include "params/ec2_instance.rb"
  _include "params/alert_mail.rb"
  _include "params/rds_settings.rb"
end

Resources do
  _include 'include/vpc/vpc.rb'
  _include "include/ec2/ec2-with-rds.rb"
  _include "include/rds/rds.rb"
  _include "include/security_group.rb"
  _include "include/elb.rb"
  _include "include/cloudwatch/cw.rb"
  _include "include/sns/cw-alert.rb"
  _include 'include/iam/cf-invalidation.rb'
  _include 'include/iam/s3-media.rb'
  _include "include/cloudfront/cf.rb"
  _include "include/s3/s3-media.rb"
end

Outputs do
  _include "outputs/ec2.rb"
  _include "outputs/cloudfront.rb"
  _include "outputs/s3.rb"
end
