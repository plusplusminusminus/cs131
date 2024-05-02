BEGIN {
	FS=","
	RS="\n"
	OFS=","
}
NR == 1 {
	next
}

{
	sum=0
	for(i=4;i<=34;i++) {
		sum+=$i
	}
	print $1,sum
}
