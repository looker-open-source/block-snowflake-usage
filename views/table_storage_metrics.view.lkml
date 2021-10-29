view: table_storage_metrics {
  sql_table_name: @{DATABASE_NAME}.ACCOUNT_USAGE.TABLE_STORAGE_METRICS ;;

  # Field Descriptions from Snowflake Documentation: https://docs.snowflake.net/manuals/sql-reference/account-usage/table_storage_metrics.html

  # DIMENSIONS #

#   dimension: id {
#     primary_key: yes
#     type: number
#     sql: ${TABLE}.ID ;;
#     description: "Internal/system-generated identifier for the table"
#   }

  dimension: active_bytes {
    type: string
    sql: ${TABLE}.ACTIVE_BYTES ;;
    description: "Bytes owned by (and billed to) this table that are in the active state for the table"
  }

  dimension_group: catalog_created {
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
    sql: ${TABLE}.CATALOG_CREATED ;;
    description: "Date and time when the database for the table was created"
  }

  dimension_group: catalog_dropped {
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
    sql: ${TABLE}.CATALOG_DROPPED ;;
    description: "Date and time when the database for the table was dropped"
  }

  dimension: clone_group_id {
    type: number
    sql: ${TABLE}.CLONE_GROUP_ID ;;
    description: "Unique identifier for the oldest clone ancestor of this table. Same as ID if the table is not a clone"
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.COMMENT ;;
    description: "Comment for the table"
  }

  dimension: failsafe_bytes {
    type: string
    sql: ${TABLE}.FAILSAFE_BYTES ;;
    description: "Bytes owned by (and billed to) this table that are in the Fail-safe state for the table"
  }

  dimension: is_transient {
    type: yesno
    sql: CASE WHEN ${TABLE}.IS_TRANSIENT = 'YES' THEN TRUE ELSE FALSE END ;;
    description: "‘YES’ if table is transient or temporary, otherwise ‘NO’. Transient and temporary tables have no Fail-safe period"
  }

  dimension: retained_for_cloned_bytes {
    type: number
    sql: ${TABLE}.RETAINED_FOR_CLONE_BYTES ;;
    description: "Bytes owned by (and billed to) this table that are retained after deletion because they are referenced by one or more clones of this table"
  }

  dimension_group: schema_created {
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
    sql: ${TABLE}.SCHEMA_CREATED ;;
    description: "Date and time when the schema for the table was created"
  }

  dimension_group: schema_dropped {
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
    sql: ${TABLE}.SCHEMA_DROPPED ;;
    description: "Date and time when the schema for the table was dropped"
  }

  dimension: table_catalog {
    type: string
    sql: ${TABLE}.TABLE_CATALOG ;;
    description: "Database that the table belongs to"
  }

  dimension: table_catalog_id {
    type: string
    sql: ${TABLE}.TABLE_CATALOG_ID ;;
    description: "Internal/system-generated identifier for the database of the table"
  }

  dimension_group: table_created {
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
    sql: ${TABLE}.TABLE_CREATED ;;
    description: "Date and time when the table was created"
  }

  dimension_group: table_dropped {
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
    sql: ${TABLE}.TABLE_DROPPED ;;
    description: "Date and time when the table was dropped. NULL if table has not been dropped"
  }

  dimension_group: table_entered_failsafe {
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
    sql: ${TABLE}.TABLE_ENTERED_FAILSAFE ;;
    description: "Date and time when the the table, if dropped, entered the Fail-safe state, or NULL. In this state, the table cannot be restored using UNDROP"
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.TABLE_NAME ;;
    description: "Name of the table"
  }

  dimension: table_schema {
    type: string
    sql: ${TABLE}.TABLE_SCHEMA ;;
    description: "Schema that the table belongs to"
  }

  dimension: table_schema_id {
    type: string
    sql: ${TABLE}.TABLE_SCHEMA_ID ;;
    description: "Schema that the table belongs to"
  }

  dimension: time_travel_bytes {
    type: number
    sql: ${TABLE}.TIME_TRAVEL_BYTES ;;
    description: "Bytes owned by (and billed to) this table that are in the Time Travel state for the table"
  }

  # MEASURES #

  measure: count {
    type: count
    drill_fields: [table_name]
  }
}
