"Customers": {"pos": (10, 90), "fields": ["CustomerID", "Name", "Email", "Preferences", "Mood"]},
        "Menu Items": {"pos": (10, 70), "fields": ["ItemID", "Name", "CategoryID", "Price", "SpecialFlag"]},
        "Orders": {"pos": (50, 90), "fields": ["OrderID", "CustomerID", "Timestamp", "Status", "TotalPrice"]},
        "Order Details": {"pos": (90, 90), "fields": ["DetailID", "OrderID", "ItemID", "Quantity", "Customizations"]},
        "Payment": {"pos": (50, 70), "fields": ["PaymentID", "OrderID", "Method", "Status", "Amount"]},
        "Inventory": {"pos": (90, 70), "fields": ["InventoryID", "ItemID", "Quantity", "Threshold"]},
        "Feedback": {"pos": (50, 50), "fields": ["FeedbackID", "CustomerID", "OrderID", "Rating", "Comments"]},
        "Analytics": {"pos": (10, 50), "fields": ["ReportID", "Date", "TotalSales", "PeakTimes", "CustomerFlow"]},
        "Notifications": {"pos": (90, 50), "fields": ["NotificationID", "CustomerID", "Message", "Status"]},
        "User Sessions": {"pos": (10, 30), "fields": ["SessionID", "CustomerID", "StartTimestamp", "EndTimestamp"]}



    Customers: 
        CustomerID: int
        Name: str
        Email: str
        Preferences: str
        Mood ENUM('Happy', 'Calm', 'Anxious', 'Sad')
    
    Menu Items:
        ItemID: int
        Name: str
        CategoryID: int
        Price: float
        SpecialFlag: bool

    -- 假设您已经创建了 Customers 和 Menu Items 表
        CREATE TABLE Orders (
        OrderID int PRIMARY KEY,
        CustomerID int,
        Timestamp datetime,
        Status str,
        TotalPrice float,
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
        );

        CREATE TABLE OrderDetails (
        DetailID int PRIMARY KEY,
        OrderID int,
        ItemID int,
        Quantity int,
        Customizations str,
        FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
        FOREIGN KEY (ItemID) REFERENCES MenuItems(ItemID)
        );



        Payment:
            PaymentID: int
            OrderID: int
            Method: str
            Status: str
            Amount: float
        

    Inventory:
        InventoryID: int
        ItemID: int
        Quantity: int
        Threshold: int

    Feedback:

        FeedbackID: int
        CustomerID: int
        OrderID: int
        Rating: int
        Comments: str


    Analytics:

        ReportID: int
        Date: datetime
        TotalSales: float
        PeakTimes: str
        CustomerFlow: str

    
    Notifications:
    
            NotificationID: int
            CustomerID: int
            Message: str
            Status: str 

    Sessions_for_improvement:

        SessionID: int
        CustomerID: int
        StartTimestamp: datetime
        EndTimestamp: datetime


    
        








CREATE TABLE Customers (
    CustomerID int PRIMARY KEY,
    Name varchar(255),
    Email varchar(255),
    Preferences text,
    Mood ENUM('Happy', 'Calm', 'Anxious', 'Sad')
);

Table Customers {
    CustomerID integer [primary key]
    Name varchar(255)
    Email varchar(255)
    Preferences text
    Mood post_status [note: 'Can be Happy, Calm, Anxious, Sad']
}

CREATE TABLE MenuItems (
    ItemID int PRIMARY KEY,
    Name varchar(255),
    CategoryID int,
    Price float,
    SpecialFlag bool
);

TABLE MenuItems {
    ItemID integer [primary key]
    Name varchar(255)
    CategoryID integer
    Price float
    SpecialFlag boolean
}

CREATE TABLE Tables (
    TableID int PRIMARY KEY,
    Number int NOT NULL,
    Status varchar(50) NOT NULL,
    Capacity int
);

TABLE Tables {
    TableID integer [primary key]
    Number integer
    Status varchar(50)
    Capacity integer
}

CREATE TABLE Orders (
    OrderID int PRIMARY KEY,
    CustomerID int,
    TableID int,
    Timestamp datetime,
    Status varchar(50),
    TotalPrice float,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (TableID) REFERENCES Tables(TableID)
);

TABLE Orders {
    OrderID integer [primary key]
    CustomerID integer
    TableID integer
    Timestamp datetime
    Status varchar(50)
    TotalPrice float
}

