view: storage_usage {
  sql_table_name:
  {% if database_name._in_query or database_id._in_query %}
 @{DATABASE_NAME}.ACCOUNT_USAGE.DATABASE_STORAGE_USAGE_HISTORY
  {% else %}
 @{DATABASE_NAME}.ACCOUNT_USAGE.STORAGE_USAGE
  {% endif %};;

  # Field Descriptions from Snowflake Documentation: https://docs.snowflake.net/manuals/sql-reference/account-usage/database_storage_usage_history.html
  # https://docs.snowflake.net/manuals/sql-reference/account-usage/storage_usage.html

  # DIMENSIONS #

  dimension: database_id {
    type: number
    sql: ${TABLE}.DATABASE_ID ;;
    description: "Internal/system-generated identifier for the database"
  }

  dimension_group: deleted {
    #if this is exposed - will need to include it table selection logic
    type: time
    hidden: yes
    sql: ${TABLE}.DELETED ;;
    description: "Date and time when the database was dropped; NULL for active databases"
  }

  dimension: database_name {
    type: string
    sql: ${TABLE}.DATABASE_NAME ;;
    description: "Name of the database"
  }

  dimension_group: usage {
    type: time
    datatype: date
    timeframes: [date,week,week_of_year,day_of_week,day_of_month,month_num,month,quarter,year]
    convert_tz: no
    sql: ${TABLE}.USAGE_DATE ;;
    alias: [read]
    description: "Name of the reader account where the data is stored. Column only included in view in READER_ACCOUNT_USAGE schema"
  }

  dimension: storage_bytes {
    type: number
    sql: {% if database_name._in_query or database_id._in_query %}
    ${TABLE}.AVERAGE_DATABASE_BYTES
    {% else %}
    ${TABLE}.STORAGE_BYTES
    {% endif %}
     ;;
    description: "Number of bytes of table storage used, including bytes for data currently in Time Travel"
  }
  dimension: failsafe_bytes {
    type: number
    sql: {% if database_name._in_query or database_id._in_query %}
    ${TABLE}.AVERAGE_FAILSAFE_BYTES
    {% else %}
    ${TABLE}.FAILSAFE_BYTES
     {% endif %};;
    description: "Number of bytes of data in Fail-safe"
  }

  dimension: stage_bytes {
    type:  number
    sql: ${TABLE}.stage_bytes ;;
    description: "Number of bytes of stage storage used by files in all internal stages (named, table, and user)"
  }

  dimension: storage_tb {
    type: number
    sql: ${storage_bytes} / power(1024,4) ;;
  }


  dimension: failsafe_tb {
    type: number
    sql: ${failsafe_bytes} / power(1024,4) ;;
  }

  dimension: total_tb {
    sql: ${storage_tb} + ${failsafe_tb};;
  }

  # MEASURES #

  measure: count {
    type: count
    drill_fields: []
  }

  measure: billable_tb {
    type: average
    sql: ${total_tb};;
  }

  measure: current_four_weeks_billable_tb {
    type: average
    sql:  ${total_tb};;
    filters: {field: usage_date value: "last 4 weeks"}
    value_format_name: decimal_4
  }

  measure: prior_four_weeks_billable_tb {
    type: average
    sql:  ${total_tb};;
    filters: {field: usage_date value: "8 weeks ago for 4 weeks"}
    value_format_name: decimal_4
  }
}
