 tail -f /var/log/httpd/access_log | grep -i -v --line-buffered "jpg\|png\|gif\|js\|css\|server-status"
