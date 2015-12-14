KeyName do
  Description "Name of an existing EC2 KeyPair to enable SSH access to the instances"
  Type "String"
  MinLength 1
  MaxLength 64
  AllowedPattern "[-_ a-zA-Z0-9]*"
  ConstraintDescription "can contain only alphanumeric characters, spaces, dashes and underscores."
end
