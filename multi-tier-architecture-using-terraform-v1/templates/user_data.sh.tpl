#!/bin/bash
set -xe

dnf update -y
dnf install -y nginx

TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600" -s)

INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s \
  http://169.254.169.254/latest/meta-data/instance-id)

PRIVATE_IP=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s \
  http://169.254.169.254/latest/meta-data/local-ipv4)

HOSTNAME=$(hostname)

cat > /usr/share/nginx/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
  <title>${project_name}</title>
</head>
<body style="font-family: Arial; text-align:center; margin-top:50px;">
  <h1>Multi-Tier Architecture using Terraform</h1>
  <h2>App Tier is Running</h2>
  <p><strong>Instance ID:</strong> $INSTANCE_ID</p>
  <p><strong>Private IP:</strong> $PRIVATE_IP</p>
  <p><strong>Hostname:</strong> $HOSTNAME</p>
  <p><strong>Region:</strong> ${aws_region}</p>
</body>
</html>
EOF

systemctl enable nginx
systemctl restart nginx