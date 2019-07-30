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
