-- Query to migrate all existing clients to Unique Id Table of mutradePlus

insert into ${appmaster}.unique_id ( id, id_type, parent_id)
select distinct on(primaryclientcode) primaryclientcode,0,'ROOTBRANCH' from childparentcodemapping where primaryclientcode != 'PRO'
and
primaryclientcode != 'DMS'
and
primaryclientcode != 'SUPERADMIN'
and
primaryclientcode != 'ROOTBRANCH'
and
primaryclientcode != 'root'
and 
primaryclientcode != 'NONE';



--Query To migrate all existing clients to client table of mutradePlus

insert into ${appmaster}.client (id, first_name, phone, email, account_status, account_validity, client_type, updated_by, effective_timestamp)
select distinct on(primaryclientcode) primaryclientcode, name,'','',0, now() + interval '1 year', 1, 'SUPERADMIN', now()
from childparentcodemapping where primaryclientcode != 'PRO';


--Query To exisiting client's password to user_password table of mutradePlus

insert into ${appmaster}.user_password(id, password, salt, passwords_already_attempted, user_password_state, updated_by, effective_timestamp)
select distinct on(c.primaryclientcode) c.primaryclientcode, '24c6530a3613ccb3bf19cc4a8a0db46d0e8b547f',
'da39a3ee5e6b4b0d3255bfef95601890afd80709', 0 , 'N','SUPERADMIN', now() from childparentcodemapping as c;

--Query to provide login Privileges to existing clients by making
--their entry int login_privileges_permissions table of mutradePlus

insert into ${appmaster}.login_privileges_permissions(id, is_desktop_platform_allowed, dekstop_permissions, is_web_platform_allowed,
  is_mobile_platform_allowed, updated_by, effective_timestamp)
select distinct on(c.primaryclientcode) c.primaryclientcode, 't', 'All', 'f', 'f', 'SUPERADMIN', now()
from childparentcodemapping as c where c.primaryclientcode != 'PRO';


--Query to get data in ChildParentCodeMapping and ClientCodeDetail to
--be sent in client_exchange_settings table of mutradePlus so that exisiting exchange settings
--of each client can be migrated

insert into ${appmaster}.client_exchange_settings
(exchange, segment, id, ucc, participant_type, participant_code, account_type, is_ucc_inherited, updated_by, effective_timestamp )
select
childparentcodemapping.exchangeid,
childparentcodemapping.segmenttype,
childparentcodemapping.primaryclientcode,
childparentcodemapping.exchangeclientcode,
childparentcodemapping.parttype,
clientcodedetail.participantcode,
clientcodedetail.accounttype, 'f','SUPERADMIN', now() from childparentcodemapping
INNER JOIN clientcodedetail ON
childparentcodemapping.exchangeclientcode = clientcodedetail.exchangeclientcode
and
childparentcodemapping.exchangeid = clientcodedetail.exchangeid
and
childparentcodemapping.segmenttype = clientcodedetail.segmenttype;


--Query to update is_ucc_inherited and ucc_inherited_from values in 
--client_exchange_settings table of mutradePlus

update ${appmaster}.client_exchange_settings AS c set is_ucc_inherited = 't', ucc_inherited_from = c.ucc 
FROM childparentcodemapping AS m where c.ucc = m.exchangeclientcode and
c.exchange = m.exchangeid and
c.segment = m.segmenttype and
c.ucc != c.id;


--Query to migrate exisiting delaer client mappings 
--from loginidclientcodemapping to dealer_client_mappings

insert into ${appmaster}.dealer_client_mappings (dealer_id, client_id, effective_date)
select l.loginid, l.primaryclientcode, now() 
from loginidclientcodemapping as l group by l.loginid, l.primaryclientcode;

--Query to empty some personal info of PRO
update ${appmaster}.client set email = '', phone = '' where id = 'PRO';
