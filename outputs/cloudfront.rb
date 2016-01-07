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
