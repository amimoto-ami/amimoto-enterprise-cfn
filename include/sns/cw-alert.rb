SNSCwAlert do
  Type "AWS::SNS::Topic"
  Properties do
    DisplayName "CPU_Alert"
    TopicName "CPU_Alert"
    Subscription [
      _{
        Endpoint do
          Ref "MailAddress"
        end
        Protocol "email"
      }
    ]
  end
end
