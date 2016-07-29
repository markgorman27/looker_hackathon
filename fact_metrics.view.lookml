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
    
  - measure: entity_count1W
    type: count_distinct
    filters:
      is_1W: True
    sql: ${TABLE}.entity
  
  - measure: entity_count4W
    type: count_distinct
    filters:
      is_4W: True
    sql: ${TABLE}.entity  
    
  - measure: entity_count1WPY
    type: count_distinct
    filters:
      is_1WPY: True
    sql: ${TABLE}.entity       
    
  - measure: entity_count4WPY
    type: count_distinct
    filters:
      is_4WPY: True
    sql: ${TABLE}.entity  
    
  - measure: carcount1W_raw
    type: sum
    filters:
      is_1W: True
    sql: ${TABLE}.car_count
    drill_fields: []
    
  - measure: carcount4W_raw
    type: sum
    filters:
      is_4W: True
    sql: ${TABLE}.car_count
    drill_fields: []
    
  - measure: carcount1WPY_raw
    type: sum
    filters:
      is_1WPY: True
    sql: ${TABLE}.car_count
    drill_fields: []
    
  - measure: carcount4WPY_raw
    type: sum
    filters:
      is_4WPY: True
    sql: ${TABLE}.car_count
    drill_fields: []

  - measure: carcount1W
    type: number
    sql: case when ${entity_count1W} != 0 then ${carcount1W_raw}/${entity_count1W} end
    value_format: '0'
    drill_fields: []
  
  - measure: carcount4W
    type: number
    sql: case when ${4Wweeks_count} != 0 and ${entity_count4W} != 0 then ${carcount4W_raw}/${4Wweeks_count}/${entity_count4W} end
    value_format: '0'
    drill_fields: []
    
  - measure: carcount1WPY
    type: number
    sql: case when ${entity_count1WPY} != 0 then ${carcount1WPY_raw}/${entity_count1WPY} end
    value_format: '0'
    drill_fields: []
    
  - measure: carcount4WPY
    type: number
    sql: case when ${4WPYweeks_count} != 0 and ${entity_count4WPY} != 0 then ${carcount4WPY_raw}/${4WPYweeks_count}/${entity_count4WPY} end
    value_format: '0'
    drill_fields: []
    
  - measure: salespretax1W_raw
    type: sum
    filters:
      is_1W: True
    sql: ${TABLE}.sales_pretax
    drill_fields: []
    
  - measure: salespretax4W_raw
    type: sum
    filters:
      is_4W: True
    sql: ${TABLE}.sales_pretax
    drill_fields: []
    
  - measure: salespretax1WPY_raw
    type: sum
    filters:
      is_1WPY: True
    sql: ${TABLE}.sales_pretax
    drill_fields: []
    
  - measure: salespretax4WPY_raw
    type: sum
    filters:
      is_4WPY: True
    sql: ${TABLE}.sales_pretax
    drill_fields: []

  - measure: salespretax1W
    type: number
    sql: case when ${entity_count1W} != 0 then ${salespretax1W_raw}/${entity_count1W} end
    value_format: '$#,##0'
    drill_fields: []
  
  - measure: salespretax4W
    type: number
    sql: case when ${4Wweeks_count} != 0 and ${entity_count4W} != 0 then ${salespretax4W_raw}/${4Wweeks_count}/${entity_count4W} end
    value_format: '$#,##0'
    drill_fields: []
    
  - measure: salespretax1WPY
    type: number
    sql: case when ${entity_count1WPY} != 0 then ${salespretax1WPY_raw}/${entity_count1WPY} end
    value_format: '$#,##0'
    drill_fields: []
    
  - measure: salespretax4WPY
    type: number
    sql: case when ${4WPYweeks_count} != 0 and ${entity_count4WPY} != 0 then ${salespretax4WPY_raw}/${4WPYweeks_count}/${entity_count4WPY} end
    value_format: '$#,##0'
    drill_fields: []
    
  - measure: ticketaverage1W_raw
    type: sum
    filters:
      is_1W: True
    sql: ${TABLE}.sales_pretax - ${TABLE}.non_taxable_fees
    drill_fields: []
    
  - measure: ticketaverage4W_raw
    type: sum
    filters:
      is_4W: True
    sql: ${TABLE}.sales_pretax - ${TABLE}.non_taxable_fees
    drill_fields: []
    
  - measure: ticketaverage1WPY_raw
    type: sum
    filters:
      is_1WPY: True
    sql: ${TABLE}.sales_pretax - ${TABLE}.non_taxable_fees
    drill_fields: []
    
  - measure: ticketaverage4WPY_raw
    type: sum
    filters:
      is_4WPY: True
    sql: ${TABLE}.sales_pretax - ${TABLE}.non_taxable_fees
    drill_fields: []
    
  - measure: ticketaverage1W
    type: number
    sql: case when ${carcount1W_raw} != 0 then ${ticketaverage1W_raw}/${carcount1W_raw} end
    value_format: '$0'
    drill_fields: []
    
  - measure: ticketaverage4W
    type: number
    sql: case when ${carcount4W_raw} != 0 then ${ticketaverage4W_raw}/${carcount4W_raw} end
    value_format: '$0'
    drill_fields: []
    
  - measure: ticketaverage1WPY
    type: number
    sql: case when ${carcount1WPY_raw} != 0 then ${ticketaverage1WPY_raw}/${carcount1WPY_raw} end
    value_format: '$0'
    drill_fields: []
    
  - measure: ticketaverage4WPY
    type: number
    sql: case when ${carcount4WPY_raw} != 0 then ${ticketaverage4WPY_raw}/${carcount4WPY_raw} end
    value_format: '$0'
    drill_fields: []

