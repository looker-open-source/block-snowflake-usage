view: table_constraints {
  sql_table_name: @{DATABASE_NAME}.ACCOUNT_USAGE.TABLE_CONSTRAINTS ;;

  # Field Descriptions from Snowflake Documentation: https://docs.snowflake.net/manuals/sql-reference/account-usage/table_constraints.html

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

  dimension: constraint_id {
    type: string
    sql: ${TABLE}.CONSTRAINT_ID ;;
    description: "Internal/system-generated identifier for the constraint"
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

  dimension: constraint_type {
    type: string
    sql: ${TABLE}.CONSTRAINT_TYPE ;;
    description: "Type of the constraint (PRIMARY KEY, UNIQUE KEY, or FOREIGN KEY)"
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

  dimension: enforced {
    type: yesno
    sql: ${TABLE}.ENFORCED ;;
    description: "Whether the constraint is enforced; by default, always NO"
  }

  dimension: initially_deferred {
    type: yesno
    sql: CASE WHEN ${TABLE}.INITIALLY_DEFERRED = 'YES' THEN TRUE ELSE FALSE END ;;
    description: "Whether evaluation of the constraint is deferrable and initially deferred; by default, always Y"
  }

  dimension: is_deferrable {
    type: yesno
    sql: CASE WHEN ${TABLE}.IS_DEFERRABLE = 'YES' THEN TRUE ELSE FALSE END ;;
    description: "Whether evaluation of the constraint can be deferred; by default, always N"
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
    description: "Date and time when the constraint was last altered"
  }

  dimension: table_catalog {
    type: string
    sql: ${TABLE}.TABLE_CATALOG ;;
    description: "Name of the database for the current table"
  }

  dimension: table_catalog_id {
    type: string
    sql: ${TABLE}.TABLE_CATALOG_ID ;;
    description: "Internal/system-generated identifier for the database of the current table"
  }

  dimension: table_id {
    type: string
    sql: ${TABLE}.TABLE_ID ;;
    description: "Internal/system-generated identifier for the table that the constraint belongs to"
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.TABLE_NAME ;;
    description: "Name of the current table"
  }

  dimension: table_schema_id {
    type: string
    sql: ${TABLE}.TABLE_SCHEMA_ID ;;
    description: "Internal/system-generated identifier for the schema of the current table"
  }

  dimension: table_schema {
    type: string
    sql: ${TABLE}.TABLE_SCHEMA ;;
    description: "Name of the schema for the current table"
  }

  # MEASURES #

  measure: count {
    type: count
    drill_fields: [constraint_name, table_name]
  }
}
