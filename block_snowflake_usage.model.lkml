# include: "//@{CONFIG_PROJECT_NAME}}/*.view"

# explore: app {
#   hidden: yes
# }
# view: app {}

### Previous Core Model was defined as above

connection: "@{CONNECTION_NAME}"

include: "*.view.lkml"         # include all views in this project
include: "*.explore.lkml"
include: "*.dashboard.lookml"
include: "//@{CONFIG_PROJECT_NAME}/*.view.lkml"  # include all dashboards in this project
include: "//@{CONFIG_PROJECT_NAME}/*.model.lkml"

datagroup: snowflake_usage_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

named_value_format: conditional_to_millions {
  value_format: "[>=1000000]0,,\"M\";[>=1000]0,\"K\";0"
}

persist_with: snowflake_usage_default_datagroup

explore: query_history{
  extends: [query_history_config]
}

explore: load_history {
  extends: [load_history_config]
}

explore: login_history {
  extends: [login_history_config]
}

explore: storage_usage{
  extends: [storage_usage_config]
}

explore: warehouse_metering_history {
  extends: [warehouse_metering_history_config]
}
