PublicSubnet do
  Type "AWS::EC2::Subnet"
  Properties do
    CidrBlock "10.0.0.0/24"
    VpcId do
      Ref "VPC"
    end
  end
end

PrivateSubnet do
  Type "AWS::EC2::Subnet"
  Properties do
    CidrBlock "10.0.1.0/24"
    VpcId do
      Ref "VPC"
    end
  end
end
