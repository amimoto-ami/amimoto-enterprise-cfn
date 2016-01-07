# amimot-enterprise-cfn
##About Branch

- master :リリース版
- staging :結合テスト
- topicbranch :単体テスト

##Stack List
###Simple AMIMOTO Stack(HVM)
AMIMOTOを高いパフォーマンスで稼働させる最もシンプルなCloudFormationスタックです。
RDSやS3を活用することで高い耐障害性を実現し、CloudFrontによる負荷削減にも対応。


####Topology Diagram
![Topology Diagram](img/stack001.png "Topology Diagram")
```
kumogata create stack001.rb STACKNAME \
 -r REGION \
 -p "KeyName=KEYNAME,InstanceType=INSTANCE_TYPE,MySQLPassword=PASSWORD,MulitiAZDatabase=TRUEorFALSE,RDSInstanceType=RDS_INSTANCE_TYPE" \
 --capabilities=CAPABILITY_IAM
```


##Params

|Param Name|Default or Required|Description|
|:--|:--|
|KeyName|**Required**|SSH KeyName.|
|InstanceType|**Default:t2.small**|EC2 Instance Size.|
|MySQLPassword|**Required**|Database Password.|
|MulitiAZDatabase|**Default: false**|Define RDS Muliti-AZ Database.|
|RDSInstanceType|**Default: db.m3.medium**|RDS Instance Size.|
