 INSERT INTO ${appmaster}.permission_templates 
( id, 
  name, 
  description, 
  branch, 
  creater_branch, 
  permission_type, 
  user_type, 
  updated_by, 
  effective_time_stamp )
VALUES (  
  (SELECT (coalesce(MAX(id), 0) + 1) FROM ${appmaster}.permission_templates),
  'DEALER_ALL',
  'Default permissions template', 
  'ROOTBRANCH',   
  'ROOTBRANCH',
  1,     
  2,
  '',
  now() );

INSERT INTO ${appmaster}.permission_template_details
( template_id, action_id, access_mode, updated_by, effective_time_stamp )
VALUES ( (SELECT (coalesce(MAX(id), 1)) FROM ${appmaster}.permission_templates),
  7, 2, '', now() ),
( (SELECT (coalesce(MAX(id), 1)) FROM ${appmaster}.permission_templates),
    11, 3, '', now() ),
( (SELECT (coalesce(MAX(id), 1)) FROM ${appmaster}.permission_templates),
  12, 3, '', now() ),
( (SELECT (coalesce(MAX(id), 1)) FROM ${appmaster}.permission_templates),
  13, 3, '', now() ),
( (SELECT (coalesce(MAX(id), 1)) FROM ${appmaster}.permission_templates),
  14, 2, '', now() ),
( (SELECT (coalesce(MAX(id), 1)) FROM ${appmaster}.permission_templates),
  22, 3, '', now() ),
( (SELECT (coalesce(MAX(id), 1)) FROM ${appmaster}.permission_templates),
  23, 3, '', now() ),
( (SELECT (coalesce(MAX(id), 1)) FROM ${appmaster}.permission_templates),
  24, 2, '', now() ),
( (SELECT (coalesce(MAX(id), 1)) FROM ${appmaster}.permission_templates),
  25, 2, '', now() ),
( (SELECT (coalesce(MAX(id), 1)) FROM ${appmaster}.permission_templates),
  30, 3, '', now() ),
( (SELECT (coalesce(MAX(id), 1)) FROM ${appmaster}.permission_templates),
  31, 3, '', now() ),
( (SELECT (coalesce(MAX(id), 1)) FROM ${appmaster}.permission_templates),
  32, 3, '', now() ),
( (SELECT (coalesce(MAX(id), 1)) FROM ${appmaster}.permission_templates),
  33, 3, '', now() ),
( (SELECT (coalesce(MAX(id), 1)) FROM ${appmaster}.permission_templates),
  34, 3, '', now() ),
( (SELECT (coalesce(MAX(id), 1)) FROM ${appmaster}.permission_templates),
  35, 3, '', now() ),
( (SELECT (coalesce(MAX(id), 1)) FROM ${appmaster}.permission_templates),
  36, 3, '', now() ),
( (SELECT (coalesce(MAX(id), 1)) FROM ${appmaster}.permission_templates),
  37, 3, '', now() ),
( (SELECT (coalesce(MAX(id), 1)) FROM ${appmaster}.permission_templates),
  38, 3, '', now() ),
( (SELECT (coalesce(MAX(id), 1)) FROM ${appmaster}.permission_templates),
  39, 3, '', now() ),
( (SELECT (coalesce(MAX(id), 1)) FROM ${appmaster}.permission_templates),
  40, 3, '', now() ),
( (SELECT (coalesce(MAX(id), 1)) FROM ${appmaster}.permission_templates),
  41, 3, '', now() ),
( (SELECT (coalesce(MAX(id), 1)) FROM ${appmaster}.permission_templates),
  42, 3, '', now() ),
( (SELECT (coalesce(MAX(id), 1)) FROM ${appmaster}.permission_templates),
  43, 3, '', now());
