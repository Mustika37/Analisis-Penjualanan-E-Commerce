--Tampilan untuk di Dashboard
select 
  distinct(marketplace),
  sum(total_order) as total_revenue,
  sum(qty) as total_qty_sold,
  sum(refund_amount) as total_refund,
  round(sum(total_order)/count(distinct order_id), 2) as AOV,
  round(sum(refund_amount)/sum(total_order)*100, 2) as refunds_value_rate
from `rock-figure-339413.Data2.sales2`
group by 1

--Total Orders diberbagai marketplace
select 
  distinct(marketplace),
  count(distinct order_id) as total_orders
from `rock-figure-339413.Data2.sales2`
group by 1

--Total Revenue dalam harian
select
  format_date('%A', tanggal_order) AS Nama_Hari,
  SUM(total_order) as revenue
from `rock-figure-339413.Data2.sales2`
group by 1

--Total Revenue dalam bulanan
select
  format_date('%B', tanggal_order) as Bulan,
  SUM(total_order) as revenue
from `rock-figure-339413.Data2.sales2`
group by 1

--Total Reveun dalam tahunan
select
  format_date('%Y', tanggal_order) as Tahun,
  SUM(total_order) as revenue
from `rock-figure-339413.Data2.sales2`
group by 1

--Total Qty terjual dalam category produk
select 
  distinct(kategori),
  sum(qty) as total_produk_sold
from `rock-figure-339413.Data2.sales2`
group by 1

--Total Revenue & Total refunds (nominal)
select
  sum(total_order) as revenue,
  sum(refund_amount) as total_refunds
from `rock-figure-339413.Data2.sales2`

--produk yang laku terjual 10
select
  distinct(produk_nama),
  sum(qty) as total_produk_sold
from `rock-figure-339413.Data2.sales2`
group by 1
order by 2 desc
limit 10

--menggunakan rank() produk yang laku terjual 10
select
  DISTINCT(produk_nama),
  rank() over (order by sum(qty) desc) as qty_rank
from `rock-figure-339413.Data2.sales2`
group by 1
limit 10

--produk yang ga laku terjual 10
select
  distinct(produk_nama),
  sum(qty) as total_produk_sold
from `rock-figure-339413.Data2.sales2`
group by 1
order by 2 asc
limit 10



