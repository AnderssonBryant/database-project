CREATE TABLE customers (
    customerID INT PRIMARY KEY NOT NULL,
    custFirstName VARCHAR(50),
    custLastName VARCHAR(50),
    custBirthDate DATE,
    genderID INT,
    custEmail VARCHAR(100),
    custPhone VARCHAR(20),
    custAddress VARCHAR(100),
    cityID INT,
    provinceID INT,
    countryID INT,
    postalCode VARCHAR(15)
)

CREATE TABLE orders (
    orderID INT PRIMARY KEY NOT NULL,
    CustomerID INT,
    orderDate DATE,
    orderStatusID INT,
    shippedDate DATE,
    shipmentID INT,
    paymentID INT,
    note VARCHAR(300)
)

CREATE TABLE shipments(
    shipmentID INT PRIMARY KEY NOT NULL,
    courierName VARCHAR(50),
    noResi VARCHAR(25),
    note VARCHAR(300)
)

CREATE TABLE OrderDetails(
    orderID INT,
    productID INT,
    quantity INT,
    printEach NUMBER,
    shippingFEE NUMBER,
    insuranceFEE NUMBER
)

CREATE TABLE Cities(
    cityID INT PRIMARY KEY NOT NULL,
    cityName VARCHAR(50)
)

CREATE TABLE Provinces(
    provinceID INT PRIMARY KEY NOT NULL,
    provinceName VARCHAR(50)
)

CREATE TABLE Countries (
    countryID INT PRIMARY KEY NOT NULL,
    countryName VARCHAR(50),
    twoLetterCode VARCHAR(2),
    telephoneCode VARCHAR(10)
)

CREATE TABLE Genders(
    genderID INT PRIMARY KEY NOT NULL,
    gender VARCHAR(20)
)

CREATE TABLE OrderStatuses(
    orderStatusID INT PRIMARY KEY NOT NULL,
    orderStatuseName VARCHAR(50),
    note VARCHAR(300)
)

CREATE TABLE payments(
    paymentID INT PRIMARY KEY NOT NULL,
    customerID INT,
    paymentMethodID INT,
    paymentStatusID INT,
    paymentAmount NUMBER,
    paymentDate DATE,
    discountID INT,
    invoiceID INT
)

CREATE TABLE paymentstatuses(
    paymentStatusID INT PRIMARY KEY NOT NULL,
    paymentStatusName VARCHAR(50)
)

CREATE TABLE discounts(
    discountCode VARCHAR(10) PRIMARY KEY NOT NULL,
    discountName VARCHAR(50),
    discountValue NUMBER,
    discountTerms VARCHAR(100)
)

CREATE TABLE PaymentMethods(
    paymentMethodID INT PRIMARY KEY NOT NULL,
    methodName VARCHAR(50)
)

CREATE TABLE invoice(
    invoiceID INT PRIMARY KEY NOT NULL,
    invoiceNumber VARCHAR(30),
    invoiceDate DATE,
    customerID INT,
    totalBill NUMBER,
    totalPayment NUMBER,
    paymentMethodID INT
)

CREATE TABLE products(
    productID INT PRIMARY KEY NOT NULL,
    productName VARCHAR(50),
    productImage BLOB,
    productCondition VARCHAR(10),
    productWeight NUMBER,
    productVariant VARCHAR(500),
    productDiscussion VARCHAR(500),
    productReview VARCHAR(500),
    ProductPrice NUMBER,
    quantityinstock INT,
    storeID INT,
    categoryID INT
)

CREATE TABLE categories (
    categoryID INT PRIMARY KEY NOT NULL,
    categoryName VARCHAR(50),
    subCategory VARCHAR(50)
)

CREATE TABLE Stores(
    storeID INT PRIMARY KEY NOT NULL,
    merchantID INT,
    storeName VARCHAR(50),
    storeDesc VARCHAR(100),
    storeReview VARCHAR(100),
    storeEarning NUMBER,
    storeSale INT,
    officialStore VARCHAR(1),
    storeAddress VARCHAR(50),
    cityID INT,
    provinceID INT,
    countryID INT,
    postalCode INT
)

