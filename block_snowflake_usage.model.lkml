connection: "@{CONNECTION_NAME}"

include: "*.view.lkml"
include: "*.explore.lkml"
include: "*.dashboard.lookml"
include: "//@{CONFIG_PROJECT_NAME}/*.view.lkml"
include: "//@{CONFIG_PROJECT_NAME}/*.model.lkml"

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
