with stg_salesorderheader as (
    select
        salesorderid,
        customerid,
        creditcardid,
        shiptoaddressid,
        status as orderstatus,
        cast(orderdate as date) as orderdate
    from {{ ref ('salesorderheader') }}
),
stg_salesorderdetail as (
    select
        salesorderid,
        salesorderdetailid,
        productid,
        orderqty,
        unitprice,
        unitprice * orderqty as revenue
    from {{ ref ('salesorderdetail') }}
)
select
    {{ dbt_utils.generate_surrogate_key(['stg_salesorderdetail.salesorderid','stg_salesorderdetail.salesorderdetailid']) }} as sales_key,
    stg_salesorderheader.salesorderid,
    salesorderdetailid,
    customerid,
    creditcardid,
    shiptoaddressid,
    unitprice,
    orderqty,
    revenue
from stg_salesorderdetail
join stg_salesorderheader on stg_salesorderdetail.salesorderid = stg_salesorderheader.salesorderid