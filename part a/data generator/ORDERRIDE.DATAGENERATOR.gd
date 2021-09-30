
[General]
Version=1

[Preferences]
Username=
Password=2324
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=ORDERRIDE
Count=1000..2000

[Record]
Name=TRANSPORTID
Type=NUMBER
Size=
Data=List(select TRANSPORTID from SPECIALTRANSPORT)
Master=

[Record]
Name=ORDERNUMBER
Type=NUMBER
Size=
Data=List(select ORDERNUMBER from ORDERS)
Master=

