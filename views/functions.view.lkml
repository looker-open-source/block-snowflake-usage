view: functions {
  sql_table_name: @{DATABASE_NAME}.ACCOUNT_USAGE.FUNCTIONS ;;

  # Field Descriptions from Snowflake Documentation: https://docs.snowflake.net/manuals/sql-reference/account-usage/functions.html

  # DIMENSIONS #

  dimension: argument_signature {
    type: string
    sql: ${TABLE}.ARGUMENT_SIGNATURE ;;
    description: "Type signature of the UDF’s arguments"
  }

  dimension: character_maximum_length {
    type: number
    sql: ${TABLE}.CHARACTER_MAXIMUM_LENGTH ;;
    description: "Maximum length in characters of string return value"
  }

  dimension: character_octet_length {
    type: number
    sql: ${TABLE}.CHARACTER_OCTET_LENGTH ;;
    description: "Maximum length in bytes of string return value"
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.COMMENT ;;
    description: "Comment for the function"
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
    description: "Date and time when the UDF was created"
  }

  dimension: data_type {
    type: string
    sql: ${TABLE}.DATA_TYPE ;;
    description: "Return value data type"
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
    description: "Date and time when the UDF was dropped"
  }

  dimension: function_catalog {
    type: string
    sql: ${TABLE}.FUNCTION_CATALOG ;;
    description: "Database which the UDF belongs to"
  }

  dimension: function_catalog_id {
    type: string
    sql: ${TABLE}.FUNCTION_CATALOG_ID ;;
    description: "Internal/system-generated identifier for the database of the UDF"
  }

  dimension: function_definition {
    type: string
    sql: ${TABLE}.FUNCTION_DEFINITION ;;
    description: "UDF definition"
  }

  dimension: function_id {
    type: string
    sql: ${TABLE}.FUNCTION_ID ;;
    description: "Internal/system-generated identifier for the UDF"
  }

  dimension: function_language {
    type: string
    sql: ${TABLE}.FUNCTION_LANGUAGE ;;
    description: "Language of the UDF"
  }

  dimension: function_name {
    type: string
    sql: ${TABLE}.FUNCTION_NAME ;;
    description: "Name of the UDF"
  }

  dimension: function_owner {
    type: string
    sql: ${TABLE}.FUNCTION_OWNER ;;
    description: "Name of the role that owns the UDF"
  }

  dimension: function_schema {
    type: string
    sql: ${TABLE}.FUNCTION_SCHEMA ;;
    description: "Schema which the UDF belongs to"
  }

  dimension: function_schema_id {
    type: string
    sql: ${TABLE}.FUNCTION_SCHEMA_ID ;;
    description: "Internal/system-generated identifier for the schema of the UDF"
  }

  dimension: is_null_call {
    type: yesno
    sql: CASE WHEN ${TABLE}.IS_NULL_CALL = 'YES' THEN TRUE ELSE FALSE END ;;
    description: "Whether the UDF is called when input is null"
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
    description: "Date and time when the UDF was last altered"
  }

  dimension: numeric_precision {
    type: number
    sql: ${TABLE}.NUMERIC_PRECISION ;;
    description: "Numeric precision of numeric return value"
  }

  dimension: numeric_precision_radix {
    type: number
    sql: ${TABLE}.NUMERIC_PRECISION_RADIX ;;
    description: "Radix of precision of numeric return value"
  }

  dimension: numeric_scale {
    type: number
    sql: ${TABLE}.NUMERIC_SCALE ;;
    description: "Scale of numeric return value"
  }

  dimension: volatility {
    type: string
    sql: ${TABLE}.VOLATILITY ;;
    description: "Whether the UDF is volatile or immutable"
  }

  # MEASURES #

  measure: count {
    type: count
    drill_fields: [function_name]
  }
}
