- dashboard: snowflake_usage
  title: Snowflake Usage
  layout: newspaper
  elements:
  - title: Average Execution Time by User (Last 4 Weeks)
    name: Average Execution Time by User (Last 4 Weeks)
    model: block_snowflake_usage_v2
    explore: query_history
    type: looker_column
    fields: [query_history.user_name, query_history.current_four_weeks_avg_exec_time]
    limit: 500
    query_timezone: UTC
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
        __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml
        __LINE_NUM: 17
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: Avg Execution Time (secs), orientation: left, series: [{axisId: query_history.average_execution_time,
            id: query_history.average_execution_time, name: Average Execution Time,
            __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 21}], showLabels: false, showValues: false, maxValue: !!null '',
        minValue: !!null '', valueFormat: !!null '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: !!null '', type: linear, __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
        __LINE_NUM: 21}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    show_null_points: true
    interpolation: linear
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen: {}
    row: 32
    col: 0
    width: 12
    height: 8
  - title: Failed Logins by User (Last 4 Weeks)
    name: Failed Logins by User (Last 4 Weeks)
    model: block_snowflake_usage_v2
    explore: login_history
    type: table
    fields: [login_history.user_name, login_history.logins, login_history.total_failed_logins,
      login_history.login_failure_rate]
    filters:
      login_history.event_date: 4 weeks
    sorts: [login_history.logins desc]
    limit: 500
    query_timezone: UTC
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen: {}
    row: 32
    col: 12
    width: 12
    height: 7
  - title: Failed Logins by User and Connecting Client (Last 4 Weeks)
    name: Failed Logins by User and Connecting Client (Last 4 Weeks)
    model: block_snowflake_usage_v2
    explore: login_history
    type: table
    fields: [login_history.user_name, login_history.logins, login_history.total_failed_logins,
      login_history.login_failure_rate, login_history.reported_client_type]
    pivots: [login_history.reported_client_type]
    filters:
      login_history.event_date: 4 weeks
    sorts: [login_history.logins desc 0, login_history.reported_client_type]
    limit: 500
    total: true
    row_total: right
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: true
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_labels:
      login_history.total_failed_logins: Failed Logins
      login_history.login_failure_rate: Failure Rate
      login_history.reported_client_type: Client Type
      login_history.user_name: User Name
    listen: {}
    row: 64
    col: 0
    width: 24
    height: 9
  - title: Billable TB (Last 4 Weeks)
    name: Billable TB (Last 4 Weeks)
    model: block_snowflake_usage_v2
    explore: storage_usage
    type: single_value
    fields: [storage_usage.current_four_weeks_billable_tb, storage_usage.prior_four_weeks_billable_tb]
    limit: 500
    dynamic_fields: [{table_calculation: difference, label: Difference, expression: "${storage_usage.current_four_weeks_billable_tb}\
          \ - ${storage_usage.prior_four_weeks_billable_tb}", value_format: !!null '',
        value_format_name: decimal_4, _kind_hint: measure, _type_hint: number}]
    query_timezone: UTC
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: ''
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    comparison_label: Billable TB (Prior 4 Weeks)
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields: [storage_usage.prior_four_weeks_billable_tb]
    listen: {}
    row: 4
    col: 6
    width: 6
    height: 4
  - title: Total Queries (Last 4 Weeks)
    name: Total Queries (Last 4 Weeks)
    model: block_snowflake_usage_v2
    explore: query_history
    type: single_value
    fields: [query_history.current_four_weeks_query_count, query_history.prior_four_weeks_query_count]
    limit: 500
    dynamic_fields: [{table_calculation: difference, label: Difference, expression: "${query_history.current_four_weeks_query_count}\
          \ - ${query_history.prior_four_weeks_query_count}", value_format: !!null '',
        value_format_name: decimal_0, _kind_hint: measure, _type_hint: number}]
    query_timezone: UTC
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    value_format: ''
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Prior Four Weeks
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields: [query_history.prior_four_weeks_query_count]
    listen: {}
    row: 0
    col: 6
    width: 6
    height: 4
  - title: Data Loading
    name: Data Loading
    model: block_snowflake_usage_v2
    explore: load_history
    type: single_value
    fields: [load_history.total_row_count, load_history.total_error_count]
    filters:
      load_history.last_load_time_date: 7 days
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    series_types: {}
    y_axes: [{label: Rows Loaded, orientation: left, series: [{id: load_history.total_row_count,
            name: Load History Total Row Count, axisId: load_history.total_row_count,
            __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 378}], showLabels: true, showValues: true, valueFormat: '[>=1000000]0.0,,"
          M";[>=100000]0.0," K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear, __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
        __LINE_NUM: 378}]
    x_axis_label: Load Date
    single_value_title: Rows Loaded Last 7 Days
    comparison_label: Row Errors on Load Last 7 Days
    listen: {}
    row: 47
    col: 0
    width: 6
    height: 7
  - title: Total Rows Loaded (Last 4 Weeks)
    name: Total Rows Loaded (Last 4 Weeks)
    model: block_snowflake_usage_v2
    explore: load_history
    type: looker_column
    fields: [load_history.total_row_count, load_history.last_load_time_date]
    fill_fields: [load_history.last_load_time_date]
    filters:
      load_history.last_load_time_date: 4 weeks
    sorts: [load_history.last_load_time_date desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    y_axes: [{label: Rows Loaded, orientation: left, series: [{axisId: load_history.total_row_count,
            id: load_history.total_row_count, name: Load History Total Row Count,
            __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 408}], showLabels: false, showValues: true, valueFormat: '[>=1000000]0.0,,"
          M";[>=100000]0.0," K";0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear, __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
        __LINE_NUM: 408}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    x_axis_label: Load Date
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 47
    col: 6
    width: 6
    height: 7
  - title: Database Storage Growth
    name: Database Storage Growth
    model: block_snowflake_usage_v2
    explore: storage_usage
    type: looker_line
    fields: [storage_usage.billable_tb, storage_usage.usage_month, storage_usage.database_name]
    pivots: [storage_usage.database_name]
    fill_fields: [storage_usage.usage_month]
    filters:
      storage_usage.usage_date: 12 months ago for 12 months
    sorts: [storage_usage.usage_month desc, storage_usage.database_name]
    limit: 500
    column_limit: 50
    query_timezone: UTC
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: 44596d66-8a4e-463a-84d4-cd5a05aaf752
      options:
        steps: 5
        __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml
        __LINE_NUM: 587
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    y_axes: [{label: Billable Tb, orientation: left, series: [{axisId: storage_usage.billable_tb,
            id: LOOKER_SCRATCH_DB2 - storage_usage.billable_tb, name: LOOKER_SCRATCH_DB2,
            __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 591}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
        __LINE_NUM: 591}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      LOOKER_SCRATCH_DB2 - storage_usage.billable_tb: "#3EB0D5"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 39
    col: 12
    width: 12
    height: 7
  - title: Billable TB by Month
    name: Billable TB by Month
    model: block_snowflake_usage_v2
    explore: storage_usage
    type: looker_line
    fields: [storage_usage.billable_tb, storage_usage.usage_month]
    fill_fields: [storage_usage.usage_month]
    filters:
      storage_usage.usage_date: 12 months ago for 12 months
    sorts: [storage_usage.usage_month desc]
    limit: 500
    query_timezone: UTC
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
        __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml
        __LINE_NUM: 645
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Billable Tb, orientation: left, series: [{axisId: storage_usage.billable_tb,
            id: storage_usage.billable_tb, name: Billable Tb, __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 649}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
        __LINE_NUM: 649}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 40
    col: 0
    width: 12
    height: 7
  - title: Query Volume and Runtime
    name: Query Volume and Runtime
    model: block_snowflake_usage_v2
    explore: query_history
    type: looker_column
    fields: [query_history.start_week, query_history.query_count, query_history.average_execution_time]
    fill_fields: [query_history.start_week]
    filters:
      query_history.execution_status: SUCCESS
      query_history.start_week: 8 weeks
    sorts: [query_history.start_week]
    limit: 500
    column_limit: 50
    query_timezone: UTC
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: 80d0e28a-6146-432d-a064-7bfb639e22f0
      options:
        steps: 5
        reverse: false
        __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml
        __LINE_NUM: 703
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: Query Run Count, orientation: left, series: [{axisId: query_history.query_count,
            id: query_history.query_count, name: Query Count, __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 708}], showLabels: false, showValues: false, valueFormat: '[>=1000000]0.00,,"M";[>=1000]0.00,"K";0.00''',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear,
        __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml, __LINE_NUM: 708},
      {label: Average Query Execution TIme (seconds), orientation: left, series: [
          {axisId: query_history.average_execution_time, id: query_history.average_execution_time,
            name: Average Execution Time, __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 713}], showLabels: false, showValues: false, valueFormat: '0',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear,
        __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml, __LINE_NUM: 712}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      query_history.average_execution_time: "#173589"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    comparison_label: Avg Exec Time (Prior MTD)
    single_value_title: Avg Execution Time in Secs (MTD)
    value_format: ''
    listen: {}
    row: 0
    col: 12
    width: 12
    height: 8
  - title: Credits Used By Warehouse (Last 4 Weeks)
    name: Credits Used By Warehouse (Last 4 Weeks)
    model: block_snowflake_usage_v2
    explore: warehouse_metering_history
    type: looker_column
    fields: [warehouse_metering_history.warehouse_name, warehouse_metering_history.current_four_weeks_credits_used]
    limit: 500
    total: true
    query_timezone: UTC
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
        __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml
        __LINE_NUM: 774
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: warehouse_metering_history.total_credits_used,
            id: warehouse_metering_history.total_credits_used, name: Total Credits
              Used, __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 778}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
        __LINE_NUM: 778}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle
    series_colors:
      warehouse_metering_history.total_credits_used: "#72C5D4"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 24
    col: 12
    width: 12
    height: 8
  - title: Credits Used (Last 4 Weeks)
    name: Credits Used (Last 4 Weeks)
    model: block_snowflake_usage_v2
    explore: warehouse_metering_history
    type: single_value
    fields: [warehouse_metering_history.current_four_weeks_credits_used, warehouse_metering_history.prior_four_weeks_credits_used]
    limit: 500
    dynamic_fields: [{table_calculation: difference, label: Difference, expression: "${warehouse_metering_history.current_four_weeks_credits_used}\
          \ - ${warehouse_metering_history.prior_four_weeks_credits_used}", value_format: !!null '',
        value_format_name: decimal_2, _kind_hint: measure, _type_hint: number}]
    query_timezone: UTC
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: ''
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    comparison_label: Credits Used (Prior 4 Weeks)
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields: [warehouse_metering_history.prior_four_weeks_credits_used]
    listen: {}
    row: 0
    col: 0
    width: 6
    height: 4
  - title: Total Queries by Warehouse (Last 4 Weeks)
    name: Total Queries by Warehouse (Last 4 Weeks)
    model: block_snowflake_usage_v2
    explore: query_history
    type: looker_column
    fields: [query_history.warehouse_name, query_history.current_four_weeks_query_count]
    sorts: [query_history.warehouse_name desc]
    limit: 500
    query_timezone: UTC
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
        __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml
        __LINE_NUM: 878
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: Job Count, orientation: left, series: [{axisId: query_history.query_count,
            id: query_history.query_count, name: Query Count, __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 882}], showLabels: false, showValues: false, maxValue: !!null '',
        minValue: !!null '', valueFormat: !!null '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear, __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
        __LINE_NUM: 882}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    show_null_points: true
    interpolation: linear
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen: {}
    row: 24
    col: 0
    width: 12
    height: 8
  - title: Credits by Date
    name: Credits by Date
    model: block_snowflake_usage_v2
    explore: warehouse_metering_history
    type: looker_column
    fields: [warehouse_metering_history.total_credits_used, warehouse_metering_history.warehouse_name,
      warehouse_metering_history.start_date]
    pivots: [warehouse_metering_history.warehouse_name]
    fill_fields: [warehouse_metering_history.start_date]
    filters:
      warehouse_metering_history.start_date: 4 weeks
    sorts: [warehouse_metering_history.warehouse_name]
    limit: 500
    query_timezone: UTC
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: 44596d66-8a4e-463a-84d4-cd5a05aaf752
      options:
        steps: 5
        __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml
        __LINE_NUM: 946
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: COMPUTE_WH - warehouse_metering_history.total_credits_used,
            id: COMPUTE_WH - warehouse_metering_history.total_credits_used, name: COMPUTE_WH,
            __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 950}, {axisId: LOOKER_WH - warehouse_metering_history.total_credits_used,
            id: LOOKER_WH - warehouse_metering_history.total_credits_used, name: LOOKER_WH,
            __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 952}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
        __LINE_NUM: 950}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    series_colors:
      COMPUTE_WH - warehouse_metering_history.total_credits_used: "#3EB0D5"
      LOOKER_WH - warehouse_metering_history.total_credits_used: "#184EA0"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 8
    col: 0
    width: 12
    height: 8
  - title: Credits by Month
    name: Credits by Month
    model: block_snowflake_usage_v2
    explore: warehouse_metering_history
    type: looker_column
    fields: [warehouse_metering_history.total_credits_used, warehouse_metering_history.warehouse_name,
      warehouse_metering_history.start_month]
    pivots: [warehouse_metering_history.warehouse_name]
    fill_fields: [warehouse_metering_history.start_month]
    filters:
      warehouse_metering_history.start_date: 12 months
    sorts: [warehouse_metering_history.warehouse_name]
    limit: 500
    query_timezone: UTC
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: 44596d66-8a4e-463a-84d4-cd5a05aaf752
      options:
        steps: 5
        __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml
        __LINE_NUM: 946
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: COMPUTE_WH - warehouse_metering_history.total_credits_used,
            id: COMPUTE_WH - warehouse_metering_history.total_credits_used, name: COMPUTE_WH,
            __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 950}, {axisId: LOOKER_WH - warehouse_metering_history.total_credits_used,
            id: LOOKER_WH - warehouse_metering_history.total_credits_used, name: LOOKER_WH,
            __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 952}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
        __LINE_NUM: 950}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    series_colors:
      COMPUTE_WH - warehouse_metering_history.total_credits_used: "#3EB0D5"
      LOOKER_WH - warehouse_metering_history.total_credits_used: "#184EA0"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 16
    col: 0
    width: 12
    height: 8
  - title: Avg Exec Time (Last 4 Weeks)
    name: Avg Exec Time (Last 4 Weeks)
    model: block_snowflake_usage_v2
    explore: query_history
    type: single_value
    fields: [query_history.current_four_weeks_avg_exec_time, query_history.prior_four_weeks_avg_exec_time]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: difference, label: Difference, expression: "${query_history.current_four_weeks_avg_exec_time}\
          \ - ${query_history.prior_four_weeks_avg_exec_time}", value_format: !!null '',
        value_format_name: decimal_2, _kind_hint: measure, _type_hint: number}]
    query_timezone: UTC
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: ''
    value_format: ''
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    comparison_label: Avg Exec Time (Prior 4 Weeks)
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields: [query_history.prior_four_weeks_avg_exec_time]
    listen: {}
    row: 4
    col: 0
    width: 6
    height: 4
  - title: Average Execution Time by Query Type and Warehouse Size (Last 4 Weeks)
    name: Average Execution Time by Query Type and Warehouse Size (Last 4 Weeks)
    model: block_snowflake_usage_v2
    explore: query_history
    type: looker_column
    fields: [query_history.query_type, query_history.warehouse_size, query_history.current_four_weeks_avg_exec_time]
    pivots: [query_history.warehouse_size]
    fill_fields: [query_history.query_type]
    filters:
      query_history.start_date: 4 weeks
      query_history.warehouse_size: "-UNKNOWN"
    sorts: [query_history.warehouse_size 0, query_history.current_four_weeks_avg_exec_time
        desc 0]
    limit: 500
    query_timezone: UTC
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
        __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml
        __LINE_NUM: 463
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: Avg Execution Time (secs), orientation: left, series: [{axisId: query_history.average_execution_time,
            id: Medium - query_history.average_execution_time, name: Medium, __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 467}, {axisId: query_history.average_execution_time, id: query_history.warehouse_size___null
              - query_history.average_execution_time, name: "∅", __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
            __LINE_NUM: 468}], showLabels: false, showValues: false, maxValue: !!null '',
        minValue: !!null '', valueFormat: !!null '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: !!null '', type: linear, __FILE: block-snowflake-usage/account_usage_dashboard.dashboard.lookml,
        __LINE_NUM: 467}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    show_null_points: true
    interpolation: linear
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: []
    listen: {}
    row: 46
    col: 12
    width: 12
    height: 8
  - title: Query Count to Credits Used Ratio
    name: Query Count to Credits Used Ratio
    model: block_snowflake_usage_v2
    explore: query_history
    type: looker_column
    fields: [query_history.start_date, query_history.query_count, warehouse_metering_history.total_credits_used,
      query_history.warehouse_name]
    pivots: [query_history.warehouse_name]
    fill_fields: [query_history.start_date]
    filters:
      query_history.start_date: 4 weeks
      query_history.warehouse_name: "-NULL"
    sorts: [query_history.warehouse_name 0, query_history.start_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: query_count_to_credits_used_ratio, label: Query
          Count to Credits Used Ratio, expression: "${query_history.query_count} /\
          \ ${warehouse_metering_history.total_credits_used}", value_format: !!null '',
        value_format_name: decimal_2, _kind_hint: measure, _type_hint: number}]
    query_timezone: UTC
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: query_count_to_credits_used_ratio,
            id: COMPUTE_WH - query_count_to_credits_used_ratio, name: COMPUTE_WH},
          {axisId: query_count_to_credits_used_ratio, id: LOOKER_WH - query_count_to_credits_used_ratio,
            name: LOOKER_WH}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [query_history.query_count, warehouse_metering_history.total_credits_used]
    listen: {}
    row: 8
    col: 12
    width: 12
    height: 16