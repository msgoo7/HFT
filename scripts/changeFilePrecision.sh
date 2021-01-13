cp ./config/risk.csv risk_$(date +%m_%d_%y_%H_%M_%S).csv
cat ./config/risk.csv | grep "VALUE" > updatedRisk.csv
./updateFilePrecision.py < ./config/risk.csv >> updatedRisk.csv
cp updatedRisk.csv ./config/risk.csv

cp ./config/globalrisk.csv globalRisk_$(date +%m_%d_%y_%H_%M_%S).csv
cat ./config/globalrisk.csv | grep "VAL" > updatedGlobalRisk.csv
./updateGlobalFilePrecision.py < ./config/globalrisk.csv >> updatedGlobalRisk.csv
cp updatedGlobalRisk.csv ./config/globalrisk.csv
