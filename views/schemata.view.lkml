view: schemata {
  sql_table_name: @{DATABASE_NAME}.ACCOUNT_USAGE.SCHEMATA ;;

  # Field Descriptions from Snowflake Documentation: https://docs.snowflake.net/manuals/sql-reference/account-usage/schemata.html

  # DIMENSIONS #

  dimension: catalog_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.CATALOG_ID ;;
    description: "Internal/system-generated identifier for the database of the schema"
  }

  dimension: catalog_name {
    type: number
    sql: ${TABLE}.CATALOG_NAME ;;
    description: "Database that the schema belongs to"
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.COMMENT ;;
    description: "Comment for the schema"
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
    description: "Date and time when the schema was created"
  }

  dimension: schema_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.schema_ID ;;
    description: "Internal/system-generated identifier for the schema"
  }

  dimension: schema_name {
    type: string
    sql: ${TABLE}.schema_NAME ;;
    description: "Name of the schema"
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
    description: "Date and time when the schema was dropped"
  }

  dimension: is_transient {
    type: yesno
    sql: CASE WHEN ${TABLE}.IS_TRANSIENT = 'YES' THEN TRUE ELSE FALSE END ;;
    description: "Whether the schema is transient"
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
    description: "Date and time when the schema was last altered"
  }

  dimension: retention_time {
    type: number
    sql: ${TABLE}.RETENTION_TIME ;;
    description: "Number of days that historical data is retained for Time Travel"
  }

  dimension: schema_owner {
    type: string
    sql: ${TABLE}.SCHEMA_OWNER ;;
    description: "Name of the role that owns the schema"
  }

  dimension: sql_path {
    type: string
    sql: ${TABLE}.SQL_PATH ;;
    description: "Not applicable for Snowflake"
  }

  # No descriptions available for the below dimensions

  dimension: default_character_set_catalog {
    type: string
    sql: ${TABLE}.DEFAULT_CHARACTER_SET_CATALOG ;;
  }

  dimension: default_character_set_name {
    type: string
    sql: ${TABLE}.DEFAULT_CHARACTER_SET_NAME ;;
  }

  dimension: default_character_set_schema {
    type: string
    sql: ${TABLE}.DEFAULT_CHARACTER_SET_SCHEMA ;;
  }

  # No descriptions availalble for the above dimensions

  # MEASURES #

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # SETS #

  set: detail {
    fields: [
      #id,
      schema_name,
      #database_name,
      default_character_set_name,
      #databases.id,
      databases.database_name
    ]
  }
}
