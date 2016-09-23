- view: fact_metrics
  sql_table_name: cbaautoupdate_deliver.fact_metrics2
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
    label: 'Car Count (1W)'
    type: number
    sql: case when ${entity_count1W} != 0 then ${carcount1W_raw}/${entity_count1W} end
    value_format: '0'
    links:
      - url: /dashboards/6?Date={{ dim_compute_period_byweek_wprior.toperiod._value }}&Coach="{{ dim_entity.coach_name._value | url_encode }}"&Store={{ dim_entity.entity_display_name._value }}
        label: Detials
        icon_url: http://files.softicons.com/download/medical-icons/medical-and-health-care-icons-by-artistsvalley/ico/Hot/Radiation.ico
    drill_fields: []
  
  - measure: carcount4W
    type: number
    sql: case when ${4Wweeks_count} != 0 and ${entity_count4W} != 0 then ${carcount4W_raw}/${4Wweeks_count}/${entity_count4W} end
    value_format: '0'
    drill_fields: []
    
  - measure: carcount1WPY
    label: 'Car Count (1W), Prev. Yr.'
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
    
  - measure: gpm1W_numerator_raw
    type: sum
    filters:
      is_1W: True
    sql: ${TABLE}.parts_revenue + ${TABLE}.labor_revenue + ${TABLE}.sublet_revenue - ${TABLE}.parts_cost - ${TABLE}.labor_cost - ${TABLE}.sublet_cost
    drill_fields: []   
    
  - measure: gpm4W_numerator_raw
    type: sum
    filters:
      is_4W: True
    sql: ${TABLE}.parts_revenue + ${TABLE}.labor_revenue + ${TABLE}.sublet_revenue - ${TABLE}.parts_cost - ${TABLE}.labor_cost - ${TABLE}.sublet_cost
    drill_fields: [] 
    
  - measure: gpm1WPY_numerator_raw
    type: sum
    filters:
      is_1WPY: True
    sql: ${TABLE}.parts_revenue + ${TABLE}.labor_revenue + ${TABLE}.sublet_revenue - ${TABLE}.parts_cost - ${TABLE}.labor_cost - ${TABLE}.sublet_cost
    drill_fields: [] 
    
  - measure: gpm4WPY_numerator_raw
    type: sum
    filters:
      is_4WPY: True
    sql: ${TABLE}.parts_revenue + ${TABLE}.labor_revenue + ${TABLE}.sublet_revenue - ${TABLE}.parts_cost - ${TABLE}.labor_cost - ${TABLE}.sublet_cost
    drill_fields: []    
    
  - measure: gpm1W_denominator_raw
    type: sum
    filters:
      is_1W: True
    sql: ${TABLE}.parts_revenue + ${TABLE}.labor_revenue + ${TABLE}.sublet_revenue
    drill_fields: []   
    
  - measure: gpm4W_denominator_raw
    type: sum
    filters:
      is_4W: True
    sql: ${TABLE}.parts_revenue + ${TABLE}.labor_revenue + ${TABLE}.sublet_revenue
    drill_fields: [] 
    
  - measure: gpm1WPY_denominator_raw
    type: sum
    filters:
      is_1WPY: True
    sql: ${TABLE}.parts_revenue + ${TABLE}.labor_revenue + ${TABLE}.sublet_revenue
    drill_fields: [] 
    
  - measure: gpm4WPY_denominator_raw
    type: sum
    filters:
      is_4WPY: True
    sql: ${TABLE}.parts_revenue + ${TABLE}.labor_revenue + ${TABLE}.sublet_revenue
    drill_fields: []      
    
  - measure: gpm1W
    type: number
    sql: case when ${gpm1W_denominator_raw} != 0 then ${gpm1W_numerator_raw}/${gpm1W_denominator_raw} end
    value_format: '#0.00%'
    drill_fields: []
    
  - measure: gpm4W
    type: number
    sql: case when ${gpm4W_denominator_raw} != 0 then ${gpm4W_numerator_raw}/${gpm4W_denominator_raw} end
    value_format: '#0.00%'
    drill_fields: []
    
  - measure: gpm1WPY
    type: number
    sql: case when ${gpm1WPY_denominator_raw} != 0 then ${gpm1WPY_numerator_raw}/${gpm1WPY_denominator_raw} end
    value_format: '#0.00%'
    drill_fields: []
    
  - measure: gpm4WPY
    type: number
    sql: case when ${gpm4WPY_denominator_raw} != 0 then ${gpm4WPY_numerator_raw}/${gpm4WPY_denominator_raw} end
    value_format: '#0.00%'
    drill_fields: []    

