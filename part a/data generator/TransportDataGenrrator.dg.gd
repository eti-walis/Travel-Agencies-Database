
[General]
Version=1

[Preferences]
Username=
Password=2850
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=TRANSPORT
Count=1000..2000

[Record]
Name=TRANSPORTID
Type=NUMBER
Size=
Data=[99999999]
Master=

[Record]
Name=NUMOFPLACES
Type=NUMBER
Size=
Data=[99]
Master=

[Record]
Name=DRIVERID
Type=NUMBER
Size=
Data=List(select DRIVERID from DRIVER)
Master=

