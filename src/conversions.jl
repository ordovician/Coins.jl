# Not all of these conversion will be accurate. I am rounding the numbers
# to keep integers. A possible solution is to store coins as fractions
Kroner(coins::Skilling) = 4*speciedaler(coins)
Speciedaler(coins::Øre) = kroner(coins) / 4

function Pounds(coins::Skilling)
    Pennies(round(Int, coins.amount * 109//240))
end

function Speciedaler(coins::Pennies)
    Skilling(round(Int, coins.amount * 240//109))
end