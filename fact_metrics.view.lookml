- view: fact_metrics
  sql_table_name: looker_data.fact_metrics
  fields:

  - dimension: calendardate
    type: date
    sql: ${TABLE}.calendardate

  - dimension: entity
    type: string
    sql: ${TABLE}.entity
    
  - dimension: is_1W
    type: yesno
    sql: dim_compute_period_byweek_wprior.computeperiod = '1W' and ${TABLE}.calendardate = dim_compute_period_byweek_wprior.calendardate
    
  - dimension: is_4W
    type: yesno
    sql: dim_compute_period_byweek_wprior.computeperiod = '4W' and ${TABLE}.calendardate = dim_compute_period_byweek_wprior.calendardate
    
  - dimension: is_1WPY
    type: yesno
    sql: dim_compute_period_byweek_wprior.computeperiod = '1W' and ${TABLE}.calendardate = dim_compute_period_byweek_wprior.prior_calendardate
    
  - dimension: is_4WPY
    type: yesno
    sql: dim_compute_period_byweek_wprior.computeperiod = '4W' and ${TABLE}.calendardate = dim_compute_period_byweek_wprior.prior_calendardate

  - measure: count
    type: count
    drill_fields: []
    
  - measure: 4Wweeks_count
    type: count_distinct
    filters:
      is_4W: True
    sql: dim_compute_period_byweek_wprior.weekno
    
  - measure: 4WPYweeks_count
    type: count_distinct
    filters:
      is_4WPY: True
    sql: dim_compute_period_byweek_wprior.prior_weekno
    
    
  - measure: carcount1W
    type: sum
    filters:
      is_1W: True
    sql: ${TABLE}.car_count
    drill_fields: []
    
  - measure: carcount4W
    type: sum
    filters:
      is_4W: True
    sql: ${TABLE}.car_count
    drill_fields: []
    
  - measure: carcount1WPY
    type: sum
    filters:
      is_1WPY: True
    sql: ${TABLE}.car_count
    drill_fields: []
    
  - measure: carcount4WPY
    type: sum
    filters:
      is_4WPY: True
    sql: ${TABLE}.car_count
    drill_fields: []


