
[General]
Version=1

[Preferences]
Username=
Password=2516
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=SPECIALTRANSPORT
Count=500..550

[Record]
Name=TRANSPORTID
Type=NUMBER
Size=
Data=List(select TRANSPORTID from TRANSPORT)
Master=

[Record]
Name=NUMOFRIDES
Type=NUMBER
Size=
Data=Random(10,60)
Master=

