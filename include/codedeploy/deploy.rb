_include "include/iam/roles/codedeploy.rb"

AmimotoDeploy do
	Type "AWS::CodeDeploy::Application"
end

AmimotoDeploymentGroup do
	Type "AWS::CodeDeploy::DeploymentGroup"
	Properties do
		ApplicationName do
			Ref "AmimotoDeploy"
		end
		#AutoScalingGroups [
		# ASさせるときに設定する
		#]
		ServiceRoleArn do
			Fn__GetAtt "IAMRoleForCodeDeploy", "Arn"
		end
	end
end
