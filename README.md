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

###Okehazama(HVM)
VPC内にEC2を１台設置し、前面にELBを配置したAMIMOTOスタックです。
![Okehazama Stack構成イメージ](img/Okehazama.png "Okehazama Stack構成イメージ")
```
kumogata create okehazama-hvm.rb STACKNAME \
 -r REGION \
 -p "KeyName=KEYNAME,InstanceType=INSTANCE_TYPE"
```

###Anegawa(HVM)
※作成中
Okehazama にRDSを１台配置したAMIMOTOスタックです。

###Kawanakajima(HVM)
※作成予定
AnegawaのRDSをマルチA-ZにしたAMIMOTOスタックです。
