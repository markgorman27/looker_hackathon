- view: dim_compute_period_byweek
  sql_table_name: looker_data.dim_compute_period_byweek
  fields:

  - dimension: calendardate
    type: date
    sql: ${TABLE}.calendardate

  - dimension: calendardate_name
    type: string
    sql: ${TABLE}.calendardate_name

  - dimension: computeperiod
    type: string
    sql: ${TABLE}.computeperiod

  - dimension: computeperiod_name
    type: string
    sql: ${TABLE}.computeperiod_name

  - dimension: computeyear
    type: string
    sql: ${TABLE}.computeyear

  - dimension: computeyear_name
    type: string
    sql: ${TABLE}.computeyear_name

  - dimension: fromperiod
    type: string
    sql: ${TABLE}.fromperiod

  - dimension: toperiod
    type: string
    sql: ${TABLE}.toperiod

  - dimension: total_days
    type: number
    sql: ${TABLE}.total_days

  - dimension: weekno
    type: number
    sql: ${TABLE}.weekno

  - dimension: weekno_name
    type: string
    sql: ${TABLE}.weekno_name

  - measure: count
    type: count
    drill_fields: [computeperiod_name, computeyear_name, weekno_name, calendardate_name]