CREATE TABLE Merchants(
    merchantID INT PRIMARY KEY NOT NULL,
    merchantFirstName VARCHAR(50),
    merchantLastName VARCHAR(50),
    merchantBirthDay DATE,
    genderID INT,
    merchantEmail VARCHAR(100),
    merchantPhone VARCHAR(20),
    merchantAddress VARCHAR(50),
    cityID INT,
    provinceID INT,
    countryID INT,
    postalCode VARCHAR(15),
    noKTP INT,
    noNPWP INT
)

CREATE TABLE employees(
    employeeID INT PRIMARY KEY NOT NULL,
    employeeFirstName VARCHAR(50),
    employeeLastName VARCHAR(50),
    employeeBirthDate DATE,
    genderID INT,
    employeeEmail VARCHAR(100),
    employeePhone INT,
    employeeAddress VARCHAR(100),
    cityID INT,
    provinceID INT,
    countryID INT,
    postalCode VARCHAR(15),
    hireDate DATE,
    Salary INT,
    reportsToManager INT,
    noKTP INT,
    noNPWP VARCHAR(25),
    education VARCHAR(25),
    married VARCHAR(1)
)

ALTER TABLE customers
ADD FOREIGN KEY (genderID) REFERENCES genders(genderID);

ALTER TABLE customers
ADD FOREIGN KEY (cityID) REFERENCES cities(cityID);

ALTER TABLE customers
ADD FOREIGN KEY (provinceID) REFERENCES provinces(provinceID);

ALTER TABLE customers
ADD FOREIGN KEY (countryID) REFERENCES countries(countryID);

ALTER TABLE orders
ADD FOREIGN KEY (customerID) REFERENCES customers(customerID);

ALTER TABLE orders
ADD FOREIGN KEY (orderstatusID) REFERENCES orderstatuses(orderstatusID);

ALTER TABLE orders
ADD FOREIGN KEY (shipmentID) REFERENCES shipments(shipmentID);

ALTER TABLE orders
ADD FOREIGN KEY (paymentID) REFERENCES payments(paymentID);

ALTER TABLE orderdetails
ADD FOREIGN KEY (orderID) REFERENCES orders(orderID);

ALTER TABLE orderdetails
ADD FOREIGN KEY (productID) REFERENCES products(productID);

ALTER TABLE products
ADD FOREIGN KEY (storeID) REFERENCES stores(storeID);

ALTER TABLE products
ADD FOREIGN KEY (categoryID) REFERENCES categories(categoryID);

ALTER TABLE payments
ADD FOREIGN KEY (customerID) REFERENCES customers(customerID);

ALTER TABLE payments
ADD FOREIGN KEY (paymentMethodID) REFERENCES paymentMethods(paymentMethodID);

ALTER TABLE payments
ADD FOREIGN KEY (paymentStatusID) REFERENCES paymentstatuses(paymentstatusID);

ALTER TABLE payments
DROP COLUMN discountID;

ALTER TABLE payments
ADD discountCode varchar(10);

ALTER TABLE payments
ADD FOREIGN KEY (discountCode) REFERENCES discounts(discountCode);

ALTER TABLE payments
ADD FOREIGN KEY (invoiceID) REFERENCES invoice(invoiceID);

ALTER TABLE invoice
ADD FOREIGN KEY (customerID) REFERENCES customers(customerID);

ALTER TABLE invoice
ADD FOREIGN KEY (paymentMethodID) REFERENCES paymentMethods(paymentmethodID);

ALTER TABLE stores 
ADD FOREIGN KEY (merchantID) REFERENCES merchants(merchantID);

ALTER TABLE stores
ADD FOREIGN KEY (cityID) REFERENCES cities(cityID);

ALTER TABLE stores
ADD FOREIGN KEY (provinceID) REFERENCES provinces(provinceID);

ALTER TABLE stores
ADD FOREIGN KEY (countryID) REFERENCES countries(countryID);

ALTER TABLE merchants
ADD FOREIGN KEY (cityID) REFERENCES cities(cityID);

ALTER TABLE merchants
ADD FOREIGN KEY (provinceID) REFERENCES provinces(provinceID);

