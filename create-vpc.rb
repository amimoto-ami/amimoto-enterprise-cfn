AWSTemplateFormatVersion "2010-09-09"
Description (<<-EOS).undent
  This is Simple VPC Formation
EOS

Parameters do
  _include "params/keyname.rb"
end

Resources do
  _include 'include/vpc/vpc.rb'
end
