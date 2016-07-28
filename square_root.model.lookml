- connection: looker_ro

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: fact_metrics
  joins:
    - join: dim_entity
      sql_on: ${fact_metrics.entity} = ${dim_entity.entity}
      relationship: many_to_one
    - join: dim_compute_period_byperiod
      sql_on: ${fact_metrics.calendardate} = ${dim_compute_period_byperiod.calendardate}
      relationship: many_to_one
    - join: dim_compute_period_byweek
      sql_on: ${fact_metrics.calendardate} = ${dim_compute_period_byweek.calendardate}
      relationship: many_to_one
      type: inner
    - join: dim_compute_period_byweek_wprior
      sql_on: (${fact_metrics.calendardate} = ${dim_compute_period_byweek_wprior.calendardate} or ${fact_metrics.calendardate} = ${dim_compute_period_byweek_wprior.prior_calendardate})
      relationship: many_to_one
      type: left_outer

