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

--Total revenue pada seluruh penjualan
select sum(total_order) as revenue
from `rock-figure-339413.Data2.sales2`


--Total Orders diberbagai marketplace
select 
  distinct(marketplace),
  count(distinct order_id) as total_orders
from `rock-figure-339413.Data2.sales2`
group by 1
order by 2 desc

--Total produk terjual
select 
  sum(qty) as Total_qty_terjual
from `rock-figure-339413.Data2.sales2`


--AOV (setiap customer belanja berapa transaksi yang di keluarkan(uang) (nominal)
  round(sum(total_order)/count(order_id), 2) as AOV
from `rock-figure-339413.Data2.sales2`

--Refund Value Rate (%)
select 
  round((sum(refund_amount)/sum(total_order) *100), 2) as Refund_Value_Rate
from `rock-figure-339413.Data2.sales2`

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

--Total Revenue dalam tahunan
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

--Total pendapatan yang berkontribusi di setiap marketplace
select
  marketplace,
  sum(total_order) as Total_Revenue
from `rock-figure-339413.Data2.sales2`
group by 1
order by 2 desc

--produk yang laku terjual 10
select
  produk_nama,
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
