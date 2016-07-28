- view: fact_metrics
  sql_table_name: looker_data.fact_metrics
  fields:

  - dimension: calendardate
    type: date
    sql: ${TABLE}.calendardate

  - dimension: entity
    type: string
    sql: ${TABLE}.entity

  - measure: count
    type: count
    drill_fields: []
    
  - measure: carcount1W
    type: sum
    filters:
      dim_compute_period_byweek.computeperiod: '1W'
    sql: ${TABLE}.car_count
    drill_fields: []
    
  - measure: carcount4W
    type: sum
    filters:
      dim_compute_period_byweek.computeperiod: '4W'
    sql: ${TABLE}.car_count
    drill_fields: []


