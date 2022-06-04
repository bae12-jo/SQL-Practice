// group by
select stock_name, sum(
    case
        when operation = 'buy' then -price
        else price
    end
) as capital_gain_loss
from Stocks
group by stock_name

// over (partition by)
select distinct stock_name, sum(case when operation = 'Buy' then -price else price end) over (partition by stock_name) capital_gain_loss
from stocks
