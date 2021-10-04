- dashboard: query_inspection
  title: Query Inspection
  layout: newspaper
  elements:
  - title: Execution Time
    name: Execution Time
    model: block_snowflake_usage_v2
    explore: query_history
    type: single_value
    fields: [query_history.average_execution_time, query_history.query_text_selector]
    fill_fields: [query_history.query_text_selector]
    filters: {}
    sorts: [query_history.query_text_selector]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: difference, label: Difference, expression: "${query_history.average_execution_time}\
          \ - offset(${query_history.average_execution_time},1)", value_format: !!null '',
        value_format_name: decimal_2, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    value_format: ''
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    comparison_label: Compared to Avg of All Others
    series_types: {}
    hidden_fields: []
    listen:
      Query Text: query_history.query_text_filter
      Start Date: query_history.start_date
    row: 0
    col: 6
    width: 6
    height: 4
  - title: Query Count
    name: Query Count
    model: block_snowflake_usage_v2
    explore: query_history
    type: single_value
    fields: [query_history.query_text_selector, query_history.query_count]
    fill_fields: [query_history.query_text_selector]
    filters: {}
    sorts: [query_history.query_text_selector]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: total, label: Total, expression: 'if(is_null(${query_history.query_count}/(${query_history.query_count}
          + offset(${query_history.query_count},1))), 0, ${query_history.query_count}/(${query_history.query_count}
          + offset(${query_history.query_count},1)))', value_format: !!null '', value_format_name: percent_2,
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    value_format: ''
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: of All Queries
    series_types: {}
    hidden_fields: []
    listen:
      Query Text: query_history.query_text_filter
      Start Date: query_history.start_date
    row: 0
    col: 0
    width: 6
    height: 4
  - title: Compilation Time
    name: Compilation Time
    model: block_snowflake_usage_v2
    explore: query_history
    type: single_value
    fields: [query_history.query_text_selector, query_history.average_compilation_time]
    fill_fields: [query_history.query_text_selector]
    filters: {}
    sorts: [query_history.query_text_selector]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: difference, label: Difference, expression: "${query_history.average_compilation_time}\
          \ - offset(${query_history.average_compilation_time},1)", value_format: !!null '',
        value_format_name: decimal_2, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    value_format: ''
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    comparison_label: Compared to Avg of All Others
    series_types: {}
    hidden_fields: []
    listen:
      Query Text: query_history.query_text_filter
      Start Date: query_history.start_date
    row: 0
    col: 12
    width: 6
    height: 4
  - title: Queued Overload Time
    name: Queued Overload Time
    model: block_snowflake_usage_v2
    explore: query_history
    type: single_value
    fields: [query_history.query_text_selector, query_history.average_queued_overload_time]
    fill_fields: [query_history.query_text_selector]
    filters: {}
    sorts: [query_history.query_text_selector]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: difference, label: Difference, expression: "${query_history.average_queued_overload_time}\
          \ - offset(${query_history.average_queued_overload_time},1)", value_format: !!null '',
        value_format_name: decimal_2, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    value_format: ''
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    comparison_label: Compared to Avg of All Others
    series_types: {}
    hidden_fields: []
    listen:
      Query Text: query_history.query_text_filter
      Start Date: query_history.start_date
    row: 0
    col: 18
    width: 6
    height: 4
  - title: Query Text
    name: Query Text
    model: block_snowflake_usage_v2
    explore: query_history
    type: table
    fields: [query_history.query_id, query_history.query_text]
    filters: {}
    sorts: [query_history.query_text]
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen:
      Query Text: query_history.query_text
      Start Date: query_history.start_date
    row: 22
    col: 0
    width: 24
    height: 9
  - title: Warehouse
    name: Warehouse
    model: block_snowflake_usage_v2
    explore: query_history
    type: looker_pie
    fields: [query_history.query_count, query_history.warehouse_name]
    filters: {}
    sorts: [query_history.query_count desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
        reverse: false
    series_colors: {}
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: query_history.query_count,
            id: query_history.query_count, name: Query Count}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    value_format: ''
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: of All Queries
    hidden_fields: []
    listen:
      Query Text: query_history.query_text
      Start Date: query_history.start_date
    row: 14
    col: 0
    width: 6
    height: 8
  - title: Database
    name: Database
    model: block_snowflake_usage_v2
    explore: query_history
    type: looker_pie
    fields: [query_history.query_count, query_history.database_name]
    filters: {}
    sorts: [query_history.query_count desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
        reverse: false
    series_colors: {}
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: query_history.query_count,
            id: query_history.query_count, name: Query Count}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    value_format: ''
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: of All Queries
    hidden_fields: []
    listen:
      Query Text: query_history.query_text
      Start Date: query_history.start_date
    row: 14
    col: 6
    width: 6
    height: 8
  - title: Query Type
    name: Query Type
    model: block_snowflake_usage_v2
    explore: query_history
    type: looker_pie
    fields: [query_history.query_count, query_history.query_type]
    fill_fields: [query_history.query_type]
    filters: {}
    sorts: [query_history.query_count desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
        reverse: false
    series_colors: {}
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: query_history.query_count,
            id: query_history.query_count, name: Query Count}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    value_format: ''
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: of All Queries
    hidden_fields: []
    listen:
      Query Text: query_history.query_text
      Start Date: query_history.start_date
    row: 14
    col: 12
    width: 6
    height: 8
  - title: Pattern-matching Queries
    name: Pattern-matching Queries
    model: block_snowflake_usage_v2
    explore: query_history
    type: looker_column
    fields: [query_history.query_count, query_history.start_date]
    filters: {}
    sorts: [query_history.start_date desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: query_history.query_count,
            id: query_history.query_count, name: Query Count}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
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
      query_history.query_count: "#173589"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    value_format: ''
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: of All Queries
    hidden_fields: []
    listen:
      Query Text: query_history.query_text
      Start Date: query_history.start_date
    row: 4
    col: 0
    width: 24
    height: 10
  - title: User
    name: User
    model: block_snowflake_usage_v2
    explore: query_history
    type: looker_bar
    fields: [query_history.query_count, query_history.user_name]
    filters: {}
    sorts: [query_history.query_count desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: query_history.query_count,
            id: query_history.query_count, name: Query Count}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
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
      query_history.query_count: "#173589"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    value_format: ''
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: of All Queries
    hidden_fields: []
    listen:
      Query Text: query_history.query_text
      Start Date: query_history.start_date
    row: 14
    col: 18
    width: 6
    height: 8
  filters:
  - name: Query Text
    title: Query Text
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: true
    model: block_snowflake_usage_v2
    explore: query_history
    listens_to_filters: []
    field: query_history.query_text
  - name: Start Date
    title: Start Date
    type: field_filter
    default_value: 4 weeks
    allow_multiple_values: true
    required: false
    model: block_snowflake_usage_v2
    explore: query_history
    listens_to_filters: []
    field: query_history.start_date