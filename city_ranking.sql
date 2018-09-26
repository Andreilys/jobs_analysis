select 
  case when dense_rank < 8 then state
      else 'Other'
  END AS state,
  sum(cnt) as total_count
from (
select
  state
  , dense_rank() over(order by cnt desc)
  , cnt
from
  (
    select
      state
      , count(*) as cnt
    from
      [datascience_jobs]
    group by
      1
    order by
      2 desc
  )
  t1) t2
group by 1
order by 2 desc
