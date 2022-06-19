module Coins

abstract type Currency end

include("british.jl")
include("norskedaler.jl")
include("kroner.jl")
include("conversions.jl")
end # module
