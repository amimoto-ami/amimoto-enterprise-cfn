# amimot-enterprise-cfn
##About Branch

- master :リリース版
- staging :結合テスト
- topicbranch :単体テスト

##How To Build

###create-vpc.rb
```
kumogata create create-vpc.rb STACKNAME \
 -r REGION \
 -p "KeyName=KEYNAME"
```
###create-ec2.rb
```
kumogata create create-vpc.rb STACKNAME \
 -r REGION \
 -p "KeyName=KEYNAME,InstanceType=INSTANCE_TYPE"
```

###Simple EC2 Stack(HVM)
VPC内にEC2を一台設置したシンプルなAMIMOTOスタックです。
![Simple EC2 Stack構成イメージ](img/simple-ec2.png "Simple EC2 Stack構成イメージ")
```
kumogata create simple-ec2-hvm.rb STACKNAME \
 -r REGION \
 -p "KeyName=KEYNAME,InstanceType=INSTANCE_TYPE"
```
