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


#  Multiplications
#  x = a + epsilon *b
#  y = c + epsilon *c
#  epsilon^2 = 0
#   x * y = a*c + epsilon * (a*d + b*c)

Base.:*{x::Dual, y::Dual} = Dual(x.real * y.real , x.real * y.dual + x.dual * y.real)

#  Conjugate
Base.conj(x::Dual) = Dual(x.real , -x.dual)


# Inverse 
#      1 / (a + epsilon * b)
#   = (a - eps b ) / (a + eps b)(a - eps b)
#   = (a - eps b)  / (a^2) 
#   = (a - eps b)  * (1/a^2) 

Base.inv(x::Dual) = conj(x) * 1/(x.real^2)

# Division

Base.:/(x::Dual,y::Dual) = x * inv(y)







end # module DualNumbers
