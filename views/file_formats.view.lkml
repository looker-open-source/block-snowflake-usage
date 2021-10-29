view: file_formats {
  sql_table_name: @{DATABASE_NAME}.ACCOUNT_USAGE.FILE_FORMATS ;;

  # Field Descriptions from Snowflake Documentation: https://docs.snowflake.net/manuals/sql-reference/account-usage/file_formats.html

  # DIMENSIONS #

  dimension: file_format_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.FILE_FORMAT_ID ;;
    description: "Internal/system-generated identifier for the file format"
  }

  dimension: binary_format {
    type: string
    sql: ${TABLE}.BINARY_FORMAT ;;
    description: "Binary format"
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.COMMENT ;;
    description: "Comment for the file format"
  }

  dimension: compression {
    type: string
    sql: ${TABLE}.COMPRESSION ;;
    description: "Compression method for the data file"
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
    description: "Date and time when the file format was created"
  }

  dimension: date_format {
    type: string
    sql: ${TABLE}.DATE_FORMAT ;;
    description: "Date format"
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
    description: "Date and time when the file format was dropped"
  }

  dimension: error_on_column_count_mismatch {
    type: string
    sql: ${TABLE}.ERROR_ON_COLUMN_COUNT_MISMATCH ;;
    description: "Whether to generate a parsing error if the number of fields in an input file does not match the number of columns in the corresponding table"
  }

  dimension: escape {
    type: string
    sql: ${TABLE}.ESCAPE ;;
    description: "String used as the escape character for any field values"
  }

  dimension: escape_unenclosed_field {
    type: string
    sql: ${TABLE}.ESCAPE_UNENCLOSED_FIELD ;;
    description: "String used as the escape character for unenclosed field values"
  }

  dimension: field_delimiter {
    type: string
    sql: ${TABLE}.FIELD_DELIMITER ;;
    description: "Character that separates fields"
  }

  dimension: field_optionally_enclosed_by {
    type: string
    sql: ${TABLE}.FIELD_OPTIONALLY_ENCLOSED_BY ;;
    description: "Character used to enclose strings"
  }

  dimension: file_format_catalog {
    type: string
    sql: ${TABLE}.FILE_FORMAT_CATALOG ;;
    description: "Database that the file format belongs to"
  }

  dimension: file_format_catalog_id {
    type: number
    sql: ${TABLE}.FILE_FORMAT_CATALOG_ID ;;
    description: "Internal/system-generated identifier for the file format"
  }

  dimension: file_format_name {
    type: string
    sql: ${TABLE}.FILE_FORMAT_NAME ;;
    description: "Name of the file format"
  }

  dimension: file_format_owner {
    type: string
    sql: ${TABLE}.FILE_FORMAT_OWNER ;;
    description: "Name of the role that owns the file format"
  }

  dimension: file_format_schema {
    type: string
    sql: ${TABLE}.FILE_FORMAT_SCHEMA ;;
    description: "Schema that the file format belongs to"
  }

  dimension: file_format_schema_id {
    type: number
    sql: ${TABLE}.FILE_FORMAT_SCHEMA_ID ;;
    description: "Internal/system-generated identifier for the schema of the file format"
  }

  dimension: file_format_type {
    type: string
    sql: ${TABLE}.FILE_FORMAT_TYPE ;;
    description: "File format type of the file format (CSV,``JSON``, etc.)"
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
    description: "Date and time when the file format was last altered"
  }

  dimension: null_if {
    type: string
    sql: ${TABLE}.NULL_IF ;;
    description: "A list of strings to be replaced by null"
  }

  dimension: record_delimiter {
    type: string
    sql: ${TABLE}.RECORD_DELIMITER ;;
    description: "Character that separates records"
  }

  dimension: skip_header {
    type: number
    sql: ${TABLE}.SKIP_HEADER ;;
    description: "Number of lines skipped at the start of the file"
  }

  dimension: time_format {
    type: string
    sql: ${TABLE}.TIME_FORMAT ;;
    description: "Time format"
  }

  dimension: timestamp_format {
    type: string
    sql: ${TABLE}.TIMESTAMP_FORMAT ;;
    description: "Timestamp format"
  }

  dimension: trim_space {
    type: string
    sql: ${TABLE}.TRIM_SPACE ;;
    description: "Whether whitespace is removed from fields"
  }

  # MEASURES #

  measure: count {
    type: count
    drill_fields: [file_format_id, file_format_name]
  }
}
