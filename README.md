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
s
###Kawanakajima(HVM)
AnegawaのRDSをマルチA-ZにしたAMIMOTOスタックです。
MariaDB版とAurora版の２テンプレートがあります。
![Kawanakajima Stack構成イメージ](img/Kawanakajima.png "Kawanakajima Stack構成イメージ")
####MariaDB版
```
kumogata create kawanakajima-hvm-maria.rb STACKNAME \
 -r REGION \
-p "KeyName=KEYNAME,MySQLPassword=MYSQLPASS,MulitiAZDatabase=TRUE,RDSInstanceType=DB_INSTANCE_TYPE,InstanceType=EC2_INSTANCE_TYPE"
```
####Amazon Aurora版
```
kumogata create kawanakajima-hvm-aurora.rb STACKNAME \
 -r REGION \
-p "KeyName=KEYNAME,MySQLPassword=MYSQLPASS,MulitiAZDatabase=TRUE,RDSInstanceType=DB_INSTANCE_TYPE,InstanceType=EC2_INSTANCE_TYPE"
```
