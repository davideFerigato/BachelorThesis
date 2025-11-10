/* Stato dei rowgroup columnstore (qualita'/compressione) */
SELECT object_name = OBJECT_NAME(object_id), *
FROM sys.dm_db_column_store_row_group_physical_stats
WHERE object_id = OBJECT_ID('dbo.FactSales');

/* Spazio sintetico per oggetto (approssimazione via dm_db_partition_stats) */
SELECT
  SUM(row_count)                               AS rows_total,
  SUM(reserved_page_count)*8.0/1024.0          AS reserved_mb,
  SUM(used_page_count)*8.0/1024.0              AS used_mb
FROM sys.dm_db_partition_stats
WHERE object_id = OBJECT_ID('dbo.SalesAgg');   -- vista indicizzata materializzata
GO