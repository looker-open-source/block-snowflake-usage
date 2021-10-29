view: warehouse_metering_history{
  sql_table_name: @{DATABASE_NAME}.ACCOUNT_USAGE.WAREHOUSE_METERING_HISTORY ;;

  # Field Descriptions from Snowflake Documentation: https://docs.snowflake.net/manuals/sql-reference/account-usage/warehouse_metering_history.html

  # DIMENSIONS #

  dimension: pk {
    primary_key: yes
    sql: CONCAT(${warehouse_name},${start_raw}) ;;
  }

#   dimension: reader_account_name {
#     type: string
#     sql: ${TABLE}.READER_ACCOUNT_NAME ;;
#     description: "Name of the reader account where the warehouse usage took place. Column only included in view in READER_ACCOUNT_USAGE schema"
#   }

  dimension: credits_used {
    type: number
    sql: ${TABLE}.CREDITS_USED ;;
    alias: [credits]
    description: "Number of credits billed for the warehouse in the hour"
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_month,
      day_of_week,
      day_of_year,
      week,
      week_of_year,
      month,
      month_num,
      quarter,
      year
    ]
    sql: ${TABLE}.START_TIME ;;
    alias: [read_hour]
    description: "The date and beginning of the hour (in the UTC time zone) in which the warehouse usage took place"
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_month,
      day_of_week,
      day_of_year,
      week,
      week_of_year,
      month,
      month_num,
      quarter,
      year
    ]
    sql: ${TABLE}.END_TIME ;;
    description: "The date and end of the hour (in the UTC time zone) in which the warehouse usage took place"
  }

  dimension: warehouse_id {
    type: string
    sql: ${TABLE}.WAREHOUSE_ID ;;
    description: "Internal/system-generated identifier for the warehouse"
  }

  dimension: warehouse_name {
    type: string
    sql: ${TABLE}.WAREHOUSE_NAME ;;
    description: "Name of the warehouse"
  }

  dimension: is_prior_month_mtd {
    type: yesno
    sql:  EXTRACT(month, ${start_raw}) = EXTRACT(month, current_timestamp()) - 1
      and ${start_raw} <= dateadd(month, -1, current_timestamp())  ;;
  }

  # MEASURES #

  measure: count {
    type: count
    drill_fields: [warehouse_name]
  }

  measure: average_credits_used {
    type: average
    sql:  ${credits_used} ;;
  }

  measure: total_credits_used {
    type: sum
    sql: ${credits_used} ;;
  }

  measure: current_four_weeks_credits_used {
    type: sum
    sql:  ${credits_used} ;;
    filters: {field: start_date value: "last 4 weeks"}
    drill_fields: [warehouse_name,total_credits_used]
  }

  measure: prior_four_weeks_credits_used {
    type: sum
    sql:  ${credits_used} ;;
    filters: {field: start_date value: "8 weeks ago for 4 weeks"}
    drill_fields: [warehouse_name,total_credits_used]
  }

}
