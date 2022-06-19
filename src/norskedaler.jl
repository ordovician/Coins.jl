# 1 speciedaler = 5 ort à 24 skilling = 120 skilling [= 4 kroner], 9 1/4
# speciedaler per mark fine silver.
# Price calculator and units: www.norges-bank.no/en/topics/Statistics/Price-calculator-/Units-of-account-in-Norway-from-1514/
export Speciedaler, Ort, Skilling, speciedaler, ort, skilling, Spd, ß

import Base: *, -, +, /, show

"Representation of old Norwegian money from 1816 to 1874"            
struct Skilling <: Currency
   amount::Int 
end

function Speciedaler(spesidaler::Integer, ort::Integer, skilling::Integer =  0)
    Speciedaler(spesidaler) + Ort(ort) + Skilling(skilling)
end

Speciedaler(coins::Integer) = Skilling(coins * 5 * 24)
Ort(coins::Integer) = Skilling(coins * 24)

function speciedaler(coins::Skilling)
    ort = coins.amount ÷ 24
    ort ÷ 5
end

function ort(coins::Skilling)
    ort = coins.amount ÷ 24
    ort % 5
end

skilling(coins::Skilling) = coins.amount % 24

const Spd = Speciedaler(1)
const ß = Skilling(1)

*(coeff::Number, skilling::Skilling) = Skilling(coeff * skilling.amount)
*(coins::Skilling, coeff::Number) = coeff * coins
/(coins::Skilling, denom::Number) = Skilling(coins.amount/denom)

+(a::Skilling, b::Skilling) = Skilling(a.amount + b.amount)
-(a::Skilling, b::Skilling) = Skilling(a.amount - b.amount)


function show(io::IO, sk::Skilling)
   print(io, speciedaler(sk), "Spd ", ort(sk), "Pf ", skilling(sk), "ß") 
end