ALTER TABLE merchants
ADD FOREIGN KEY (countryID) REFERENCES countries(countryID);

ALTER TABLE merchants
ADD FOREIGN KEY (genderID) REFERENCES genders(genderID);

ALTER TABLE employees
ADD FOREIGN KEY (cityID) REFERENCES cities(cityID);

ALTER TABLE employees
ADD FOREIGN KEY (provinceID) REFERENCES provinces(provinceID);

ALTER TABLE employees
ADD FOREIGN KEY (countryID) REFERENCES countries(countryID);

ALTER TABLE employees
ADD FOREIGN KEY (genderID) REFERENCES genders(genderID);

insert into cities values ('101','Bandung')
insert into cities values ('102','Yogyakarta')
insert into cities values ('103','Jakarta')

insert into provinces values ('201','Jabar')
insert into provinces values ('202','Jateng')

insert into countries values ('001','Indonesia','ID','+62')

insert into genders values ('1','Pria')
insert into genders values ('0','Wanita')

insert into customers values ('9701','Kevin','Alexander',to_date('10/23/1997'),'1','alexanderkevin@mail.com','08463729182','Jl.Sukajadi no.95','101','201','001','40756');
insert into customers values ('9901','Samuel','Setiawan',to_date('08/10/1999'),'1','samuel.setiawan@mail.com','08694039209','Jl.Cibadak no.88','101','201','001','40190');
insert into customers values ('9001','Maria','Magdalena',to_date('05/18/1990'),'0','mariamagdalena@mail.com','08578301834','Jl.Jaksa no.101','103','201','001','40531');

insert into merchants values ('2048','Dina','Susanto',to_date('07/11/1995'),'0','susanto.dina@mail.com','0893872671','Jl.Agus Salim no.73','102','202','001','40890',
'00389478162901','0');
insert into merchants values ('2049','Adam','William',to_date('05/10/1998'),'1','adam.william@mail.com','0819053428','Jl.Sukajadi no.120','101','201','001','40290',
'00301938291019','0');
insert into merchants values ('2050','Toni','Lim',to_date('02/12/2000'),'1','tonilim@mail.com','087345271893','Jl.Gajah Mada no.60','103','201','001','40708',
'00289301938932','0');
insert into merchants values ('2051','Jason','Tan',to_date('01/09/1999'),'1','jasontan@mail.com','089482023949','Jl.Abimanyu no.12','102','202','001','40546',
'00289301938932','0');

insert into orderstatuses values ('01','Processing','-')
insert into orderstatuses values ('02','Delivering','-')
insert into orderstatuses values ('03','Delivered','-')

insert into shipments values ('713','JNE','1073852694','reguler')
insert into shipments values ('724','Gojek','G-3298563829','instant')
insert into shipments values ('733','SiCepat','0038926710','kilat')

insert into paymentmethods values ('111','Debit')
insert into paymentmethods values ('112','Credit')

insert into paymentstatuses values ('210','Menunggu pembayaran')
insert into paymentstatuses values ('211','Memverifikasi pembayaran')
insert into paymentstatuses values ('212','Pembayaran terverifikasi')

insert into invoice values ('501','INV/223/445/687',to_date('07/11/2020'),'9701','130000','130000','111')
insert into invoice values ('502','INV/523/746/891',to_date('10/01/2020'),'9901','300000','130000','112')
insert into invoice values ('503','INV/145/321/760',to_date('12/20/2020'),'9001','140000','130000','111')

insert into stores values ('312','2048','Home Supply','-','-','0','0','Y','Jl.Agus Salim no.73','102','202','001','40890')
insert into stores values ('313','2049','Dream Factory','-','-','0','0','N','Jl.Sukajadi no.120','101','201','001','40290')
insert into stores values ('314','2050','Unique Store','-','-','0','0','N','Jl.Gajah Mada no.60','103','201','001','40708')

insert into categories values ('301','Electronic','-')
insert into categories values ('302','Hobby','-')
insert into categories values ('303','Fashion','-')

