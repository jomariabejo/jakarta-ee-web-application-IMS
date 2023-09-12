create database motorph_inventory;

use motorph_inventory;

create table inventory_data(
    data_id INT AUTO_INCREMENT Primary key,
    date_entered DATE,
    stock_label	ENUM('Old','New'),
    brand ENUM('Honda', 'Kawasaki','Kymco','Suzuki','Yamaha'),
    engine_number varchar(100),
    status enum('Onhand','Sold')
);

-- sample data
    INSERT INTO inventory_data (date_entered, stock_label, brand, engine_number, status)
VALUES
    ('2023-02-01', 'Old', 'Honda', '142QVTSIUR', 'Onhand'),
    ('2023-02-01', 'Old', 'Honda', 'PZCT1S00XE', 'Sold'),
    ('2023-02-01', 'Old', 'Honda', '4VBTV8YNM7', 'Sold'),
    ('2023-02-01', 'Old', 'Honda', '95AN3AWVF4', 'Onhand'),
    ('2023-02-03', 'Old', 'Kawasaki', '483QHIM661', 'Onhand'),
    ('2023-02-03', 'Old', 'Kymco', 'SPHA17SSEE', 'Onhand'),
    ('2023-02-03', 'Old', 'Kymco', '0AV7SWGX93', 'Sold'),
    ('2023-02-04', 'Old', 'Kymco', 'QMUB6UYLKL', 'Sold'),
    ('2023-02-04', 'Old', 'Honda', 'V96GMTFFEI', 'Sold'),
    ('2023-02-05', 'Old', 'Kawasaki', '4J8UA0FMVY', 'Sold'),
    ('2023-02-05', 'Old', 'Kawasaki', 'A8BDL926FA', 'Sold'),
    ('2023-02-05', 'Old', 'Kawasaki', 'X8G5ZZ7A69', 'Sold'),
    ('2023-02-06', 'Old', 'Honda', 'TY5SU0WPDX', 'Onhand'),
    ('2023-02-06', 'Old', 'Honda', '5Q0EZG7WKB', 'Onhand'),
    ('2023-02-06', 'Old', 'Suzuki', '9XUOUOJ2XZ', 'Onhand'),
    ('2023-02-06', 'Old', 'Kymco', 'YUL4UTC4FU', 'Onhand'),
    ('2023-02-06', 'Old', 'Kymco', '2ESQRHAXWG', 'Onhand'),
    ('2023-02-07', 'Old', 'Kymco', 'J8JA99VWZE', 'Sold'),
    ('2023-02-07', 'Old', 'Kymco', 'NS530HOT9H', 'Sold'),
    ('2023-02-07', 'Old', 'Suzuki', 'URIA0XXM05', 'Sold'),
    ('2023-02-07', 'Old', 'Yamaha', 'IDN93SI4KW', 'Sold'),
    ('2023-02-07', 'Old', 'Honda', 'PVAWKD51CE', 'Sold'),
    ('2023-02-07', 'Old', 'Honda', 'K4KHCQAU41', 'Sold'),
    ('2023-02-08', 'Old', 'Honda', 'Z4NY5JGZZT', 'Sold'),
    ('2023-02-08', 'Old', 'Honda', 'IRQACSKUNZ', 'Sold'),
    ('2023-02-08', 'Old', 'Yamaha', 'TMZCTALNDL', 'Sold'),
    ('2023-02-08', 'Old', 'Yamaha', 'DVFUIA0YVB', 'Sold'),
    ('2023-02-08', 'Old', 'Kymco', '4M793VVAHI', 'Onhand'),
    ('2023-02-08', 'Old', 'Suzuki', '5N7IQVJ2BA', 'Onhand'),
    ('2023-03-01', 'New', 'Suzuki', 'NO8VW05PU9', 'Onhand'),
    ('2023-03-01', 'New', 'Yamaha', 'NWIP2MQEIN', 'Sold'),
    ('2023-03-01', 'New', 'Kawasaki', '1HCWCVZSX8', 'Sold'),
    ('2023-03-03', 'New', 'Kawasaki', 'Z46VKPIJBY', 'Sold'),
    ('2023-03-03', 'New', 'Kawasaki', 'LYQVEHJ6IU', 'Sold'),
    ('2023-03-03', 'New', 'Yamaha', 'BVGQQNMATL', 'Sold'),
    ('2023-03-04', 'New', 'Kymco', 'URWMSQZCBU', 'Sold'),
    ('2023-03-04', 'New', 'Yamaha', '5NGI5UZ8T2', 'Onhand'),
    ('2023-03-05', 'New', 'Honda', 'W2UYM0EIRS', 'Onhand'),
    ('2023-03-05', 'New', 'Honda', 'AITLTSJUK2', 'Onhand'),
    ('2023-03-05', 'New', 'Yamaha', '45CNYV7IFF', 'Onhand'),
    ('2023-03-06', 'New', 'Kymco', 'MXS36NKV96', 'Sold'),
    ('2023-03-06', 'New', 'Kymco', 'PWM3MJWPYE', 'Sold'),
    ('2023-03-06', 'New', 'Kymco', '5I80N9HB7W', 'Sold'),
    ('2023-03-06', 'New', 'Yamaha', 'D01JMJL9PG', 'Onhand'),
    ('2023-03-06', 'New', 'Suzuki', '1R88BOJW8W', 'Onhand'),
    ('2023-03-07', 'New', 'Suzuki', 'LAMH9Y1YD6', 'Onhand'),
    ('2023-03-07', 'New', 'Yamaha', '02G7NJCRGS', 'Onhand'),
    ('2023-03-07', 'New', 'Kawasaki', '392XSUBMUW', 'Onhand');
