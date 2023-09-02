use food_db;

select 
	*,concat(name," - ",variant_name) as final_product, price+variant_price as final_price
    from items
    cross join variants;
    
    select 
	concat(name," - ",variant_name) as final_product, (price + variant_price) as final_price
    from items
    cross join variants;