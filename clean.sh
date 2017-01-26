
## each folder knows to setup and clean itself, so
##
## Loop on each folder |X|
##  call X/clean.sh
##
for d in *
do
	if [ -d ${d} ]
	then
		echo "calling clean in $d"
		cd ${d}
		./clean.sh
		cd ..
	fi
done
