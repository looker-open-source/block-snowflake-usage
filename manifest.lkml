project_name: "block-snowflake-usage"

################ Constants ################

constant: CONFIG_PROJECT_NAME {
  value: "block-snowflake-usage-config"
  export: override_required
}

# The Snowflake connection as listed in the Admin panel
constant: CONNECTION_NAME {
  value: "block-snowflake-usage"
  export: override_required
}

constant: DATABASE_NAME {
  value: "SNOWFLAKE"
  export: override_required
}

################ Dependencies ################

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"

  override_constant: DATABASE_NAME {
    value: "@{DATABASE_NAME}"
  }
}
