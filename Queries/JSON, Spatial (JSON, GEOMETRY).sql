SELECT * FROM superstore_db.items
where properties -> "$.gluten_free" = 1;

SELECT * FROM superstore_db.items
where properties -> "$.gluten_free" = 0;

SELECT * FROM superstore_db.items
where properties -> "$.color" = "blue";
#OR
SELECT * FROM superstore_db.items
where json_extract(properties, "$.color") = "blue";