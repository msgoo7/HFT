create table if not exists ${appmaster}.indices (
    source_id char(10),
    market_id char(10),
    security_id int NOT NULL UNIQUE,
    scrip_name varchar(100),
    symbol varchar(50) PRIMARY KEY
);

delete from ${appmaster}.indices where market_id = 'NSECM';
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26000, 'Nifty 50', 'NIFTY50');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26013, 'Nifty Next 50', 'NIFTYNEXT50');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26012, 'Nifty 100', 'NIFTY100');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26033, 'Nifty 200', 'NIFTY200');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26006, 'Nifty 500', 'NIFTY500');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26040, 'Nifty100 Liq 15', 'Nifty100LIQ15');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26011, 'NIFTY MIDCAP 100', 'NIFTYMIDCAP100');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26014, 'Nifty Midcap 50', 'NFTYMCAP50');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26029, 'Nifty Auto', 'NIFTYAUTO');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26009, 'Nifty Bank', 'BANKNIFTY');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26021, 'Nifty FMCG', 'NIFTYFMCG');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26008, 'Nifty IT', 'NIFTYIT');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26031, 'Nifty Media', 'NIFTYMEDIA');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26030, 'Nifty Metal', 'NIFTYMETAL');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26023, 'Nifty Pharma', 'NIFTYPHARMA');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26025, 'Nifty PSU Bank', 'NIFTYPSUBANK');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26018, 'Nifty Realty', 'NIFTYREALTY');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26024, 'Nifty CPSE', 'NIFTYCPSE');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26020, 'Nifty Energy', 'NIFTYENERGY');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26019, 'Nifty Infra', 'NIFTYINFRA');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26036, 'Nifty Consumption', 'NIFTYCONSUMP');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26035, 'Nifty Commodities', 'NIFTYCOMMDIT');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26022, 'Nifty MNC', 'NIFTYMNC');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26041, 'Nifty50 Value 20', 'NIFTY50VALUE20');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26017, 'India VIX', 'INDIAVIX');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26016, 'HangSeng BeES-NAV', 'HNGSNGBEES');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26042, 'Nifty Div Opps 50', 'NIFTYDIVOPP50');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26044, 'Nifty Serv Sector', 'NIFTYSERVICESEC');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26045, 'Nifty Small 100', 'NIFTYSMALL100');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26028, 'S&P500', 'S&P500');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26043, 'Nifty Financial Services', 'NIFTYFINANCESER');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26001, 'Nifty Defty', 'DEFTY');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26032, 'Nifty Smallcap', 'NIFTYSMALCAP');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26037, 'Nifty Finance', 'NIFTYFINANCE');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26026, 'Nifty Service', 'NIFTYSERVICE');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26034, 'Nifty Dividend Oppt', 'NIFTYDIVOPPT');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26038, 'Nifty Dividend', 'NIFTYDIVND');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26039, 'FTSE 100', 'FTSE100');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26027, 'Dow Jones Ind Avg', 'DJIA');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26046, 'Nifty PSE', 'NIFTYPSE');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26048, 'Nifty GS Compsite', 'NIFTYGSCOMPSITE');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26049, 'Nifty GS 15YrPlus', 'NIFTYGS15YRPLUS');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26050, 'Nifty GS 11 15Yr', 'NIFTYGS1115YR');
