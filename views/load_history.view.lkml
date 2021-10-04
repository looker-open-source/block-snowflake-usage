view: load_history {
 sql_table_name: @{DATABASE_NAME}.ACCOUNT_USAGE.LOAD_HISTORY;;

  # Field Descriptions from Snowflake Documentation: https://docs.snowflake.net/manuals/sql-reference/account-usage/load_history.html

  # DIMENSIONS #

  dimension: table_id {
    type: number
    sql: ${TABLE}.TABLE_ID ;;
    description: "Internal/system-generated identifier for the target table"
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.TABLE_NAME ;;
    description: "Name of target table"
  }

  dimension: schema_id {
    type: number
    sql: ${TABLE}.SCHEMA_ID ;;
    description: "Internal/system-generated identifier for the schema of the target table"
  }

  dimension: schema_name {
    type: string
    sql: ${TABLE}.SCHEMA_NAME ;;
    description: "Schema of target table"
  }

  dimension: catalog_id {
    type: number
    sql: ${TABLE}.CATALOG_ID ;;
    description: "Internal/system-generated identifier for the database of the target table"
  }

  dimension: catalog_name {
    type: string
    sql: ${TABLE}.CATALOG_NAME ;;
    description: "Database of target table"
  }

  dimension: file_name {
    type: string
    sql: ${TABLE}.FILE_NAME ;;
    description: "Name of source file"
  }

  dimension_group: last_load_time {
    type: time
    datatype: timestamp
    timeframes: [raw,time,date,day_of_week,day_of_month,week,month,year]
    sql: ${TABLE}.LAST_LOAD_TIME ;;
    description: "Date and time (in the UTC time zone) of the load record"
  }

  dimension: status {
    type: string
    sql: ${TABLE}.STATUS ;;
    description: "Status: loaded, load failed, or partially loaded"
  }

  dimension: row_count {
    type: number
    sql: ${TABLE}.ROW_COUNT ;;
    description: "Number of rows loaded from the source file"
  }

  dimension: row_parsed {
    type: number
    sql: ${TABLE}.ROW_PARSED ;;
    description: "Number of rows parsed from the source file"
  }

  dimension: first_error_message {
    type: string
    sql: ${TABLE}.FIRST_ERROR_MESSAGE ;;
    description: "First error of the source file"
  }

  dimension: first_error_line_number {
    type: number
    sql: ${TABLE}.FIRST_ERROR_LINE_NUMBER ;;
    description: "Line number of the first error"

  }

  dimension: first_error_character_position {
    type: number
    sql: ${TABLE}.FIRST_ERROR_CHARACTER_POSITION ;;
    description: "Position of the first error character"
  }

  dimension: first_error_col_name {
    type: string
    sql: ${TABLE}.FIRST_ERROR_COL_NAME ;;
    description: "Column name of the first error"
  }

  dimension: error_count {
    type: number
    sql: ${TABLE}.ERROR_COUNT ;;
    description: "Number of error rows in the source file"
  }

  dimension: error_limit {
    type: number
    sql: ${TABLE}.ERROR_LIMIT ;;
    description: "If the number of error reach this limit, then abort"
  }

  # MEASURES #

  measure: total_row_count {
    type: sum
    sql: ${row_count} ;;
  }

  measure: total_error_count {
    type: sum
    sql: ${error_count} ;;
    drill_fields: [file_name,table_name,first_error_character_position,first_error_col_name,first_error_line_number,first_error_message]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # SETS #

  set: detail {
    fields: [
      table_name,
      schema_name,
      catalog_name,
      file_name,
      last_load_time_time,
      status,
      row_count
    ]
  }
}
