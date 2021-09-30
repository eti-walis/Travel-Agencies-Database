
[General]
Version=1

[Preferences]
Username=
Password=2578
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=ORDER_DESTINATION
Count=1000..2000

[Record]
Name=DESTINATION
Type=VARCHAR2
Size=25
Data=Address1
Master=

[Record]
Name=ORDERNUMBER
Type=NUMBER
Size=
Data=List(select ORDERNUMBER from ORDERs)
Master=

