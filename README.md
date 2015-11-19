# amimot-enterprise-cfn
##About Branch

- master :リリース版
- staging :結合テスト
- topicbranch :単体テスト

##How To Build

###create-vpc.rb
```
kumogata create create-vpc.rb STACKNAME \
 -r us-west-2 \
 -p "KeyName=KEYNAME"
```
###create-ec2.rb
```
kumogata create create-vpc.rb STACKNAME \
 -r us-west-2 \
 -p "KeyName=KEYNAME,InstanceType=INSTANCE_TYPE"
```
