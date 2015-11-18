AWSTemplateFormatVersion "2010-09-09"
Description (<<-EOS).undent
  This is Simple VPC Formation
EOS

Resources do
  _include 'include/vpc/vpc.rb'
end
