CREATE TABLE ${appmaster}.user_ip_allowed(
  id varchar(25) not NULL,
  allowed_ip varchar(25) default '0.0.0.0' ,
  updateby varchar(25) not NULL,
  effective_time_stamp timestamp without time zone,
  FOREIGN KEY (id) REFERENCES unique_id(id)
)
