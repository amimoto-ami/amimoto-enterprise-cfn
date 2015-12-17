IAMPolicyForSnapShot do
  Type "AWS::IAM::ManagedPolicy"
  Properties do
    Description "Allow create snapshot from inner an instance"
    PolicyDocument do
      Version "2012-10-17"
      Statement [
        _{
          ## スナップショット取得と、つかいそうな権限
          Effect "Allow"
          Action [
            "ec2:Describe*",
            "ec2:CreateSnapshot",
            "ec2:DeleteSnapshot",
            "ec2:CreateTags"
          ]
          Resource do[
            Fn__Join [
              ":",
              [
                "arn:aws:ec2:",
                _{ Ref "AWS::Region" },
                _{ Ref "AWS::AccountId" },
                "instance/*"
              ]
            ],
            Fn__Join [
              ":",
              [
                "arn:aws:ec2:",
                _{ Ref "AWS::Region" },
                _{ Ref "AWS::AccountId" },
                "snapshot/*"
              ]
            ],
            Fn__Join [
              ":",
              [
                "arn:aws:ec2:",
                _{ Ref "AWS::Region" },
                _{ Ref "AWS::AccountId" },
                "volume/*"
              ]
            ]
          ]
          end
        }
      ]
    end
  end
end
