SELECT 
	DOMAIN_ID,
	BATCH_ID,
	JOB_TYPE,
	COM_CD,
	'SKU_CD' AS CELL_ASSGN_TYPE,
	SKU_CD AS CELL_ASSGN_CD,
	SKU_NM AS CELL_ASSGN_NM,
	EQUIP_TYPE,
	:equipCd AS EQUIP_CD,
	1 AS SKU_QTY,
	SUM(ORDER_QTY) AS TOTAL_PCS
FROM ORDERS
WHERE DOMAIN_ID = :domainId
  AND BATCH_ID = :batchId
GROUP BY 
	DOMAIN_ID,
	BATCH_ID,
	JOB_TYPE,
	COM_CD,
	SKU_CD ,
	SKU_NM ,
	EQUIP_TYPE
ORDER BY
	SUM(ORDER_QTY) DESC