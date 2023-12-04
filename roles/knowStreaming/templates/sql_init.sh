function init(){
    mysql -uroot -p{{application_db_pass}} -e "create database know_streaming;"
    mysql -uroot -p{{application_db_pass}}  -h 127.0.0.1 know_streaming < {{home}}/init/sql/ddl-ks-km.sql
    mysql -uroot -p{{application_db_pass}}  -h 127.0.0.1 know_streaming < {{home}}/init/sql/ddl-logi-job.sql
    mysql -uroot -p{{application_db_pass}}  -h 127.0.0.1 know_streaming < {{home}}/init/sql/ddl-logi-security.sql
    mysql -uroot -p{{application_db_pass}}  -h 127.0.0.1 know_streaming < {{home}}/init/sql/dml-ks-km.sql
    mysql -uroot -p{{application_db_pass}}  -h 127.0.0.1 know_streaming < {{home}}/init/sql/dml-logi.sql
}
init