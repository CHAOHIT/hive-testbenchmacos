#!/bin/bash

for line in `cat allfile`
do
    hive -e "use tpcds_bin_partitioned_orc_1000; source $line" &> tmp_$line
    echo $line  `grep -i "time taken" tmp_$line | tail -1 |awk '{print $3}'`>>tpcds_bin_partitioned_orc_1000_01
done
