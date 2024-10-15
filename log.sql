
-- *** The Lost Letter ***
SELECT * from "addresses"
WHERE address LIKE "2 Fin%";

--use subqueries
SELECT * from "packages"
where from_address_id = (
    SELECT id from "addresses"
    WHERE address ="900 Somerville Avenue"
) AND to_address_id = (
    SELECT id from "addresses"
    WHERE address LIKE "2 Fin%"
);

-- *** The Devious Delivery ***

-- *** The Forgotten Gift ***


---find the id of gift was sent from 109 Tileston street
Select id from addresses
where address ="109 Tileston Street";

Select * from packages
where from_address_id = (
    Select id from addresses
    where address ="109 Tileston Street")
;

Select * from addresses
where id = 4983;

select id from packages
where from_address_id =(
    select id from address
    where address ="109 Tileston Street")
;
---
--- từ bản scan lấy ra thông tin của drivers mà k deliver cái món hàng
-- driver_id =11, vs đơn 7432
Select name from drivers
where id =(
    Select driver_id from scans
    where package_id =(
        select id from packages
        where from_address_id =(
            select id from addresses
            where address ="109 Tileston Street"
        )
    )
    ORDER BY timestamp DESC
    LIMIT 1
);


