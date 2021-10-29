view: stages {
  sql_table_name: @{DATABASE_NAME}.ACCOUNT_USAGE.STAGES ;;

  # Field Descriptions from Snowflake Documentation: https://docs.snowflake.net/manuals/sql-reference/account-usage/stages.html

  # DIMENSIONS #

  dimension: comment {
    type: string
    description: "Comment for the stage"
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
    description: "Date and time when the stage was created"
    sql: ${TABLE}.CREATED ;;
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
    description: "Date and time when the stage was dropped"
    sql: ${TABLE}.DELETED ;;
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
    description: "Date and time when the stage was last altered"
    sql: ${TABLE}.LAST_ALTERED ;;
  }

  dimension: stage_catalog {
    type: string
    description: "Database that the stage belongs to"
    sql: ${TABLE}.STAGE_CATALOG ;;
  }

  dimension: stage_catalog_id {
    type: number
    description: "Internal/system-generated identifier for the database of the stage"
    sql: ${TABLE}.STAGE_CATALOG_ID ;;
  }

  dimension: stage_id {
    type: number
    description: "Internal/system-generated identifier for the stage"
    sql: ${TABLE}.STAGE_ID ;;
  }

  dimension: stage_name {
    type: string
    description: "Name of the stage"
    sql: ${TABLE}.STAGE_NAME ;;
  }

  dimension: stage_owner {
    type: string
    description: "Name of the role that owns the stage; NULL if it has been dropped"
    sql: ${TABLE}.STAGE_OWNER ;;
  }

  dimension: stage_region {
    type: string
    description: "If the stage is external, region where the stage resides; NULL if it is internal"
    sql: ${TABLE}.STAGE_REGION ;;
  }

  dimension: stage_schema {
    type: string
    description: "Schema that the stage belongs to"
    sql: ${TABLE}.STAGE_SCHEMA ;;
  }

  dimension: stage_schema_id {
    type: number
    description: "Internal/system-generated identifier for the schema of the stage"
    sql: ${TABLE}.STAGE_SCHEMA_ID ;;
  }

  dimension: stage_type {
    type: string
    description: "Type of stage (User, Table, Internal Named, or External Named)"
    sql: ${TABLE}.STAGE_TYPE ;;
  }

  dimension: stage_url {
    type: string
    description: "If the stage is external, location of the stage; NULL if it is internal"
    sql: ${TABLE}.STAGE_URL ;;
  }

  # MEASURES #

  measure: count {
    type: count
    drill_fields: [stage_name]
  }
}
