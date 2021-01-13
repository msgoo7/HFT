mkdir -p ./stats
v=archiveStats/stats$(date +%d%h%y_%H_%M_%S)
mkdir -p $v
mv stats/* $v/.
tar -cvzf $v.tar.gz $v/*
rm -rf $v
