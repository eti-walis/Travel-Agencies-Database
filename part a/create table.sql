CREATE TABLE Customer
(
  LastName varchar2(10) NOT NULL,
  FirstName varchar2(10) NOT NULL,
  CustomerId INT NOT NULL,
  PhoneNumber INT NOT NULL,
  PRIMARY KEY (CustomerId)
);

CREATE TABLE Driver
(
  DriverId INT NOT NULL,
  LicenseNumber INT NOT NULL,
  Phonumber INT NOT NULL,
  PRIMARY KEY (DriverId)
);

CREATE TABLE Stops
(
  Addresss varchar2(25) NOT NULL,
  StopId INT NOT NULL,
  PRIMARY KEY (StopId)
);

CREATE TABLE Transport
(
  TransportId INT NOT NULL,
  NumOfPlaces INT NOT NULL,
  DriverId INT NOT NULL,
  PRIMARY KEY (TransportId),
  FOREIGN KEY (DriverId) REFERENCES Driver(DriverId)
);

CREATE TABLE Orders
(
  OrderNumber INT NOT NULL,
  RideDate date NOT NULL,
  Payment INT NOT NULL,
  numOfPassengers INT NOT NULL,
  StartPoint varchar2(25) NOT NULL,
  CustomerId INT NOT NULL,
  PRIMARY KEY (OrderNumber),
  FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId)
);

CREATE TABLE SpecialTransport
(
  TransportId INT NOT NULL,
  NumOfRides INT NOT NULL,
  PRIMARY KEY (TransportId),
  FOREIGN KEY (TransportId) REFERENCES Transport(TransportId)
);

CREATE TABLE OrderRide
(
  TransportId INT NOT NULL,
  OrderNumber INT NOT NULL,
  PRIMARY KEY (TransportId,OrderNumber),
  FOREIGN KEY (TransportId) REFERENCES Specialtransport(TransportId),
  FOREIGN KEY (OrderNumber) REFERENCES Orders(OrderNumber)
);

CREATE TABLE GeneralTransport
(
  TransportId INT NOT NULL,
  PRIMARY KEY (TransportId),
  FOREIGN KEY (TransportId) REFERENCES Transport(TransportId)
);

CREATE TABLE Order_Destination
(
  Destination varchar2(25) NOT NULL,
  OrderNumber INT NOT NULL,
  PRIMARY KEY (Destination, OrderNumber),
  FOREIGN KEY (OrderNumber) REFERENCES Orders(OrderNumber)
);

CREATE TABLE StopsAT
(
  StopId INT NOT NULL,
  TransportId INT NOT NULL,
  PRIMARY KEY (StopId, TransportId),
  FOREIGN KEY (StopId) REFERENCES Stops(StopId),
  FOREIGN KEY (TransportId) REFERENCES GeneralTransport(TransportId)
);
CREATE TABLE stations_history
(
  StopId INT NOT NULL,
  TransportId INT NOT NULL,
  PRIMARY KEY (StopId, TransportId)
);
