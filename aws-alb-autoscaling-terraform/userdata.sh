#!/bin/bash
set -eux

dnf update -y
dnf install -y httpd

TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
  -s http://169.254.169.254/latest/meta-data/instance-id)

AZ=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
  -s http://169.254.169.254/latest/meta-data/placement/availability-zone)

cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html>
<head>
  <title>CloudFit Fitness Tracker</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 50px;
      background: linear-gradient(135deg, #667eea, #764ba2);
      color: white;
    }
    .container {
      background: rgba(255,255,255,0.1);
      padding: 30px;
      border-radius: 10px;
      max-width: 700px;
    }
    .info {
      background: rgba(0,0,0,0.2);
      padding: 15px;
      margin: 10px 0;
      border-radius: 5px;
    }
    h1 {
      margin-top: 0;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>CloudFit Fitness Tracker</h1>
    <div class="info"><strong>Instance ID:</strong> ${INSTANCE_ID}</div>
    <div class="info"><strong>Availability Zone:</strong> ${AZ}</div>
    <div class="info"><strong>Status:</strong> Load Balancing Active</div>
  </div>
</body>
</html>
EOF

echo "OK" > /var/www/html/health.html

systemctl enable httpd
systemctl start httpd