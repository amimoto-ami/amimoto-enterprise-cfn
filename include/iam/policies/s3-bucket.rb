IAMPolicyForS3Media do
  Type "AWS::IAM::ManagedPolicy"
  DependsOn "IAMS3MediaRole"
  Properties do
    Description "Allow manage object under specific bucket"
    PolicyDocument do
      Version "2012-10-17"
      Statement [
        _{
          ## 全体リスト取得、ただしアクセス権があるものに限る
          Effect "Allow"
          Action [
            "s3:ListAllMyBuckets"
          ]
          Resource do
            Fn__Join [
              "",
              [
                "arn:aws:s3:::*"
              ]
            ]
          end
        },
        _{
          ## バケット内の操作を許可する
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
          ## 指定時のListBucketと、URLの取得を許可する
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
                }
              ]
            ]
          end
        }
      ]
    end
  end
end
