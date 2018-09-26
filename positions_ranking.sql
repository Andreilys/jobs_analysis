select 
  case when dense_rank < 8 then position
      else 'Other'
  END AS positions,
  sum(cnt) as total_count
from (
select
  position
  , dense_rank() over(order by cnt desc)
  , cnt
from
  (
    select
      position
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
