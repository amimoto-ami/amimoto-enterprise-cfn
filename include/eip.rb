EIP do
  Type "AWS::EC2::EIP"
  DependsOn "AttachGatewayToVPC"
  Properties do
    InstanceId {
      Ref "EC2"
    }
    Domain "vpc"
  end
end
