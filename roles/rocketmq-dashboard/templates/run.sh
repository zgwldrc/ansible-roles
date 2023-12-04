#!/bin/bash
exec {{java_home}}/bin/java \
  -Xms{{Xms}} \
  -Xmx{{Xmx}} \
  -Xmn{{Xmn}} \
  -Dendpoints.env.enabled=false \
  -Dlogback.configurationFile={{home}}/logback.xml \
  -jar {{archive_file}}