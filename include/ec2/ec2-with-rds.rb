_include 'include/iam/ec2attached.rb'

EC2 do
  Type "AWS::EC2::Instance"
  Metadata do
    AWS__CloudFormation__Init do
      config do
        files do
          _path("/opt/local/create-snapshot.sh") do
            source "https://s3-ap-northeast-1.amazonaws.com/cfn-jinkei-templates/create-snapshot.sh"
          end
          _path("/etc/cron.d/create-snapshot") do
            content "#Create snapshot\n0 4 * * * /bin/sh /opt/local/create-snapshot.sh > /dev/null 2>&1\n\n"
          end
          _path("/opt/aws/cloud_formation.json") do
              content '{
                "rds" : {
                  "database" : "wordpress",
                  "username" : "amimoto",
                  "password" : "{{password}}",
                  "endpoint" : "{{endpoint}}",
                  "port"     : 3306
                },
                "is-use" : {
                  "cloudfront" : "true"
                }
              }'
            context do
              endpoint do
                Fn__GetAtt "RDS", "Endpoint.Address"
              end
              password do
                Ref "MySQLPassword"
              end
              serverid "dummy(value_will_update_by_AmimotoFrontLC)"
            end
            mode "00644"
            owner "root"
            group "root"
          end
        end
      end
    end
  end
  Properties do
    AvailabilityZone do
      Fn__FindInMap [
        "AZs",
        _{ Ref "AWS::Region"},
        "PRI"
      ]
    end
    DisableApiTermination "false"
    EbsOptimized "false"
    ImageId do
      Fn__FindInMap [
        "MPAmimotov4",
        _{ Ref "AWS::Region" },
        "AMI"
      ]
    end
    InstanceInitiatedShutdownBehavior "stop"
    InstanceType {
      Ref "InstanceType"
    }
    KeyName {
      Ref "KeyName"
    }
    Monitoring "false"
    SubnetId do
      Ref "PublicSubnet"
    end
    Tags [
      _{
        Key "Application"
        Value do
          Ref "AWS::StackName"
        end
      },
      _{
        Key "HasRDS?"
        Value "true"
      }
    ]
    Tenancy "default"
    UserData do
      Fn__Base64 do
        Fn__Join [
          "",
          [
            "#!/bin/bash\n",
            "/opt/aws/bin/cfn-init -s ",
            _{
              Ref "AWS::StackName"
            },
            " -r EC2 ",
            " --region ",
            _{
              Ref "AWS::Region"
            },
            "\n"
          ]
        ]
      end
    end
    SecurityGroupIds [
      _{
        Ref "SecurityGroup"
      }
    ]
    IamInstanceProfile do
      Ref "IAMForEC2"
    end
  end
end

#"Volumes" : [ EC2 MountPoint, ... ],
