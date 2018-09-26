select
  lat
  , long
from
  [datascience_jobs]
  join [zipcode_state] on
    zipcode = zip_code
where
  zip_code is not null
