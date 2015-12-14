InternetGateway do
  Type "AWS::EC2::InternetGateway"
  Properties do
    Tags [
      _{
        Key "Name"
        Value do
          Ref "AWS::StackName"
        end
      }
    ]
  end
end

AttachGatewayToVPC do
  Type "AWS::EC2::VPCGatewayAttachment"
  Properties do
    InternetGatewayId do
      Ref "InternetGateway"
    end
    VpcId do
      Ref "VPC"
    end
  end
end
