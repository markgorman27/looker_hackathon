- view: dim_entity
  sql_table_name: cbaautoupdate_deliver.dim_entity2
  fields:

  - dimension: bays
    type: string
    sql: ${TABLE}.bays

  - dimension: coach
    type: string
    sql: ${TABLE}.coach

  - dimension: coach_display_name
    type: string
    sql: ${TABLE}.coach_display_name

  - dimension: coach_name
    type: string
    sql: ${TABLE}.coach_name

  - dimension: entity
    type: string
    sql: ${TABLE}.entity

  - dimension: entity_display_name
    type: string
    sql: ${TABLE}.entity_display_name

  - dimension: entity_name
    type: string
    sql: ${TABLE}.entity_name

  - dimension: national
    type: string
    sql: ${TABLE}.national

  - dimension: national_display_name
    type: string
    sql: ${TABLE}.national_display_name

  - dimension: national_name
    type: string
    sql: ${TABLE}.national_name

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - entity_name
    - entity_display_name
    - coach_name
    - coach_display_name
    - national_name
    - national_display_name

