
view: databases {
  sql_table_name: @{DATABASE_NAME}.ACCOUNT_USAGE.DATABASES ;;

  # Field Descriptions from Snowflake Documentation: https://docs.snowflake.net/manuals/sql-reference/account-usage/databases.html

  # DIMENSIONS #

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.DATABASE_ID ;;
    description: "Internal/system-generated identifier for the database"
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.COMMENT ;;
    description: "Comment for the database"
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CREATED ;;
    description: "Date and time when the database was created"
  }

  dimension: database_name {
    type: string
    sql: ${TABLE}.DATABASE_NAME ;;
    description: "Name of database"
  }

  dimension: database_owner {
    type: string
    sql: ${TABLE}.DATABASE_OWNER ;;
    description: "Name of the role that owns the database"
  }

  dimension_group: deleted {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DELETED ;;
    description: "Date and time when the database was dropped"
  }

  dimension: is_transient {
    type: yesno
    sql: ${TABLE}.IS_TRANSIENT ;;
    description: "Whether the database is transient"
  }

  dimension_group: last_altered {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.LAST_ALTERED ;;
    description: "Date and time when the database was last altered"
  }

  dimension: retention_in_days {
    type: number
    sql: ${TABLE}.retention_time ;;
    description: "Number of days that historical data is retained for Time Travel"
  }

  # MEASURES #

  measure: count {
    type: count
    drill_fields: [id, database_name, query_history.count, schemata.count]
  }
}
