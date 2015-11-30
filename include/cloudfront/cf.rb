CloudFront do
  Type "AWS::CloudFront::Distribution"
  Properties do
    DistributionConfig do
      Origins [
        _{
          DomainName do
            Fn__Join [
              "",
              [
                _{
                  Fn__GetAtt "ELB", "DNSName"
                }
              ]
            ]
          end
          Id do
            Ref "AWS::StackName"
          end
          CustomOriginConfig do
            OriginProtocolPolicy "http-only"
          end
        }
      ]
      Enabled true
      Comment "Sample CloudFront."
      DefaultRootObject "index.php"
      DefaultCacheBehavior do
        AllowedMethods ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
        TargetOriginId do
          Ref "AWS::StackName"
        end
        ForwardedValues do
          QueryString false
          Cookies do
            Forward "none"
          end
        end
        ViewerProtocolPolicy "allow-all"
      end
    end
  end
end
