connection: "@{CONNECTION_NAME}"

include: "/views/*.view.lkml"
include: "/dashboards/*.dashboard.lookml"


explore: load_history{
  fields: [ALL_FIELDS*,-tables.table_name,-tables.id]
  join: tables {
    sql_on: ${load_history.table_id} = ${tables.id} ;;
    relationship: many_to_one
  }
}

explore: login_history {
}

explore: query_history {
  join: databases {
    type: left_outer
    sql_on: ${query_history.database_name} = ${databases.database_name} ;;
    relationship: many_to_one
  }
  join: warehouse_metering_history {
    relationship: many_to_one
    type: left_outer
    sql_on: ${warehouse_metering_history.warehouse_name} = ${query_history.warehouse_name} AND ${query_history.start_raw} BETWEEN ${warehouse_metering_history.start_raw} AND ${warehouse_metering_history.end_raw} ;;
  }
}

explore: storage_usage {
}

explore: warehouse_metering_history {
}
