InstanceType do
  Description "EC2 instance type"
  Type "String"
  Default "t2.small"
  AllowedValues "t2.small",
                "t2.medium",
                "t2.large",
                "hi1.4xlarge",
                "hs1.8xlarge",
                "g2.2xlarge",
                "m3.medium",
                "m3.large",
                "m3.xlarge",
                "m3.2xlarge",
                "i2.xlarge",
                "i2.2xlarge",
                "i2.4xlarge",
                "i2.8xlarge",
                "c3.large",
                "c3.xlarge",
                "c3.2xlarge",
                "c3.4xlarge",
                "c3.8xlarge",
                "r3.large",
                "r3.xlarge",
                "r3.2xlarge",
                "r3.4xlarge",
                "r3.8xlarge"
  ConstraintDescription "must be a valid EC2 instance type."
end
