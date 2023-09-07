#!/bin/bash
exec {{java_home}}/bin/java \
  --add-opens java.rmi/javax.rmi.ssl=ALL-UNNAMED \
  -server -Xms{{Xms}} -Xmx{{Xmx}} -Xmn{{Xmn}} \
  -Dspring.config.additional-location={{home}}/etc/config.yaml \
  -jar {{home}}/bin/{{archive_file}}