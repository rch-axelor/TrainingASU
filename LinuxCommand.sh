#!/bin/bash
read -p "Please Enter Path:" r1
for i in $(dir "$r1");do echo $i;done
cd $r1
mkdir -p xml
touch EmailAddresstext.txt EmailAddress.txt
for x in *.xml; 
do 
	cp $x xml;
done
for x in *;
do 
if [ -f "$x" ]
then 
	sed -E 's/[^[:alnum:][:space:].]+/s/g' $x;
fi
done
for x in *;
do
if [ -f "$x" ];
then
	grep -E -o -l "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b" $x;
fi;
done>|EmailAddresstext.txt
for x in *;
do
if [ -f "$x" ];
then
	grep -E -o "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b" $x;
fi;
done>|EmailAddress.txt
sed -i 's/@gmail.com/@axelor.com/g' EmailAddress.txt
