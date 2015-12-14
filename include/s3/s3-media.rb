S3Media do
  Type "AWS::S3::Bucket"
  Properties do
    WebsiteConfiguration do
      IndexDocument "index.html"
    end
  end
end

##@TODO アクセス許可の設定が必要
##@TODO 絡新婦用のIAMロールの作成
##@TODO EC2アタッチ済みのロールに上記ロール追加
