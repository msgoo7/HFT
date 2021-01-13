update clientcode_grossexposurelimit set grossvalue = grossvalue/100 where exchangeId =72 and segmenttype =1;
update clientcode_grossexposurelimit set grossvalue = grossvalue/100 where exchangeId IN (7,6);
update clientcode_grossexposurelimit set grossvalue = grossvalue/10000 where exchangeId =9;
update clientcode_grossexposuresecuritywiselimit set grossvalue = grossvalue/100 where exchangeId =72 and segmenttype =1;
update clientcode_grossexposuresecuritywiselimit set grossvalue = grossvalue/100 where exchangeId IN (7,6);
update clientcode_grossexposuresecuritywiselimit set grossvalue = grossvalue/10000 where exchangeId=9;
update clientcode_orderlimits set (maximumsingleordervalue,maximumtotalbuyvalue,maximumtotalsellvalue,maximumnetvalue,maximumm2mloss,maximumoutstandingtotalbuyvalue,maximumoutstandingtotalsellvalue,deposit) =
(maximumsingleordervalue/10000,maximumtotalbuyvalue/10000,maximumtotalsellvalue/10000,maximumnetvalue/10000,maximumm2mloss/10000,maximumoutstandingtotalbuyvalue/10000,maximumoutstandingtotalsellvalue/10000,deposit/10000) where exchangeId=9;
update clientcode_orderlimits set (maximumsingleordervalue,maximumtotalbuyvalue,maximumtotalsellvalue,maximumnetvalue,maximumm2mloss,maximumoutstandingtotalbuyvalue,maximumoutstandingtotalsellvalue,deposit) =
(maximumsingleordervalue/100,maximumtotalbuyvalue/100,maximumtotalsellvalue/100,maximumnetvalue/100,maximumm2mloss/100,maximumoutstandingtotalbuyvalue/100,maximumoutstandingtotalsellvalue/100,deposit/100) where exchangeId IN (7,6);
update clientcode_orderlimits set (maximumsingleordervalue,maximumtotalbuyvalue,maximumtotalsellvalue,maximumnetvalue,maximumm2mloss,maximumoutstandingtotalbuyvalue,maximumoutstandingtotalsellvalue,deposit) =
(maximumsingleordervalue/100,maximumtotalbuyvalue/100,maximumtotalsellvalue/100,maximumnetvalue/100,maximumm2mloss/100,maximumoutstandingtotalbuyvalue/100,maximumoutstandingtotalsellvalue/100,deposit/100) where exchangeId=72 and segmenttype=1;
update dealerid_grossexposuresecuritywiselimit set grossvalue = grossvalue/100 where exchangeId =72 and segmenttype =1;
update dealerid_grossexposuresecuritywiselimit set grossvalue = grossvalue/100 where exchangeId IN (7,6);
update dealerid_grossexposuresecuritywiselimit set grossvalue = grossvalue/10000 where exchangeId=9;
update SecurityWise_Limit
set (totalbuyvalue,totalsellvalue) = 
(totalbuyvalue/10000,totalsellvalue/10000) 
where cast(symbolid as text)  like  '_9%'; 
update SecurityWise_Limit
set (totalbuyvalue,totalsellvalue) = 
(totalbuyvalue/100,totalsellvalue/100) 
where cast(symbolid as text)  similar to '(_7%|_6%)'; 
update SecurityWise_Limit
set (totalbuyvalue,totalsellvalue) = 
(totalbuyvalue/100,totalsellvalue/100) 
where cast(symbolid as text)  like '_721%'; 
