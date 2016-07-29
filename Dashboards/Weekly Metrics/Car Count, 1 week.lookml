- name: add_a_unique_name_1469806496416
  title: Untitled Visualization
  type: looker_column
  model: square_root
  explore: fact_metrics
  dimensions: [dim_compute_period_byweek_wprior.computeyear, dim_compute_period_byweek_wprior.toperiod]
  measures: [fact_metrics.carcount1W, fact_metrics.carcount1WPY, fact_metrics.carcount4W,
    fact_metrics.carcount4WPY]
  filters:
    dim_entity.coach_display_name: ''
    dim_entity.entity_display_name: Greece
    dim_entity.national_display_name: ''
  sorts: [dim_compute_period_byweek_wprior.toperiod desc]
  limit: 1
  stacking: ''
  show_value_labels: false
  label_density: 25
  legend_position: center
  x_axis_gridlines: false
  y_axis_gridlines: true
  show_view_names: true
  limit_displayed_rows: false
  y_axis_combined: true
  y_axis_min: ['0']
  y_axis_max: ['100']
  show_y_axis_labels: true
  show_y_axis_ticks: true
  y_axis_tick_density: default
  show_x_axis_label: true
  show_x_axis_ticks: true
  x_axis_scale: auto
  y_axis_scale_mode: linear
  show_null_labels: false