CREATE TABLE OrderDetails (
    DetailID int PRIMARY KEY,
    OrderID int,
    ItemID int,
    Quantity int,
    Customizations text,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ItemID) REFERENCES MenuItems(ItemID)
);



CREATE TABLE Payments (
    PaymentID int PRIMARY KEY,
    OrderID int,
    Method varchar(50),
    Status varchar(50),
    Amount float,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

TABLE Payments {
    PaymentID integer [primary key]
    OrderID integer
    Method varchar(50)
    Status varchar(50)
    Amount float
}

CREATE TABLE Inventory (
    InventoryID int PRIMARY KEY,
    ItemID int,
    Quantity int,
    Threshold int,
    FOREIGN KEY (ItemID) REFERENCES MenuItems(ItemID)
);

TABLE Inventory {
    InventoryID integer [primary key]
    ItemID integer
    Quantity integer
    Threshold integer
}

CREATE TABLE Feedback (
    FeedbackID int PRIMARY KEY,
    CustomerID int,
    OrderID int,
    Rating int,
    Comments text,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

TABLE Feedback {
    FeedbackID integer [primary key]
    CustomerID integer
    OrderID integer
    Rating integer
    Comments text
}

CREATE TABLE Analytics (
    ReportID int PRIMARY KEY,
    Date datetime,
    TotalSales float,
    PeakTimes varchar(255),
    CustomerFlow varchar(255)
);

TABLE Analytics {
    ReportID integer [primary key]
    Date datetime
    TotalSales float
    PeakTimes varchar(255)
    CustomerFlow varchar(255)
}

CREATE TABLE Notifications (
    NotificationID int PRIMARY KEY,
    CustomerID int,
    Message text,
    Status varchar(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

TABLE Notifications {
    NotificationID integer [primary key]
    CustomerID integer
    Message text
    Status varchar(50)
}

CREATE TABLE QRCodes (
    QRCodeID int PRIMARY KEY,
    TableID int NOT NULL,
    CodeData text NOT NULL,
    CreatedAt datetime NOT NULL,
    FOREIGN KEY (TableID) REFERENCES Tables(TableID)
);

TABLE QRCodes {
    QRCodeID integer [primary key]
    TableID integer
    CodeData text
    CreatedAt datetime
}















Table Customers {
    UserID integer [primary key]
    Name varchar(255)
    Email varchar(255)
    Password varchar(255)
    Preferences text
    Mood post_status [note: 'Can be Happy, Calm, Anxious, Sad']
}

TABLE MenuItems {
    ItemID integer [primary key]
    Name varchar(255)
    CategoryID integer
    Price float
    SpecialFlag boolean
}

TABLE Tables {
    TableID integer [primary key]
    Number integer
    Status varchar(50)
    Capacity integer
}

TABLE Orders {
    OrderID integer [primary key]
    CustomerID integer
    TableID integer
    Timestamp datetime
    Status varchar(50)
    TotalPrice float
}

TABLE Order_Details {
    DetailID integer [primary key]
    OrderID integer
    ItemID integer
    Quantity integer
    Customizations text
}

TABLE Payments {
    PaymentID integer [primary key]
    OrderID integer
    Method varchar(50)
    Status varchar(50)
    Amount float
}

TABLE Storage {
    StorageID integer [primary key]
    ItemID integer
    Quantity integer
    Threshold integer
}

TABLE Feedback {
    FeedbackID integer [primary key]
    CustomerID integer
    OrderID integer
    Rating integer
    Comments text
}

TABLE Notifications {
    NotificationID integer [primary key]
    CustomerID integer
    Message text
    Status varchar(50)
}

TABLE QRCodes {
    QRCodeID integer [primary key]
    TableID integer
    CodeData text
    CreatedAt datetime
}




Ref: Orders.CustomerID > Customers.UserID // many-to-one
Ref: Orders.TableID > Tables.TableID // many-to-one
Ref: Order_Details.OrderID > Orders.OrderID // many-to-one
Ref: Order_Details.ItemID > MenuItems.ItemID // many-to-one
Ref: Payments.OrderID > Orders.OrderID // many-to-one
Ref: Storage.ItemID > MenuItems.ItemID // many-to-one
Ref: Feedback.CustomerID > Customers.UserID // many-to-one
Ref: Feedback.OrderID > Orders.OrderID // many-to-one
Ref: Notifications.CustomerID > Customers.UserID // many-to-one
Ref: QRCodes.TableID > Tables.TableID // many-to-one



