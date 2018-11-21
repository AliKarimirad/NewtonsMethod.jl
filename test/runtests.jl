using NewtonsMethod
using Test

@testset "NewtonsMethod.jl" begin
    # test 1: make sure it is working
        g(x)=(x-1)^3
        g_prime(x)=3*(x-1)^2
        iv = 1.1
        sol = newtonroot(g, g_prime, iv)
        @test sol≈ 1.0000001545213348
    # test 2: make sure that the second dispach works well
        solu = newtonroot(g, iv)
    @test solu ≈ 1.0000001545213348

    # test 3: make sure tolerance works
    solu = newtonroot(g, g_prime, iv, tolerance = 1)
    solut= newtonroot(g, iv, tolerance =  1)
    @test !( solu  ≈ 1.0000001545213348)
    @test ( solut ≈ 1.00000013565)

    # test 4: make sure maxiter works
    soluti  = newtonroot(g, g_prime, iv,maxiter= 5 )
    solutio = newtonroot(g, iv, maxiter= 5 )
    @test soluti  == nothing
    @test solutio == nothing
    #test 5: Non-Convergence
    h(x)=x^2+2
    h_prime(x)=2x
    @test newtonroot(h, h_prime, iv)== nothing
    @test newtonroot(h,  iv)== nothing
    #test BiFloat
    iv=BigFloat(3)
    @test newtonroot(g,g_prime, iv)≈ 1.0000001808754536763325638480
    @test newtonroot(g, iv)≈ 1.0000001808754536763325638480

end
