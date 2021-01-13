INSERT INTO ${refmaster}.eod_entity(entity) values ('After_Market_Orders') ;
INSERT INTO ${refmaster}.eod_action(entity,clean,clean_and_archive) values ('After_Market_Orders',1,0) ;

INSERT INTO ${refmaster}.eod_entity(entity) values ('Old_Positions') ;
INSERT INTO ${refmaster}.eod_action(entity,clean,clean_and_archive) values ('Old_Positions',1,1) ;

