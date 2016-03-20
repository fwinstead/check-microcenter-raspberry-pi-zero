#!/bin/bash

# Check Microcenter stores for Raspberry Pi Zero's

STORE=(25 41  45  51  55  61  65  71  75  81  85  95  101  105  115  121  125  131  141  145  151  155  171  181  191)
NOW=$(date "+%Y_%m_%d_%H_%M")
for i in ${STORE[*]}
do
	printf "${NOW}\tStore: %3d\t" "$i"
	curl --header 'Cookie: storeSelected='"${i}" 'http://www.microcenter.com/product/457746/Zero_Development_Board'  -L -s | sed -n '/inventoryCnt/{s/.*Cnt\">//; s_<\/span> at _\t_; s/<.*//; p;}' 
	sleep $(( ( RANDOM % 10 )  + 1 ))
done | tee -a "microcenter.raspberry.pi.zero.csv"

exit

##################
# get stores from option values
# cat x | sed 's_<\/option>_\n_g;  s/<option value=\"//g; s/" selected="//g;  s/\">/\t/g;' | sort | grep -v "Web Store" | sed 's/\t.*/ /; s/^0//;' | tr '\n' ' '


