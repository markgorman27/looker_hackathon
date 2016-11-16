- view: lfact_metrics
  sql_table_name: demo_deliver.lfact_metrics
  fields:

  - dimension_group: calendardate
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.calendardate

  - dimension: metric_1
    type: number
    sql: ${TABLE}.metric_1

  - dimension: metric_2
    type: number
    sql: ${TABLE}.metric_2

  - dimension: metric_3
    type: number
    sql: ${TABLE}.metric_3

  - dimension: metric_4
    type: number
    sql: ${TABLE}.metric_4

  - dimension: metric_5
    type: number
    sql: ${TABLE}.metric_5

  - dimension: metric_6
    type: number
    sql: ${TABLE}.metric_6

  - dimension: metric_7
    type: number
    sql: ${TABLE}.metric_7

  - dimension: metric_8
    type: number
    sql: ${TABLE}.metric_8

  - dimension: path
    type: string
    sql: ${TABLE}.path

  - dimension: store
    type: string
    sql: ${TABLE}.store

  - measure: count
    type: count
    drill_fields: []

