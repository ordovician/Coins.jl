export Pounds, Shillings, Pennies, pounds, shillings, pennies, £

import Base: *, -, +, /, show

"Representation of old British currency system £SD - Pound Shilling Denarius (pennies)"            
struct Pennies <: Currency
   amount::Int 
end

function Pounds(l::Integer, s::Integer, d::Integer = 0)
    Pounds(l) + Shillings(s) + Pennies(d)
end

Pounds(coins::Integer) = Pennies(coins * 20 * 12)
Shillings(coins::Integer) = Pennies(coins * 12)

function pounds(coins::Pennies)
    shillings = coins.amount ÷ 12
    shillings ÷ 20
end

function shillings(coins::Pennies)
    shillings = coins.amount ÷ 12
    shillings % 20
end

pennies(coins::Pennies) = coins.amount % 12

const £ = Pounds(1)

*(coeff::Number, coins::Pennies) = Pennies(coeff * coins.amount)
*(coins::Pennies, coeff::Number) = coeff * coins
/(coins::Pennies, denom::Number) = Pennies(coins.amount/denom)

+(a::Pennies, b::Pennies) = Pennies(a.amount + b.amount)
-(a::Pennies, b::Pennies) = Pennies(a.amount - b.amount)


function show(io::IO, p::Pennies)
   print(io, pounds(p), "£ ", shillings(p), "s ", pennies(p), "d")
end
