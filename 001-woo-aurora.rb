AWSTemplateFormatVersion "2010-09-09"
Description (<<-EOS).undent
  WordPress powered by JINKEI (Simple Stack For Woo with Amazon Aurora & HHVM ) Version1.0.1
  This is Powerful & Scalable AMIMOTO Stack made by CloudFormation.
  Added RDS, Database change more scalable.
  Use service is VPC,EC2,EIP,CloudFront,S3,RDS(Amazon Aurora).
EOS

Mappings do
  _include "include/mapping/ami_woo_hhvm.rb"
end

Conditions do
  CreateSecDB do
    Fn__Equals [
      _{ Ref "MulitiAZDatabase" },
      true
    ]
  end
end

Parameters do
  _include "params/001-base-param.rb"
  _include "params/ec2_instance_hhvm.rb"
  _include "params/aurora_settings.rb"
end
_include "include/001-aurora-resource.rb"
_include "outputs/001-base-output.rb"