view: referential_constraints {
  sql_table_name: @{DATABASE_NAME}.ACCOUNT_USAGE.REFERENTIAL_CONSTRAINTS ;;

  # Field Descriptions from Snowflake Documentation: https://docs.snowflake.net/manuals/sql-reference/account-usage/referential_constraints.html

  # DIMENSIONS #

  dimension: comment {
    type: string
    sql: ${TABLE}.COMMENT ;;
    description: "Comment for the constraint"
  }

  dimension: constraint_catalog {
    type: string
    sql: ${TABLE}.CONSTRAINT_CATALOG ;;
    description: "Database that the constraint belongs to"
  }

  dimension: constraint_catalog_id {
    type: string
    sql: ${TABLE}.CONSTRAINT_CATALOG_ID ;;
    description: "Internal/system-generated identifier for the database of the constraint"
  }

  dimension: constraint_name {
    type: string
    sql: ${TABLE}.CONSTRAINT_NAME ;;
    description: "Name of the constraint"
  }

  dimension: constraint_schema {
    type: string
    sql: ${TABLE}.CONSTRAINT_SCHEMA ;;
    description: "Schema that the constraint belongs to"
  }

  dimension: constraint_schema_id {
    type: string
    sql: ${TABLE}.CONSTRAINT_SCHEMA_ID ;;
    description: "Internal/system-generated identifier for the schema of the constraint"
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
    description: "Date and time when the constraint was created"
  }

  dimension: delete_rule {
    type: string
    sql: ${TABLE}.DELETE_RULE ;;
    description: "Delete Rule for the current constraint"
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
    description: "Date and time when the constraint was dropped"
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
    sql: ${TABLE}.LAST_ALTERED_AT ;;
    description: "Date and time when the constraint was last altered"
  }

  dimension: match_option {
    type: string
    sql: ${TABLE}.MATCH_OPTION ;;
    description: "Match option for the constraint"
  }

  dimension: unique_constraint_catalog {
    type: string
    sql: ${TABLE}.UNIQUE_CONSTRAINT_CATALOG ;;
    description: "Database of the unique constraint referenced by the current constraint"
  }

  dimension: unique_constraint_catalog_id {
    type: string
    sql: ${TABLE}.UNIQUE_CONSTRAINT_CATALOG_ID ;;
    description: "Internal/system-generated identifier for the database of the current constraint"
  }

  dimension: unique_constraint_name {
    type: string
    sql: ${TABLE}.UNIQUE_CONSTRAINT_NAME ;;
    description: "Name of the unique constraint referenced by the current constraint"
  }

  dimension: unique_constraint_schema {
    type: string
    sql: ${TABLE}.UNIQUE_CONSTRAINT_SCHEMA ;;
    description: "Schema of the unique constraint referenced by the current constraint"
  }

  dimension: unique_constraint_schema_id {
    type: string
    sql: ${TABLE}.UNIQUE_CONSTRAINT_SCHEMA_ID ;;
    description: "Internal/system-generated identifier for the schema of the constraint"
  }

  dimension: update_rule {
    type: string
    sql: ${TABLE}.UPDATE_RULE ;;
    description: "Update Rule for the current constraint"
  }

  # MEASURES #

  measure: count {
    type: count
    drill_fields: [constraint_name, unique_constraint_name]
  }
}
