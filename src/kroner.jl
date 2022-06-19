export Kroner, kroner, øre

import Base: *, -, +, /, show

"Representation of old British currency system £SD - Pound Shilling Denarius (øre)"            
struct Øre <: Currency
   amount::Int 
end

function Kroner(kroner::Integer, øre::Integer)
    Kroner(kroner) + Øre(øre)
end

Kroner(coins::Integer) = Øre(coins * 10)

function kroner(coins::Øre)
    coins.amount ÷ 10
end

øre(coins::Øre) = coins.amount % 10

const Kr = Kroner(1)

*(coeff::Number, coins::Øre) = Øre(coeff * coins.amount)
*(coins::Øre, coeff::Number) = coeff * coins
/(coins::Øre, denom::Number) = Øre(coins.amount/denom)

+(a::Øre, b::Øre) = Øre(a.amount + b.amount)
-(a::Øre, b::Øre) = Øre(a.amount - b.amount)


function show(io::IO, coins::Øre)
   print(io, kroner(coins), ".", øre(coins), "Kr") 
end
