- view: dim_compute_period_byperiod
  sql_table_name: looker_data.dim_compute_period_byperiod
  fields:

  - dimension_group: calendardate
    type: time
    timeframes: [date, week, month]
    convert_tz: false
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

  - dimension: fromperiod
    type: string
    sql: ${TABLE}.fromperiod

  - dimension: toperiod
    type: string
    sql: ${TABLE}.toperiod

  - dimension: toperiod_name
    type: string
    sql: ${TABLE}.toperiod_name

  - dimension: total_days
    type: number
    sql: ${TABLE}.total_days

  - dimension: weekno
    type: number
    sql: ${TABLE}.weekno

  - measure: count
    type: count
    drill_fields: [computeperiod_name, toperiod_name, calendardate_name]

