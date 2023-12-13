#converts (866) 879-7647 and similar phone numbers into FSSFDGDStD
#Appends 10 characters from my name after the third phone number in the file


s/[()]//g
s/[[:space:]]//g
s/[-]//g
s/([[:digit:]]{2})([[:digit:]])([[:digit:]]{4})([[:digit:]])([[:digit:]]{2})/\1\4\3\2\5/g
s/1/w/g
s/2/e/g
s/3/r/g
s/4/t/g
s/5/A/g
s/6/S/g
s/7/D/g
s/8/F/g
s/9/G/g
s/0/q/g
3 a DanielMore
