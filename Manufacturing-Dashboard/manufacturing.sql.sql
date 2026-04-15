
select * from Manufacturingdata;

# Manufacturing Qty (KPI 1)

select sum(TotalQTY) as Total_Manufacturing_Quantity,
format_number(sum(totalqty))
 as Total_Manufacturing_QTY
 from Manufacturingdata;
 
 # Total Rejected QTY (2nd KPI)
 
 select sum(rejected_qty) as Rejected_QTY,
format_number(sum(rejected_qty)) 
 as Rejected_Quantity
 from Manufacturingdata;
 
 # Processed Qty (3rd KPI)
 
 
 select sum(processed_qty) as processed_qty,
 format_number(sum(processed_qty))
 as Processed_Quantity
 from Manufacturingdata;
 
# Wastage Quantity (4th KPI)

select sum(processed_qty) as Processed_Qty,
sum(produced_qty) as Produced_Qty,
sum(processed_qty)-sum(produced_qty)
as Wastage_Quantity from manufacturingdata;
 
# Employee Wise Rejected Qty (5th KPI)

select emp_name,sum(rejected_qty) as Rejected_quantity,
format_number(sum(rejected_qty)) as Rejected_Qty
from Manufacturingdata
group by emp_name; 


# Machine Wise Rejected Qty (6th KPI)

select Machine_code, sum(Rejected_Qty) as Rejected_Qty,
format_number(sum(Rejected_qty)) as Rejected_Quantity
from manufacturingdata
group by Machine_Code;

# Production Comparison Trend 

select Month_Name,production_Qty from(
select monthname(doc_date) as Month_Name,
month(doc_date)as month_no,
format_number(sum(Produced_Qty)) as Production_Qty
from manufacturingdata
Group by Month_Name,month_no
order by month_no) a ;


# Manufacture Vs Rejected

select Month_Name,Produced_Qty,Rejected_Qty from(
select monthname(doc_date) as Month_Name,
month(doc_date) month_no,
format_number(sum(produced_qty)) as Produced_Qty,
format_number(sum(rejected_Qty)) as Rejected_Qty
from manufacturingdata
Group by Month_name,month_no) as a;



# Department Wise Manufacture Vs Rejected

select Department_name,
format_number(sum(produced_qty)) as Manufactured_Qty,
format_number(sum(rejected_Qty)) as Rejected_Qty
from manufacturingdata
Group by Department_Name;