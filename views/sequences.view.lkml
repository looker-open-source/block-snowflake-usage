view: sequences {
  sql_table_name: @{DATABASE_NAME}.ACCOUNT_USAGE.SEQUENCES ;;

  # Field Descriptions from Snowflake Documentation: https://docs.snowflake.net/manuals/sql-reference/account-usage/sequences.html

  # DIMENSIONS #

  dimension: comment {
    type: string
    description: "Comment for the sequence"
    sql: ${TABLE}.COMMENT ;;
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
    description: "Date and time when the sequence was created"
    sql: ${TABLE}.CREATED ;;
  }

  dimension: cycle_option {
    type: string
    description: "Not applicable for Snowflake"
    sql: ${TABLE}.CYCLE_OPTION ;;
  }

  dimension: data_type {
    type: string
    description: "Data type of the sequence"
    sql: ${TABLE}.DATA_TYPE ;;
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
    description: "Date and time when the sequence was dropped"
    sql: ${TABLE}.DELETED ;;
  }

  dimension: increment {
    type: string
    description: "Increment of the sequence generator"
    sql: ${TABLE}.INCREMENT ;;
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
    description: "Date and time when the sequence was last altered"
    sql: ${TABLE}.LAST_ALTERED ;;
  }

  dimension: maximum_value {
    type: string
    description: "Not applicable for Snowflake"
    sql: ${TABLE}.MAXIMUM_VALUE ;;
  }

  dimension: minimum_value {
    type: string
    description: "Not applicable for Snowflake"
    sql: ${TABLE}.MINIMUM_VALUE ;;
  }

  dimension: next_value {
    type: string
    description: "Next value that the sequence will produce"
    sql: ${TABLE}.NEXT_VALUE ;;
  }

  dimension: numeric_precision {
    type: number
    description: "Numeric precision of the data type of the sequence"
    sql: ${TABLE}.NUMERIC_PRECISION ;;
  }

  dimension: numeric_precision_radix {
    type: number
    description: "Radix of the numeric precision of the data type of the sequence"
    sql: ${TABLE}.NUMERIC_PRECISION_RADIX ;;
  }

  dimension: numeric_scale {
    type: number
    description: "Scale of the data type of the sequence"
    sql: ${TABLE}.NUMERIC_SCALE ;;
  }

  dimension: sequence_catalog {
    type: string
    description: "Database that the sequence belongs to"
    sql: ${TABLE}.SEQUENCE_CATALOG ;;
  }

  dimension: sequence_catalog_id {
    type: number
    description: "Internal/system-generated identifier for the database of the sequence"
    sql: ${TABLE}.SEQUENCE_CATALOG_ID ;;
  }

  dimension: sequence_id {
    type: number
    description: "Internal/system-generated identifier for the sequence"
    sql: ${TABLE}.SEQUENCE_ID ;;
  }

  dimension: sequence_name {
    type: string
    description: "Name of the sequence"
    sql: ${TABLE}.SEQUENCE_NAME ;;
  }

  dimension: sequence_owner {
    type: string
    description: "Name of the role that owns the sequence"
    sql: ${TABLE}.SEQUENCE_OWNER ;;
  }

  dimension: sequence_schema {
    type: string
    description: "Schema that the sequence belongs to"
    sql: ${TABLE}.SEQUENCE_SCHEMA ;;
  }

  dimension: sequence_schema_id {
    type: number
    description: "Internal/system-generated identifier for the schema of the sequence"
    sql: ${TABLE}.SEQUENCE_SCHEMA_ID ;;
  }

  dimension: start_value {
    type: string
    description: "Initial value of the sequence"
    sql: ${TABLE}.START_VALUE ;;
  }

  # MEASURES #

  measure: count {
    type: count
    drill_fields: [sequence_name]
  }
}
