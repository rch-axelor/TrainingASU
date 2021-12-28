/*Create one script to achieve following requirement fetch all the files recursively from the specified directory Path in argument 
check if the file is xml then copy it in directory named "xml" in current directory. 
check if filename contains any special character rename it to only alphanumeric name (means remove all special character from fileName)
check which file contains emailAddress and list out all those file names in file named "EmailAddressFiles.txt" and those emailAddress in file named "EmailAddresses.txt" in current directory. 
& replace @gmail.com in all emailAddresses in all files with @axelor.com.*/
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
