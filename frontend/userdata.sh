
#!/bin/bash
dnf install -y nginx
systemctl start nginx
systemctl enable nginx

cat <<EOF > /usr/share/nginx/html/index.html
<html>
  <body>
    <h1>Frontend Tier</h1>
    <button onclick="loadData()">Load Data</button>
    <p id="result"></p>

    <script>
      function loadData() {
        fetch("http://INTERNAL-ALB-DNS/api")
          .then(res => res.text())
          .then(data => document.getElementById("result").innerText = data);
      }
    </script>
  </body>
</html>
EOF
