-- set show_desktop to true to show first two BSE and NSE links on desktop 

UPDATE  ${refmaster}.market_hyperlinks SET show_desktop = 't' where ordernum IN ('1', '2');
