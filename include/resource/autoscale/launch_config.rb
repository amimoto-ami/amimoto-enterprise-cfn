ASLaunchConfig do
	Type "AWS::AutoScaling::LaunchConfiguration"
	Metadata do
	  AWS__CloudFormation__Init do
		config do
		  files do
  		  _include "include/ec2/metadata-for-rds.rb"
		  end
		end
	  end
	end
	Properties do
		IamInstanceProfile do
			Ref "IAMForEC2"
		end
		ImageId do
			Fn__FindInMap [
				"MPAmimotov4",
				_{ Ref "AWS::Region" },
				"AMI"
			]
		end
		InstanceType {
			Ref "InstanceType"
		}
		SecurityGroups [
			_{
				Ref "SecurityGroupInstance"
			},
			_{
				Ref "SecurityGroupInternal"
			}
		]
		KeyName {
			Ref "KeyName"
		}
		UserData do
			Fn__Base64 do
				Fn__Join [
					"",
					[
						"#!/bin/bash\n",
						"/opt/aws/bin/cfn-init -s ",
						_{
						  Ref "AWS::StackName"
						},
						" -r ASLaunchConfig ",
						" --region ",
						_{
						  Ref "AWS::Region"
						},
						"\n",
						## Setup NFSv4 for EFS
						"yum install -y nfs-utils\n",
						"mount -t nfs4 -o nfsvers=4.1 $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone).",
						_{ Ref "EFSFileSystem" },
						".efs.",
						_{
						  Ref "AWS::Region"
						},
						".amazonaws.com:/ /var/www/html\n",
						## Install WP_CLI
						"WP_CLI=/usr/local/bin/wp\n",
						"cd /usr/local/bin\n",
						"/usr/bin/curl -fO https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar\n",
						"if [ -f wp-cli.phar ] ; then\n",
						  "mv -f wp-cli.phar /usr/local/bin/wp\n",
						  "chmod +x /usr/local/bin/wp\n",
						"fi\n",
						## Change web document root dir
						"tmp_json=`mktemp`\n",
						"amimoto_json='/opt/local/amimoto.json'\n",
						"json='{",
						"\"wordpress\":{\"document_root\":\"/var/www/html\",\"jinkei_cf\": \"true\"},",
						"\"nginx\" : { \"config\" : { \"user\" : \"ec2-user\" } },",
						"\"php\" : { \"config\" : { \"user\" : \"ec2-user\" } },",
						"\"run_list\" : [ \"recipe[amimoto]\" ]",
						"}'\n",
						"[ ! -e /opt/local ] && /bin/mkdir -p /opt/local\n",
						"if [ -f $amimoto_json ]; then\n",
						"  hash jq || /usr/bin/yum install -y jq\n",
						"  /usr/bin/jq -s '.[0] * .[1]' $amimoto_json <(echo $json) > $tmp_json\n",
						"else\n",
						"  echo $json > $tmp_json\n",
						"fi\n",
						"[ -f $tmp_json ] && /bin/mv -f $tmp_json $amimoto_json\n",
						## DIRオーナ変更
						"chown -R ec2-user:nginx /var/www/html\n",
						"echo '@reboot /bin/sh /opt/local/provision > /dev/null 2>&1; chown -R ec2-user /var/www/html/' | crontab\n",
						## Waite for Download WordPress
						"until [ `find /var/www/html -name local-salt.php` ]\n",
						"do\n",
						"sleep 5\n",
						"done\n",
						"sleep 5\n",
						## Install WordPres
						"if ! $(/usr/local/bin/wp core is-installed --allow-root); then\n",
						"/usr/local/bin/wp core install ",
						"--url=",
						_{ Ref "WebSiteDomain"},
						" ",
						"--admin_name=",
						_{ Ref "WPUserName"},
						" ",
						"--admin_email=",
						_{ Ref "WPUserEmail"},
						" ",
						"--admin_password=",
						_{ Ref "WPPassword" },
						" ",
						"--path=/var/www/html --allow-root ",
						" --title='Welcome to the AMIMOTO'",
						"\n",
						"fi\n"
					]
				]
			end
		end
	end
end
