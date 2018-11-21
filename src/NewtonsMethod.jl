module NewtonsMethod

greet() = print("Hello World!")

using LinearAlgebra
function newtonroot(f, f_prime, x_0; tolerance= 1E-7, maxiter= 1000)
    x_old = x_0
    error = Inf
    iter = 1
    while iter <= maxiter && error > tolerance
        x_new = x_old - (f(x_old)/f_prime(x_old))
        error = norm(x_new - x_old)
        x_old = x_new
        iter  = iter+1
    end
    if error > tolerance
        return nothing
    else
    return (x_old)
    end
end


using ForwardDiff

D(f) = x -> ForwardDiff.derivative(f, x)

function newtonroot(f, x_0; tolerance= 1E-7, maxiter= 1000)
    x_old = x_0
    error = Inf
    iter = 1
    f_prime =  D(f)
    while iter <= maxiter && error > tolerance
        x_new = x_old - (f(x_old)/f_prime(x_old))
        error = norm(x_new - x_old)
        x_old = x_new
        iter  = iter+1
    end
    if error > tolerance
    return nothing
    else
    return (x_old)
    end
end

export newtonroot
end # module
