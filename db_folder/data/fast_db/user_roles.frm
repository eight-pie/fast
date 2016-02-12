TYPE=VIEW
query=select `fast_db`.`users`.`LOGIN` AS `LOGIN`,`fast_db`.`rights`.`RIGHT_NAME` AS `RIGHT_NAME` from `fast_db`.`users` join `fast_db`.`rights` join `fast_db`.`acls` where ((`fast_db`.`rights`.`ID_RIGHT` = `fast_db`.`acls`.`RIGHT_ID`) and (`fast_db`.`users`.`ID_USER` = `fast_db`.`acls`.`USER_ID`))
md5=937c3ae0d7bb53e3127351464fad4cfc
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=2016-02-12 15:03:46
create-version=1
source=select LOGIN,RIGHT_NAME from USERS,RIGHTS,ACLS where ID_RIGHT=RIGHT_ID and ID_USER=USER_ID
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `fast_db`.`users`.`LOGIN` AS `LOGIN`,`fast_db`.`rights`.`RIGHT_NAME` AS `RIGHT_NAME` from `fast_db`.`users` join `fast_db`.`rights` join `fast_db`.`acls` where ((`fast_db`.`rights`.`ID_RIGHT` = `fast_db`.`acls`.`RIGHT_ID`) and (`fast_db`.`users`.`ID_USER` = `fast_db`.`acls`.`USER_ID`))
