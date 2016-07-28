- connection: looker_ro

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: dim_compute_period_byperiod

- explore: dim_compute_period_byweek

- explore: dim_entity

- explore: fact_metrics

