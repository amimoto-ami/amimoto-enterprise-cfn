IAMPolicyForS3Media do
  Type "AWS::IAM::ManagedPolicy"
  Properties do
    Description "Allow manage object under specific bucket"
    PolicyDocument do
      Version "2012-10-17"
      Statement [
        _{
          Effect "Allow"
          Action [
            "s3:ListAllMyBuckets"
          ]
          Resource do
            Fn__Join [
              "",
              [
                "arn:aws:s3:::*",
                _{
                  Ref "S3Media"
                }
              ]
            ]
          end
        },
        _{
          Effect "Allow"
          Action [
            "s3:PutObject",
            "s3:GetObject",
            "s3:DeleteObject"
          ]
          Resource do
            Fn__Join [
              "",
              [
                "arn:aws:s3:::",
                _{
                  Ref "S3Media"
                },
                "/*"
              ]
            ]
          end
        },
        _{
          Effect "Allow"
          Action [
            "s3:ListBucket",
            "s3:GetBucketLocation"
          ]
          Resource do
            Fn__Join [
              "",
              [
                "arn:aws:s3:::",
                _{
                  Ref "S3Media"
                },
                "/*"
              ]
            ]
          end
        }
      ]
    end
  end
end
