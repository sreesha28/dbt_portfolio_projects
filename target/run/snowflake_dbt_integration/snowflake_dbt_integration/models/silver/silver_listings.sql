-- back compat for old kwarg name
  
  begin;
    
        
            
	    
	    
            
        
    

    

    merge into SNOWFLAKE_WAREHOUSE.silver.silver_listings as DBT_INTERNAL_DEST
        using SNOWFLAKE_WAREHOUSE.silver.silver_listings__dbt_tmp as DBT_INTERNAL_SOURCE
        on ((DBT_INTERNAL_SOURCE.LISTING_ID = DBT_INTERNAL_DEST.LISTING_ID))

    
    when matched then update set
        "LISTING_ID" = DBT_INTERNAL_SOURCE."LISTING_ID","HOST_ID" = DBT_INTERNAL_SOURCE."HOST_ID","ROOM_TYPE" = DBT_INTERNAL_SOURCE."ROOM_TYPE","PRICE_PER_NIGHT" = DBT_INTERNAL_SOURCE."PRICE_PER_NIGHT","ACCOMMODATES" = DBT_INTERNAL_SOURCE."ACCOMMODATES","BEDROOMS" = DBT_INTERNAL_SOURCE."BEDROOMS","PRICE_TAG" = DBT_INTERNAL_SOURCE."PRICE_TAG"
    

    when not matched then insert
        ("LISTING_ID", "HOST_ID", "ROOM_TYPE", "PRICE_PER_NIGHT", "ACCOMMODATES", "BEDROOMS", "PRICE_TAG")
    values
        ("LISTING_ID", "HOST_ID", "ROOM_TYPE", "PRICE_PER_NIGHT", "ACCOMMODATES", "BEDROOMS", "PRICE_TAG")

;
    commit;