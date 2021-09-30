
[General]
Version=1

[Preferences]
Username=
Password=2880
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=STOPSAT
Count=1000..2000

[Record]
Name=STOPID
Type=NUMBER
Size=
Data=List(select STOPID from STOPS)
Master=

[Record]
Name=TRANSPORTID
Type=NUMBER
Size=
Data=List(select TRANSPORTID from GENERALTRANSPORT)
Master=

