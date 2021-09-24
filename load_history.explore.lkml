include: "load_history_core.view.lkml"


explore: load_history_core {
  extension: required
  fields: [ALL_FIELDS*,-tables.table_name,-tables.id]
  join: tables {
    sql_on: ${load_history.table_id} = ${tables.id} ;;
    relationship: many_to_one
  }
}
