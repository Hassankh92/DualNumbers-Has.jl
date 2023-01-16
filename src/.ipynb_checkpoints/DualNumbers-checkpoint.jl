module DualNumbers

export Dual

"""
	Dual: A dual number is sister to complex number
"""
struct Dual{T}
	real::T
	dual::T
end

Base.:-(x::Dual) = Dual(-x.real, -x.dual)
Base.:+(x::Dual) = Dual(+x.real, +x.dual)

Base.:+(x::Dual, y::Dual) = Dual(x.real + y.real, x.dual + y.dual)
# Base.:-(x::Dual, y::Dual) = Dual(x.real - y.real, x.dual - y.dual)
Base.:-(x::Dual, y::Dual) = x + -y


#This part is for scalar multiplication of dual numbers

Base.:*(a::Number, x::Dual) = Dual(a*x.real, a*x.dual)
Base.:*(x::Dual, a::Number) = Dual(x.real*a , x.dual*a)




end # module DualNumbers
