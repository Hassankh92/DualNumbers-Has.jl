module DualNumbers

export Dual

"""
	Dual: A dual number is sister to complex number
"""
struct Dual{T}
	real::T
	dual::T
end

Base.:+(x::Dual, y::Dual) = Dual(x.real + y.real, x.dual + y.dual)
Base.:-(x::Dual, y::Dual) = Dual(x.real - y.real, x.dual - y.dual)


end # module DualNumbers
