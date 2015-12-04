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
  WebSiteURL do
    Description "WordPress Site URL  (Please wait a few minutes for the upgrade of WordPress to access for the first time.)"
    Value do
      Fn__Join [
        "",
        [
          "http://",
          _{
            Fn__GetAtt "CloudFront", "DomainName"
          }
        ]
      ]
    end
  end
  EC2InstanceId do
    Description "Access for the first time, Please input it."
    Value do
      Ref "EC2"
    end
  end
  CloudFrontDistributionId do
    Description "This is CloudFront Disctribution ID. Please set 'C3 CloudFlont Cache Clear' plugin on admin page."
    Value do
      Ref "CloudFront"
    end
  end
  CloudFrontAccessKey do
    Description "This is CloudFront Access Key. Please set 'C3 CloudFlont Cache Clear' plugin on admin page."
    Value do
      Ref "IAMCfInvalidationAccessKey"
    end
  end
  CloudFrontSecretKey do
    Description "This is CloudFront Secret Key. Please set 'C3 CloudFlont Cache Clear' plugin on admin page."
    Value do
      Fn__GetAtt "IAMCfInvalidationAccessKey", "SecretAccessKey"
    end
  end
end
