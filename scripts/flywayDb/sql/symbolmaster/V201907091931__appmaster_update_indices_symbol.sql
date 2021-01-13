--==================================================
--Change symbol name to scrip name for indices
--==================================================
delete from ${appmaster}.indices where market_id = 'NSECM';
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26000, 'Nifty 50', 'Nifty 50');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26013, 'Nifty Next 50', 'Nifty Next 50');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26012, 'Nifty 100', 'Nifty 100');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26033, 'Nifty 200', 'Nifty 200');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26006, 'Nifty 500', 'Nifty 500');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26040, 'Nifty100 Liq 15', 'Nifty100 Liq 15');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26011, 'NIFTY MIDCAP 100', 'NIFTY MIDCAP 100');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26014, 'Nifty Midcap 50', 'Nifty Midcap 50');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26029, 'Nifty Auto', 'Nifty Auto');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26009, 'Nifty Bank', 'Nifty Bank');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26021, 'Nifty FMCG', 'Nifty FMCG');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26008, 'Nifty IT', 'Nifty IT');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26031, 'Nifty Media', 'Nifty Media');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26030, 'Nifty Metal', 'Nifty Metal');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26023, 'Nifty Pharma', 'Nifty Pharma');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26025, 'Nifty PSU Bank', 'Nifty PSU Bank');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26018, 'Nifty Realty', 'Nifty Realty');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26024, 'Nifty CPSE', 'Nifty CPSE');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26020, 'Nifty Energy', 'Nifty Energy');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26019, 'Nifty Infra', 'Nifty Infra');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26036, 'Nifty Consumption', 'Nifty Consumption');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26035, 'Nifty Commodities', 'Nifty Commodities');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26022, 'Nifty MNC', 'Nifty MNC');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26041, 'Nifty50 Value 20', 'Nifty50 Value 20');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26017, 'India VIX', 'India VIX');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26016, 'HangSeng BeES-NAV', 'HangSeng BeES-NAV');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26042, 'Nifty Div Opps 50', 'Nifty Div Opps 50');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26044, 'Nifty Serv Sector', 'Nifty Serv Sector');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26045, 'Nifty Small 100', 'Nifty Small 100');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26028, 'S&P500', 'S&P500');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26043, 'Nifty Financial Services', 'Nifty Financial Services');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26001, 'Nifty Defty', 'Nifty Defty');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26032, 'Nifty Smallcap', 'Nifty Smallcap');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26037, 'Nifty Finance', 'Nifty Finance');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26026, 'Nifty Service', 'Nifty Service');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26034, 'Nifty Dividend Oppt', 'Nifty Dividend Oppt');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26038, 'Nifty Dividend', 'Nifty Dividend');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26039, 'FTSE 100', 'FTSE 100');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26027, 'Dow Jones Ind Avg', 'Dow Jones Ind Avg');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26046, 'Nifty PSE', 'Nifty PSE');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26048, 'Nifty GS Compsite', 'Nifty GS Compsite');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26049, 'Nifty GS 15YrPlus', 'Nifty GS 15YrPlus');
insert into ${appmaster}.indices values ('DEFAULT','NSECM', 26050, 'Nifty GS 11 15Yr', 'Nifty GS 11 15Yr');