insert into products values ('3011','Lampu LED Osram','678543','Baru','87','-','-','-','65000','20','312','301')
insert into products values ('3021','Bola Basket Spalding','890675','Baru','500','-','-','-','300000','5','313','302')
insert into products values ('3031','Jaket Hoodie Nike','647289','Baru','450','-','-','-','140000','10','314','303')

insert into discounts values ('ELTK10','untuk kategori elektronic','0.1','minimal pembelian 100000')
insert into discounts values ('HOB20','untuk kategori hobby','0.2','minimal pembelian 200000')
insert into discounts values ('FASH10','untuk kategori fashion','0.1','minimal pembelian 120000')

insert into payments values ('601','9701','111','212','130000',to_date('07/11/2020'),'501','ELTK10')
insert into payments values ('602','9901','111','210','300000',to_date('10/01/2020'),'502','HOB20')
insert into payments values ('603','9001','111','211','300000',to_date('12/20/2020'),'503','FASH10')

insert into orders values ('801','9701',to_date('07/11/2020'),'02',to_date('07/12/2020'),'713','601','-')
insert into orders values ('802','9901',to_date('10/01/2020'),'03',to_date('10/01/2020'),'724','602','-')
insert into orders values ('803','9001',to_date('12/20/2020'),'02',to_date('12/21/2020'),'733','603','-')

insert into orderdetails values ('801','3011','2','65000','10000','0')
insert into orderdetails values ('802','3021','1','300000','10000','3000')
insert into orderdetails values ('803','3031','1','140000','10000','1400')

insert into employees values ('401','Justin','Jon',to_date('04/24/1996'),'1','justjon@mail.com','087271894690','Jl.Dewi Sartika no.50','103','201','001','40381',to_date('01/15/2019'),'1500000','2',
'03918304829109','-','S1','Y');

create or replace function totalCustomer 
return number is
total number(2) := 0;
begin
select count(*) into total
from customers ;

return total;
end;

declare
a number(2);
begin
a := totalCustomer;
dbms_output.put_line ('Jumlah customer : '|| a);
end;

create or replace function totalMerchant 
return number is
total number(2) := 0;
begin
select count(*) into total
from merchants;

return total;
end;

declare
b number(2);
begin
b := totalMerchant;
dbms_output.put_line ('Jumlah Merchant : '|| b);
end;

create trigger order_detail
before insert or update
on orderdetails for each row 
declare
asuransi number;
begin
asuransi := :old.insurancefee + :new.insurancefee;
dbms_output.put_line ('Asuransi lama : '|| :old.insurancefee);
dbms_output.put_line ('Asuransi baru : '|| :new.insurancefee);
dbms_output.put_line ('Asuransi : '|| asuransi);
end;

update orderdetails set 
insurancefee = (quantity * printeach) * 1/100
where orderID = 801; 

create trigger customer_address
before insert or update
on customers for each row
declare
address varchar(50);
begin
dbms_output.put_line ('Alamat lama : '|| :old.custaddress);
dbms_output.put_line ('Alamat baru : '|| :new.custaddress);
end;

update customers set
custaddress = 'JL.Dago no.23'
where customerID ='9701';

update customers set
custaddress = 'JL.Setiabudi no.12'
where customerID ='9701';

create procedure bonusEmpSalary (x in number, y in number, z out number)
is
begin
update employees set salary = salary * y
where employeeID = x;
commit;
select salary into z from employees where employeeID = x;
end;

declare
c number;
begin
bonusEmpSalary('401','1.03',c);
end;

create procedure earning (x in number, y in number, z out number)
is
begin
update stores set storeearning = storeearning + y
where storeID = x;
commit;
select storeearning into z from stores where storeID = x;
end;

declare
d number;
begin 
earning ('312','130000',d);
end;

declare
e number;
begin 
earning ('313','300000',e);
end;

select * from cities
select * from provinces
select * from countries
select * from genders
select * from customers
select * from merchants
select * from orderstatuses
select * from shipments
select * from paymentmethods
select * from paymentstatuses
select * from invoice
select * from stores
select * from categories
select * from products
select * from discounts
select * from payments
select * from orders
select * from orderdetails
select * from employees