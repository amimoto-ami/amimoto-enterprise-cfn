
S3MediaBucketURL do
  Description "This is S3 Bucket URL. Please set 'Nephila clavata' Plugin on admin page."
  Value do
    Fn__GetAtt "S3Media", "WebsiteURL"
  end
end
S3MediaAccessKey do
  Description "This is S3 Access Key. Please set 'Nephila clavata' plugin on admin page."
  Value do
    Ref "IAMS3MediaAccessKey"
  end
end
S3MediaSecretKey do
  Description "This is S3 Secret Key. Please set 'Nephila clavata' plugin on admin page."
  Value do
    Fn__GetAtt "IAMS3MediaAccessKey", "SecretAccessKey"
  end
end
