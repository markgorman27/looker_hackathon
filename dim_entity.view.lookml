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
    links: # This cannot be the last field? Weird...
    - label: Breakdown by Coach
      url: /dashboards/4?coach_display_name={{ value }}
      icon_url: http://orig15.deviantart.net/1ad4/f/2009/299/6/3/awesome_face_by_megaman1218.png
    - label: Find me on LinkedIn!
      url: https://www.linkedin.com/vsearch/f?type=all&keywords={{ value }}
      icon_url: https://cdn3.iconfinder.com/data/icons/free-social-icons/67/linkedin_circle_color-512.png
    sql: ${TABLE}.coach_display_name
    drill_fields: entity_display_name

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

