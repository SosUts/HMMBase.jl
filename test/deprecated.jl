using Distributions
using HMMBase
using Random
using Test

Random.seed!(2019)

@testset "< v1.1" begin
    hmm = HMM([0.9 0.1; 0.1 0.9], [Normal(0,1), Normal(10,1)])
    z, y = rand(hmm, 2500, seq = true)
    @test forward(hmm, y, logl = true) == forward(hmm, y, logl = false) == forward(hmm, y)
    @test backward(hmm, y, logl = true) == backward(hmm, y, logl = false) == backward(hmm, y)
    @test posteriors(hmm, y, logl = true) == posteriors(hmm, y, logl = false) == posteriors(hmm, y)
    @test viterbi(hmm, y, logl = false) == viterbi(hmm, y, logl = true) == z
    @test likelihoods(hmm, y) == exp.(loglikelihoods(hmm, y))
    @test likelihoods(hmm, y, logl = true) == loglikelihoods(hmm, y)
end

@testset "< v1.0" begin
    hmm = HMM([0.9 0.1; 0.1 0.9], [Normal(0,1), Normal(10,1)])
    z, y = rand(hmm, 2500, seq = true)
    @test n_parameters(hmm) == nparams(hmm)
    @test log_likelihoods(hmm, y) == loglikelihoods(hmm, y)
    @test forward_backward(hmm, y) == posteriors(hmm, y)
    @test messages_forwards(hmm, y) == forward(hmm, y)
    @test messages_backwards(hmm, y) == backward(hmm, y)
    @test compute_transition_matrix(z) == gettransmat(z, relabel = true)
    @test size(rand_transition_matrix(5, 2.0)) == (5, 5)
end
