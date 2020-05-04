.mode csv
.headers on
.once ItemValueEntry.csv
select distinct ile.entryno as EntryNo, ile.itemno as ItemNo, strftime('%d/%m/%Y',ile.postingdate) as PostingDate, ile.entrytype as EntryType, ile.unitofmeasurecode as UnitOfMeasureCode, ile.qtyperunitofmeasure as Quantity, ile.open as Open, ile.storecode as StoreCode, cust.no as 'Site Number',  ile.documentno as DocumentNo, 'GBR' as Countrycode, ile.completelyinvoiced as CompletelyInvoiced, totals.costamountactual as 'Cost Amount Actual'  from itemledgerentry as ile  left join valueentries as ve on ve.ledgerentryno=ile.entryno left join customer as cust on propertyno = storecode  left join sumledgerentries as totals on totals.entryno=ile.entryno where ile.entryno is not null and ile.postingdate <='2020-03-26';
.once StockItem.csv
select distinct no as 'Item Code', description as 'Item Description', baseunitofmeasure as 'Base Unit of Measure', inventorypostinggroup as 'Inventory Posting Group' , unitcost as 'Unit Cost', itemstatuscode as 'Item Status Code' , case country when 'Malaysia' then 'MYR'  when 'Germany' then 'EUR' when 'UK' then 'GBP' END as Currency, case country when 'Malaysia' then 'MYS'  when 'Germany' then 'DEU' when 'UK' then 'GBR' END as CountryCode from items where no is not null;