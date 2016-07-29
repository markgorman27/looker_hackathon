- view: dim_compute_period_byweek_wprior
  derived_table:
     sql: |
          select *
            from (
          select cur.computeyear,
                        cur.computeyear_name,
                        cur.fromperiod,
                        cur.toperiod,
                        cur.calendardate,
                        cur.calendardate_name,
                        cur.weekno,
                        cur.weekno_name,
                        cur.computeperiod,
                        pri.computeyear as prior_computeyear,
                        pri.computeyear_name as prior_computeyear_name,
                        pri.fromperiod as prior_fromperiod,
                        pri.toperiod as prior_toperiod,
                        pri.calendardate as prior_calendardate,
                        pri.calendardate_name as prior_calendardate_name,
                        pri.weekno as prior_weekno,
                        pri.weekno_name as prior_weekno_name,
                        row_number() over (partition by cur.computeperiod order by cur.calendardate desc) as topcount
                 from (select *,
                              row_number() over (partition by computeperiod, computeyear, weekno) as rn
                         from looker_data.dim_compute_period_byweek
                        where computeperiod in ('1W', '4W')
                          and calendardate <= current_date) as cur
                 left join (select *,
                                   row_number() over (partition by computeperiod, computeyear, weekno) as rn
                              from looker_data.dim_compute_period_byweek
                             where computeperiod in ('1W', '4W')
                               and calendardate <= current_date) as pri
                    on (    cur.computeyear::integer = pri.computeyear::integer + 1
                        and cur.weekno = pri.weekno
                        and cur.computeperiod = pri.computeperiod
                        and cur.rn = pri.rn )) x
          where topcount <= 91
     sql_trigger_value: SELECT CURRENT_DATE
     indexes: [calendardate, prior_calendardate]

       
  fields:
     - dimension: computeperiod
       type: string
       sql: ${TABLE}.computeperiod
       
     - dimension: computeyear
       type: string
       sql: ${TABLE}.computeyear
       
     - dimension: weekno
       type: string
       sql: ${TABLE}.weekno
       
     - dimension: toperiod
       type: string
       sql: ${TABLE}.toperiod
       
     - dimension: fromperiod
       type: string
       sql: ${TABLE}.fromperiod
       
     - dimension: calendardate
       type: string
       sql: ${TABLE}.calendardate
       
     - dimension: prior_calendardate
       type: string
       sql: ${TABLE}.prior_calendardate
    
