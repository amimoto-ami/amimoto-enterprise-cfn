AutoScalingGroup do
  Type "AWS::AutoScaling::AutoScalingGroup"
  DependsOn "AttachGatewayToVPC"
  Properties do
    AvailabilityZones [
      _{
        Fn__FindInMap [
          "AZs",
          _{ Ref "AWS::Region"},
          "PRI"
        ]
      }
    ]
    Cooldown "600"
    DesiredCapacity "0"
    HealthCheckGracePeriod "300"
    HealthCheckType "EC2"
    LaunchConfigurationName do
      Ref "AutoScaleSetting"
    end
    VPCZoneIdentifier [
      _{
        Ref "PublicSubnet"
      }
    ]
    LoadBalancerNames [
      _{
        Ref "ELB"
      }
    ]
    MaxSize "10"
    MinSize "0"
    NotificationConfigurations [
      _{
       NotificationTypes [
          "autoscaling:EC2_INSTANCE_LAUNCH",
          "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
          "autoscaling:EC2_INSTANCE_TERMINATE",
          "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
          "autoscaling:TEST_NOTIFICATION"
       ]
       TopicARN do
        Ref "SNSAutoScale"
       end
      }
    ]
  end
end
