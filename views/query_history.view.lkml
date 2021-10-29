view: query_history {
  sql_table_name: @{DATABASE_NAME}.ACCOUNT_USAGE.QUERY_HISTORY ;;

  # Field Descriptions from Snowflake Documentation: https://docs.snowflake.net/manuals/sql-reference/account-usage/query_history.html

  # FILTERS #

  filter: query_text_filter {
    type: string
  }

  # DIMENSIONS #

  dimension: query_text_selector {
    type: string
    case: {
      when: {
        sql: {% condition query_text_filter %} ${query_text} {% endcondition %} ;;
        label: "Queries with Specified Pattern"
      }
      else: "All Other Queries"
    }
  }

  dimension: compilation_time {
    description: "Compilation time of the query (in seconds)"
    type: string
    sql: ${TABLE}.COMPILATION_TIME/1000 ;;
  }

  dimension: looker_query_context {
    type: string
    hidden: yes
    sql: PARSE_JSON(regexp_substr(regexp_substr(query_text, 'Query\\sContext\\s\'\{.*\}\''),'\{.*\}')) ;;
  }

  dimension: looker_history_id {
    type: number
    sql: ${looker_query_context}:history_id ;;
    link: {
      label: "See History ID in i__looker"
      url: "/explore/i__looker/history?fields=query.model,query.view,history.query_run_count,user.count,history.runtime_tiers&pivots=history.runtime_tiers&f[query.model]=-EMPTY&f[history.runtime]=NOT NULL&f[user.name]=&f[history.created_date]=10 weeks&f[history.id]={{ value }}&sorts=query.model,query.view,history.runtime_tiers&limit=10&column_limit=50"
    }
  }

  dimension: looker_user_id {
    type: number
    sql: ${looker_query_context}:user_id ;;
    link: {
      label: "See User in Looker Admin Panel"
      url: "/admin/users?id={{ value }}"
    }
  }

#   dimension: database_id {
#     type: number
#     # hidden: yes
#     sql: ${TABLE}.DATABASE_ID ;;
#     description: "Internal/system-generated identifier for the database that was in use"
#   }

  dimension: database_name {
    type: string
    sql: ${TABLE}.DATABASE_NAME ;;
    description: "Database that was in use at the time of the query"
  }

  dimension: rows_produced {
    type: number
    sql: ${TABLE}.ROWS_PRODUCED ;;
    description: "Number of rows produced by this statement"
  }

  dimension: schema_id {
    type: number
    sql: ${TABLE}.SCHEMA_ID ;;
    description: "Internal/system-generated identifier for the schema that was in use"
  }

  dimension: schema_name {
    type: string
    sql: ${TABLE}.SCHEMA_NAME ;;
    description: "Schema that was in use at the time of the query"
  }

  dimension: bytes_scanned {
    type: number
    sql: ${TABLE}.BYTES_SCANNED ;;
    description: "Number of bytes scanned by this statement"
  }

  dimension: cluster_number {
    type: number
    sql: ${TABLE}.CLUSTER_NUMBER ;;
    description: "The cluster (in a multi-cluster warehouse) that this statement executed on"
  }

  dimension_group: end {
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
    sql: ${TABLE}.END_TIME ;;
    description: "Statement end time (in the UTC time zone), or NULL if the statement is still running"
  }

  dimension: error_code {
    type: string
    sql: ${TABLE}.ERROR_CODE ;;
    description: "Error code, if the query returned an error"
  }

  dimension: error_message {
    type: string
    sql: ${TABLE}.ERROR_MESSAGE ;;
    description: "Error message, if the query returned an error"
  }

  dimension: execution_status {
    type: string
    sql: ${TABLE}.EXECUTION_STATUS ;;
    description: "Execution status for the query: resuming_warehouse, running, queued, blocked, success, failed_with_error, or failed_with_incident"
  }

  dimension: execution_time {
    description: "Execution time of the query (in seconds)"
    type: number
    sql: ${TABLE}.EXECUTION_TIME/1000 ;;
  }

  dimension: outbound_data_transfer_cloud {
    type: string
    sql: ${TABLE}.OUTBOUND_DATA_TRANSFER_CLOUD ;;
    description: "Target cloud provider for statements that unload data to another region and/or cloud"
  }

  dimension: outbound_data_transfer_region {
    type: string
    sql: ${TABLE}.OUTBOUND_DATA_TRANSFER_REGION ;;
    description: "Target region for statements that unload data to another region and/or cloud"
  }

  dimension: outbound_data_transfer_bytes {
    type: number
    sql: ${TABLE}.OUTBOUND_DATA_TRANSFER_BYTES ;;
    description: "Number of bytes transferred in statements that unload data to another region and/or cloud"
  }

  dimension: inbound_data_transfer_cloud {
    type: string
    sql: ${TABLE}.INBOUND_DATA_TRANSFER_CLOUD ;;
    description: "Source cloud provider for statements that load data from another region and/or cloud"
  }

  dimension: inbound_data_transfer_region {
    type: string
    sql: ${TABLE}.INBOUND_DATA_TRANSFER_REGION ;;
    description: "Source region for statements that load data from another region and/or cloud"
  }

  dimension: inbound_data_transfer_bytes {
    type: number
    sql: ${TABLE}.INBOUND_DATA_TRANSFER_BYTES ;;
    description: "Number of bytes transferred in statements that unload data to another region and/or cloud"
  }

  dimension: query_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.QUERY_ID ;;
    link: {
      label: "Query Inspection for this ID"
      url: "/dashboards/396?Query ID={{ filterable_value }}" ## May need to be changed to LookML dashboard Reference
    }
    description: "Internal/system-generated identifier for the SQL statement"
  }

  dimension: query_tag {
    type: string
    sql: ${TABLE}.QUERY_TAG ;;
    description: "Query tag set for this statement through the QUERY_TAG session parameter"
  }

  dimension: query_text {
    type: string
    sql: ${TABLE}.QUERY_TEXT ;;
    description: "Text of the SQL statement"
  }

  dimension: query_type_detail {
    type: string
    sql: ${TABLE}.QUERY_TYPE ;;
    description: "DML, query, etc. If the query is currently running, or the query failed, then the query type may be UNKNOWN"
  }

  dimension: query_type {
    type: string
    case: {
      when: {
        label: "SELECT Query"
        sql: ${query_type_detail} ILIKE 'SELECT%'
          ;;
      }
      when: {
        label: "CTE SELECT Query"
        sql: ${query_type_detail} ILIKE 'WITH%'
          ;;
      }
      when: {
        label: "DDL Statement"
        sql: ${query_type_detail} ILIKE 'ALTER%'
          OR ${query_type_detail} ILIKE 'COMMENT%'
          OR ${query_type_detail} ILIKE 'CREATE%'
          OR ${query_type_detail} ILIKE 'DESCRIBE%'
          OR ${query_type_detail} ILIKE 'DROP%'
          OR ${query_type_detail} ILIKE 'GRANT%'
          OR ${query_type_detail} ILIKE 'SHOW%'
          OR ${query_type_detail} ILIKE 'UNDROP%'
          OR ${query_type_detail} ILIKE 'USE%'
          ;;
      }
      when: {
        label: "DML Statement"
        sql: ${query_type_detail} ILIKE 'DELETE%'
          OR ${query_type_detail} ILIKE 'INSERT%'
          OR ${query_type_detail} ILIKE 'MERGE%'
          OR ${query_type_detail} ILIKE 'REPLACE%'
          OR ${query_type_detail} ILIKE 'TRUNCATE TABLE%'
          OR ${query_type_detail} ILIKE 'UPDATE%'
          ;;
      }
      else: "Other"
    }
  }

  dimension: queued_overload_time {
    description: "Time (in seconds) spent in the warehouse queue, due to the warehouse being overloaded by the current query workload"
    type: string
    sql: ${TABLE}.QUEUED_OVERLOAD_TIME/1000 ;;
  }

  dimension: queued_provisioning_time {
    description: "Time (in seconds) spent in the warehouse queue, waiting for the warehouse servers to provision, due to warehouse creation, resume, or resize"
    type: string
    sql: ${TABLE}.QUEUED_PROVISIONING_TIME/1000 ;;
  }

  dimension: queued_repair_time {
    description: "Time (in seconds) spent in the warehouse queue, waiting for servers in the warehouse to be repaired"
    type: string
    sql: ${TABLE}.QUEUED_REPAIR_TIME/1000 ;;
  }

  dimension: role_name {
    type: string
    sql: ${TABLE}.ROLE_NAME ;;
    description: "Role that was active in the session at the time of the query"
  }

  dimension: session_id {
    type: number
    sql: ${TABLE}.SESSION_ID ;;
    description: "Session that executed the statement"
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      day_of_month,
      day_of_week,
      month_name,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.START_TIME ;;
    description: "Statement start time (in the UTC time zone)"
  }

  dimension: elapsed_time {
    description: "Elapsed time of the query (in seconds)"
    type: number
    sql: ${TABLE}.TOTAL_ELAPSED_TIME/1000 ;;
  }

  dimension: transaction_blocked_time {
    description: "Time (in seconds) spent blocked by a concurrent DML"
    type: string
    sql: ${TABLE}.TRANSACTION_BLOCKED_TIME/1000 ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}.USER_NAME ;;
    description: "User who issued the query"
  }

  dimension: warehouse_name {
    type: string
    sql: ${TABLE}.WAREHOUSE_NAME ;;
    description: "Warehouse that the query executed on, if any"
  }

  dimension: warehouse_size {
    type: string
    sql: ${TABLE}.WAREHOUSE_SIZE ;;
    description: "Size of the warehouse when this statement executed"
  }

  dimension: warehouse_type {
    type: string
    sql: ${TABLE}.WAREHOUSE_TYPE ;;
    description: "Type of the warehouse when this statement executed"
  }

  dimension: is_prior_month_mtd {
    type: yesno
    sql:  EXTRACT(month, ${start_raw}) = EXTRACT(month, current_timestamp()) - 1
            and ${start_raw} <= dateadd(month, -1, current_timestamp())  ;;
  }

  # MEASURES #

  measure: query_count {
    type: count
    drill_fields: [detail*]
    alias: [job_count]
  }

  measure: current_four_weeks_query_count {
    type: count
    filters: {field: start_date value: "last 4 weeks"}
    drill_fields: [user_name,warehouse_name,database_name,query_count]
  }

  measure: prior_four_weeks_query_count {
    type: count
    filters: {field: start_date value: "8 weeks ago for 4 weeks"}
    drill_fields: [user_name,warehouse_name,database_name,query_count]
  }

  measure: prior_mtd_query_count {
    type: count
    filters: {field: is_prior_month_mtd value: "yes"}
    value_format_name:  decimal_0
    alias: [prior_mtd_job_count, prior_month_job_count]
  }

  measure: average_execution_time {
    type: average
    group_label: "Runtime Metrics"
    sql: ${execution_time} ;;
    value_format_name: decimal_2
  }

  measure: average_overall_queued_time {
    type: average
    group_label: "Runtime Metrics"
    sql: ${queued_repair_time}+${queued_provisioning_time}+${queued_overload_time} ;;
    value_format_name: decimal_2
  }

  measure: average_compilation_time {
    type: average
    group_label: "Runtime Metrics"
    sql: ${compilation_time} ;;
    value_format_name: decimal_2
  }

  measure: average_elapsed_time {
    type: average
    group_label: "Runtime Metrics"
    sql: ${elapsed_time} ;;
    value_format_name: decimal_2
  }

  measure: average_queued_overload_time {
    type: average
    group_label: "Runtime Metrics"
    sql: ${queued_overload_time} ;;
    value_format_name: decimal_2
  }

  measure: total_execution_time {
    type: sum
    group_label: "Runtime Metrics"
    sql: ${execution_time} ;;
    value_format_name: decimal_2
  }

  measure: total_queued_overload_time {
    type: sum
    group_label: "Runtime Metrics"
    sql: ${queued_overload_time} ;;
    value_format_name: decimal_2
  }

  measure: total_elapsed_time {
    type: sum
    group_label: "Runtime Metrics"
    sql: ${elapsed_time} ;;
    value_format_name: decimal_2
  }

  measure: total_queued_repair_time  {
    type: sum
    group_label: "Runtime Metrics"
    sql: ${queued_repair_time} ;;
    value_format_name: decimal_2
  }

  measure: total_overall_queued_time {
    type: sum
    group_label: "Runtime Metrics"
    sql: ${queued_repair_time}+${queued_provisioning_time}+${queued_overload_time} ;;
    value_format_name: decimal_2
  }

  measure: total_compilation_time  {
    type: sum
    group_label: "Runtime Metrics"
    sql: ${compilation_time} ;;
    value_format_name: decimal_2
  }

  measure: total_queued_provisioning_time  {
    type: sum
    group_label: "Runtime Metrics"
    sql: ${queued_provisioning_time} ;;
    value_format_name: decimal_2
  }
  measure: total_transaction_blocked_time  {
    type: sum
    group_label: "Runtime Metrics"
    sql: ${transaction_blocked_time} ;;
    value_format_name: decimal_2
  }

  measure: current_four_weeks_avg_exec_time {
    type: average
    sql: ${execution_time} ;;
    group_label: "Runtime Metrics"
    filters: {field: start_date value: "last 4 weeks"}
    value_format_name: decimal_2
    drill_fields: [user_name,warehouse_name,database_name,average_execution_time]
  }

  measure: prior_four_weeks_avg_exec_time {
    type:  average
    sql:  ${execution_time} ;;
    group_label: "Runtime Metrics"
    filters: {field: start_date value: "8 weeks ago for 4 weeks"}
    value_format_name: decimal_2
  }

  # SETS #

  set: detail {
    fields: [
      #id,
      user_name,
      role_name,
      database_name,
      warehouse_name,
      #databases.id,
      databases.database_name
    ]
  }
}
