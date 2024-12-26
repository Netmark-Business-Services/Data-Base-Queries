   
   
   

SELECT 
	ashf.SUPPLIER_NAME AS ASHF_SUPPLIER_NAME,
	ashf.SUPPLIER_HCC_ID AS ASHF_SUPPLIER_HCC_ID,
	ashf.SUPPLIER_STATUS ,
--	ashf.SUPPLIER_NPI  AS ASHF_SUPPLIER_NPI,
--    TE.TAX_ID AS  ASHF_TAX_ID,
    D.DATE_VALUE AS Supplier_first_effective_date, 
    DD.DATE_VALUE AS Supplier_effective_date, 
    DDD.DATE_VALUE AS Supplier_term_date, 
    D1.DATE_VALUE AS Version_eff_date,
    D2.DATE_VALUE AS Version_exp_date
--    alef.ENTRY_TIME 
FROM 
	payor_dw.ALL_SUPPLIER_HISTORY_FACT ashf 
LEFT JOIN
	payor_dw.POSTAL_ADDRESS pa ON ASHF.SUPPLIER_CORR_ADDRESS_KEY = pa.POSTAL_ADDRESS_KEY
--LEFT JOIN 
--	payor_dw.AUDIT_LOG_ENTRY_FACT alef ON ashf.AUDIT_LOG_KEY = alef.AUDIT_LOG_KEY 
LEFT JOIN 
	payor_dw.SUPPLIER_LOCATION sl ON ashf.SUPPLIER_KEY = sl.SUPPLIER_KEY 
LEFT JOIN 
	PAYOR_DW.TAX_ENTITY TE ON ashf.TAX_ENTITY_KEY = TE.TAX_ENTITY_KEY 
LEFT JOIN 
    PAYOR_DW.DATE_DIMENSION D ON ashf.FIRST_EFFECTIVE_DATE_KEY = D.DATE_KEY
LEFT JOIN 
    PAYOR_DW.DATE_DIMENSION DD ON ashf.SUPPLIER_EFFECTIVE_DATE_KEY = DD.DATE_KEY
LEFT JOIN 
    PAYOR_DW.DATE_DIMENSION DDD ON ashf.SUPPLIER_TERMINATION_DATE_KEY = DDD.DATE_KEY
LEFT JOIN 
    PAYOR_DW.DATE_DIMENSION D1 ON ashf.VERSION_EFF_DATE_KEY = D1.DATE_KEY
LEFT JOIN 
    PAYOR_DW.DATE_DIMENSION D2 ON ashf.VERSION_EXP_DATE_KEY = D2.DATE_KEY
WHERE 
	ashf.SUPPLIER_HCC_ID = '9903548'