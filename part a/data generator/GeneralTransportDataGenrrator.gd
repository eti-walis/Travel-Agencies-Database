
[General]
Version=1

[Preferences]
Username=
Password=2136
Database=
DateFormat=dd/mm/yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=ORDERS
Count=10..20

[Record]
Name=ORDERNUMBER
Type=NUMBER
Size=
Data=[9999]
Master=

[Record]
Name=RIDEDATE
Type=DATE
Size=
Data=Random('04/03/2021','01/01/2022')
Master=

[Record]
Name=PAYMENT
Type=NUMBER
Size=
Data=Random(500,2000)
Master=

[Record]
Name=NUMOFPASSENGERS
Type=NUMBER
Size=
Data=Random(10,200)
Master=

[Record]
Name=STARTPOINT
Type=VARCHAR2
Size=25
Data=Address1
Master=

[Record]
Name=CUSTOMERID
Type=NUMBER
Size=
Data=List(select CustomerId from Customer)
Master=

