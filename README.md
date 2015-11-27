# amimot-enterprise-cfn
##About Branch

- master :リリース版
- staging :結合テスト
- topicbranch :単体テスト

##How To Build

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
元ネタ：[桶狭間合戦](https://ja.wikipedia.org/wiki/%E6%A1%B6%E7%8B%AD%E9%96%93%E3%81%AE%E6%88%A6%E3%81%84)

###Kawanakajima(HVM)
OkehazamaにマルチA-ZのRDSを追加したAMIMOTOスタックです。
MariaDBを使用し、通常のMySQL RDSより高いパフォーマンスを期待できます。
![Kawanakajima Stack構成イメージ](img/Kawanakajima.png "Kawanakajima Stack構成イメージ")
```
kumogata create kawanakajima-hvm-maria.rb STACKNAME \
 -r REGION \
-p "KeyName=KEYNAME,MySQLPassword=MYSQLPASS,MulitiAZDatabase=TRUE,RDSInstanceType=DB_INSTANCE_TYPE,InstanceType=EC2_INSTANCE_TYPE"
```
###Tedorigawa(HVM)
KawanakajimaのRDSをAmazon Auroraに切り替えたAMIMOTOスタックです。
MySQLの5倍のパフォーマンスを堪能されたい方にオススメです。
```
kumogata create kawanakajima-hvm-aurora.rb STACKNAME \
 -r REGION \
-p "KeyName=KEYNAME,MySQLPassword=MYSQLPASS,MulitiAZDatabase=TRUE,RDSInstanceType=DB_INSTANCE_TYPE,InstanceType=EC2_INSTANCE_TYPE"
```

###Anegawa(HVM)
CloudFrontを追加する予定です。

###Mikatagahara(HVM)
CloudWatchによるリソース監視体制を追加する予定です。

###Shizugatake(HVM)
S3を追加する予定です。

###Tennosan(HVM)
Elasticacheを追加する予定です。

###Sekigahara(HVM)
AWS WAFを追加する予定です。

###Tsushima(HVM)
CodeDeploy + AutoScaleを追加する予定です。
元ネタ:[日本海海戦](https://ja.wikipedia.org/wiki/%E6%97%A5%E6%9C%AC%E6%B5%B7%E6%B5%B7%E6%88%A6)
