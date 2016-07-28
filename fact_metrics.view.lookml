- view: fact_metrics
  sql_table_name: looker_data.fact_metrics
  fields:

  - dimension_group: calendardate
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.calendardate

  - dimension: car_count
    type: number
    sql: ${TABLE}.car_count

  - dimension: car_count_py
    type: number
    sql: ${TABLE}.car_count_py

  - dimension: co_target_aro_max
    type: number
    sql: ${TABLE}.co_target_aro_max

  - dimension: co_target_aro_max_py
    type: number
    sql: ${TABLE}.co_target_aro_max_py

  - dimension: co_target_aro_min
    type: number
    sql: ${TABLE}.co_target_aro_min

  - dimension: co_target_aro_min_py
    type: number
    sql: ${TABLE}.co_target_aro_min_py

  - dimension: co_target_cc_wk
    type: number
    sql: ${TABLE}.co_target_cc_wk

  - dimension: co_target_cc_wk_py
    type: number
    sql: ${TABLE}.co_target_cc_wk_py

  - dimension: co_target_gpm_max
    type: number
    sql: ${TABLE}.co_target_gpm_max

  - dimension: co_target_gpm_max_py
    type: number
    sql: ${TABLE}.co_target_gpm_max_py

  - dimension: co_target_gpm_min
    type: number
    sql: ${TABLE}.co_target_gpm_min

  - dimension: co_target_gpm_min_py
    type: number
    sql: ${TABLE}.co_target_gpm_min_py

  - dimension: co_target_lpm_max
    type: number
    sql: ${TABLE}.co_target_lpm_max

  - dimension: co_target_lpm_max_py
    type: number
    sql: ${TABLE}.co_target_lpm_max_py

  - dimension: co_target_lpm_min
    type: number
    sql: ${TABLE}.co_target_lpm_min

  - dimension: co_target_lpm_min_py
    type: number
    sql: ${TABLE}.co_target_lpm_min_py

  - dimension: co_target_ppm_max
    type: number
    sql: ${TABLE}.co_target_ppm_max

  - dimension: co_target_ppm_max_py
    type: number
    sql: ${TABLE}.co_target_ppm_max_py

  - dimension: co_target_ppm_min
    type: number
    sql: ${TABLE}.co_target_ppm_min

  - dimension: co_target_ppm_min_py
    type: number
    sql: ${TABLE}.co_target_ppm_min_py

  - dimension: co_target_spm_max
    type: number
    sql: ${TABLE}.co_target_spm_max

  - dimension: co_target_spm_max_py
    type: number
    sql: ${TABLE}.co_target_spm_max_py

  - dimension: co_target_spm_min
    type: number
    sql: ${TABLE}.co_target_spm_min

  - dimension: co_target_spm_min_py
    type: number
    sql: ${TABLE}.co_target_spm_min_py

  - dimension: charged_hours
    type: number
    sql: ${TABLE}.charged_hours

  - dimension: charged_hours_py
    type: number
    sql: ${TABLE}.charged_hours_py

  - dimension: discounts
    type: number
    sql: ${TABLE}.discounts

  - dimension: discounts_py
    type: number
    sql: ${TABLE}.discounts_py

  - dimension: entity
    type: string
    sql: ${TABLE}.entity

  - dimension: flag_hours
    type: number
    sql: ${TABLE}.flag_hours

  - dimension: flag_hours_py
    type: number
    sql: ${TABLE}.flag_hours_py

  - dimension: gross_profit
    type: number
    sql: ${TABLE}.gross_profit

  - dimension: gross_profit_py
    type: number
    sql: ${TABLE}.gross_profit_py

  - dimension: labor_cost
    type: number
    sql: ${TABLE}.labor_cost

  - dimension: labor_cost_py
    type: number
    sql: ${TABLE}.labor_cost_py

  - dimension: labor_revenue
    type: number
    sql: ${TABLE}.labor_revenue

  - dimension: labor_revenue_py
    type: number
    sql: ${TABLE}.labor_revenue_py

  - dimension: loss_labor
    type: number
    sql: ${TABLE}.loss_labor

  - dimension: loss_labor_py
    type: number
    sql: ${TABLE}.loss_labor_py

  - dimension: lost_labor_hours
    type: number
    sql: ${TABLE}.lost_labor_hours

  - dimension: lost_labor_hours_py
    type: number
    sql: ${TABLE}.lost_labor_hours_py

  - dimension: non_taxable_fees
    type: number
    sql: ${TABLE}.non_taxable_fees

  - dimension: non_taxable_fees_py
    type: number
    sql: ${TABLE}.non_taxable_fees_py

  - dimension: parts_cost
    type: number
    sql: ${TABLE}.parts_cost

  - dimension: parts_cost_py
    type: number
    sql: ${TABLE}.parts_cost_py

  - dimension: parts_revenue
    type: number
    sql: ${TABLE}.parts_revenue

  - dimension: parts_revenue_py
    type: number
    sql: ${TABLE}.parts_revenue_py

  - dimension: sales_pretax
    type: number
    sql: ${TABLE}.sales_pretax

  - dimension: sales_pretax_py
    type: number
    sql: ${TABLE}.sales_pretax_py

  - dimension: static_labor_rate
    type: number
    sql: ${TABLE}.static_labor_rate

  - dimension: static_labor_rate_py
    type: number
    sql: ${TABLE}.static_labor_rate_py

  - dimension: sublet_cost
    type: number
    sql: ${TABLE}.sublet_cost

  - dimension: sublet_cost_py
    type: number
    sql: ${TABLE}.sublet_cost_py

  - dimension: sublet_revenue
    type: number
    sql: ${TABLE}.sublet_revenue

  - dimension: sublet_revenue_py
    type: number
    sql: ${TABLE}.sublet_revenue_py

  - measure: count
    type: count
    drill_fields: []


