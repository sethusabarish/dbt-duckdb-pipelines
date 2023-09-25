with stg_product as (
    select *
    from {{ ref('product') }}
),

stg_product_subcategory as (
    select *
    from {{ ref('productsubcategory') }}
),

stg_product_category as (
    select *
    from {{ ref('productcategory') }}
)
SELECT 
    {{ dbt_utils.generate_surrogate_key(['stg_product.productid']) }} as product_key, --generate surrogatekeys
    stg_product.productid as productid,
    stg_product.name as product_name,
    stg_product.productnumber as productnumber,
    stg_product_subcategory.name as product_subcategory_name,
    stg_product_category.name as product_category_name
FROM stg_product
LEFT JOIN stg_product_subcategory on stg_product.productsubcategoryid = stg_product_subcategory.productsubcategoryid
LEFT JOIN stg_product_category on stg_product_subcategory.productcategoryid = stg_product_category.productcategoryid
