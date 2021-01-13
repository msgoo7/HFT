#!/bin/bash

SERVER_RESTART=0;
if [ $1 -eq 1 ]; then
  SERVER_RESTART=1;
fi

echo "Assemble Span Data  : $SERVER_RESTART" 

if [ $SERVER_RESTART = 0 ]; then
  (

  # Move Existing  Span Files to Archive and Create New Span Files With Headers

  mv  ./config/FileUploader/SpanMargin/span_data.csv ./config/FileUploader/SpanMargin/archive/span_data.csv

  echo "Exchange,PfID,InstrumentName,InstrumentType,Symbol,Expiry,ISIN,StrikePrice,OptionType,Price,Delta,PriceScan,SOM,R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,RiskDelta,Currency,CC"   >  ./config/FileUploader/SpanMargin/span_data.csv


  mv  ./config/FileUploader/SpanMargin/span_spread_data.csv ./config/FileUploader/SpanMargin/archive/span_spread_data.csv

  echo "Exchange,Symbol,FirstMonth,SecondMonth,Spread"   >  ./config/FileUploader/SpanMargin/span_spread_data.csv

  # Assemble All Exchange span files to span_data.csv  and span spread Files to span_spread_data.csv

  cat ./config/FileUploader/SpanMargin/span_data_* | sed 's/\r$//'     >>  ./config/FileUploader/SpanMargin/span_data.csv

  cat ./config/FileUploader/SpanMargin/span_spread_data_* | sed 's/\r$//'   >>  ./config/FileUploader/SpanMargin/span_spread_data.csv

  cat ./config/FileUploader/SpanMargin/currency_conversion_* | sed 's/\r$//'   >  ./config/FileUploader/SpanMargin/currency_conversion.csv

  )
fi

