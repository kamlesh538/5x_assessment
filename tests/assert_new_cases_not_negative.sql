select date, sum(new_cases) as total_new_cases
from {{ ref('daily_cases') }}
group by date
having total_new_cases<0