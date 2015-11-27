AWSTemplateFormatVersion "2010-09-09"
Description (<<-EOS).undent
  This is Simple VPC Formation
EOS

Mappings do
  _include "include/mapping/az.rb"
end

Parameters do
  _include "params/keyname.rb"
end

Resources do
  _include 'include/vpc/vpc.rb'
  _include 'include/iam/create-snapshot.rb'
end
