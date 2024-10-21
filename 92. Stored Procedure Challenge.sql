USE SAMPLEDB
Go

--1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
SELECT *
FROM oes.inventories;

GO
CREATE PROCEDURE oes.getQuantityOnHand (@product_id INT, @warehouse_id INT)
AS
SELECT quantity_on_hand
FROM oes.inventories
WHERE product_id = @product_id AND warehouse_id = @warehouse_id;

EXECUTE oes.getQuantityOnHand @product_id = 4, @warehouse_id = 2;

--222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
SELECT product_name, list_price
FROM oes.products;

GO
CREATE PROCEDURE oes.getCurrentProducts (@product_name VARCHAR (100), @list_price DECIMAL(19,4))
AS 
SELECT *
FROM oes.products
WHERE discontinued = 0 AND product_name LIKE '%'+@product_name+'%' AND list_price <= @list_price;

EXECUTE oes.getCurrentProducts @product_name = 'Drone', @list_price = 700;

--33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
SELECT *
FROM oes.bank_accounts;

SELECT *
FROM oes.bank_transactions;

GO
CREATE PROCEDURE oes.transferFunds (@withdraw_account_id INT, @deposit_account_id INT, @transfer_amount DECIMAL(30,2))
AS

SET NOCOUNT ON;
SET XACT_ABORT ON;
BEGIN
BEGIN TRANSACTION;
UPDATE oes.bank_accounts
SET balance = balance - @transfer_amount 
WHERE account_id = @withdraw_account_id;

UPDATE oes.bank_accounts
SET balance = balance + @transfer_amount 
WHERE account_id = @deposit_account_id;

INSERT INTO oes.bank_transactions (from_account_id, to_account_id, amount)
VALUES (@withdraw_account_id, @deposit_account_id, @transfer_amount);
COMMIT TRANSACTION;
END;
--GO

EXECUTE oes.transferFunds @withdraw_account_id = 1 , @deposit_account_id = 2, @transfer_amount = 100;

