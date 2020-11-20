.separator ,


delete from customer; 
.import customer.csv customer

delete from itemledgerentry; 
.import itemledgerentry.csv itemledgerentry

delete from items; 
.import itembinding.csv items

delete from valueentries; 
.import valueentries.csv valueentries
