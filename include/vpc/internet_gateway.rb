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
