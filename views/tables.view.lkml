view: tables {
  sql_table_name: @{DATABASE_NAME}.ACCOUNT_USAGE.TABLES ;;

  # Field Descriptions from Snowflake Documentation: https://docs.snowflake.net/manuals/sql-reference/account-usage/tables.html

  # DIMENSIONS #

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.table_id ;;
    description: "Internal, Snowflake-generated identifier for the table"
  }

  dimension: bytes {
    type: string
    sql: ${TABLE}.BYTES ;;
    description: "Number of bytes accessed by a scan of the table"
  }

  dimension: clustering_key {
    type: string
    sql: ${TABLE}.CLUSTERING_KEY ;;
    description: "Column(s) and/or expression(s) that comprise the clustering key for the table"
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.COMMENT ;;
    description: "Comment for the table"
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
    description: "Date and time when the table was created"
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
    description: "Date and time when the table was dropped"
  }

  dimension: is_transient {
    type: yesno
    sql: CASE WHEN ${TABLE}.IS_TRANSIENT = 'YES' THEN TRUE ELSE FALSE END ;;
    description: "Whether the table is transient"
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
    description: "Date and time when the table was last altered"
  }

  dimension: retention_time {
    type:  string
    sql: ${TABLE}.RETENTION_TIME ;;
    description: "Number of days that historical data is retained for Time Travel"
  }

  dimension: row_count {
    type: string
    sql: ${TABLE}.ROW_COUNT ;;
    description: "Number of rows in the table"
  }

  dimension: table_catalog {
    type: string
    sql: ${TABLE}.TABLE_CATALOG ;;
    description: "Database that the table belongs to"
  }

  dimension: table_catalog_id {
    type: number
    sql: ${TABLE}.TABLE_CATALOG_ID ;;
    description: "Internal, Snowflake-generated identifier of the database for the table"
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.TABLE_NAME ;;
    description: "Name of the table"
  }

  dimension: table_owner {
    type: string
    sql: ${TABLE}.TABLE_OWNER ;;
    description: "Name of the role that owns the table"
  }

  dimension: table_schema {
    type: string
    sql: ${TABLE}.TABLE_SCHEMA ;;
    description: "Schema that the table belongs to"
  }

  dimension: table_schema_id {
    type: string
    sql: ${TABLE}.TABLE_SCHEMA_ID ;;
    description: "Internal, Snowflake-generated identifier of the schema for the table"
  }

  dimension: table_type {
    type: string
    sql: ${TABLE}.TABLE_TYPE ;;
    description: "Whether the table is a base table, temporary table, or view"
  }

  # No Descriptions available for the folllowing dimensions

  dimension: commit_action {
    type: string
    sql: ${TABLE}.COMMIT_ACTION ;;
  }

  dimension: is_insertable_into {
    type: yesno
    sql: CASE WHEN ${TABLE}.IS_INSERTABLE_INTO = 'YES' THEN TRUE ELSE FALSE END ;;
  }

  dimension: is_typed {
    type: yesno
    sql: CASE WHEN ${TABLE}.IS_TYPED = 'YES' THEN TRUE ELSE FALSE END ;;
  }

  dimension: reference_generation {
    type: string
    sql: ${TABLE}.REFERENCE_GENERATION ;;
  }

  dimension: self_referencing_column_name {
    type: string
    sql: ${TABLE}.SELF_REFERENCING_COLUMN_NAME ;;
  }

  dimension: user_defined_type_name {
    type: string
    sql: ${TABLE}.USER_DEFINED_TYPE_NAME ;;
  }

  dimension: user_defined_type_catalog {
    type: string
    sql: ${TABLE}.USER_DEFINED_TYPE_CATALOG ;;
  }

  dimension: user_defined_type_schema {
    type: string
    sql: ${TABLE}.USER_DEFINED_TYPE_SCHEMA ;;
  }

  # No Descriptions available for the above dimensions

  # MEASURES #

  measure: count {
    type: count
    drill_fields: [#id,
                   table_name,
                   self_referencing_column_name,
                   user_defined_type_name]
  }
}
