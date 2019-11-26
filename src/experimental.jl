# MM <-> HMM

function MixtureModel(hmm::AbstractHMM)
    sdists = statdists(hmm)
    @check length(sdists) == 1
    MixtureModel([hmm.B...], sdists[1])
end

function HMM(m::MixtureModel)
    K = length(m.prior.p)
    a = m.prior.p
    A = repeat(permutedims(m.prior.p), K, 1)
    B = m.components
    HMM(a, A, B)
end

# LogVals
# struct LogLikelihood{T<:Number} <: Number
    # logval::T
# end

# struct BayesianHMM{F,T} <: AbstractHMM{F}
#     a::Vector{T}
#     A::Matrix{T}
#     B::Vector{Distribution{F}}
#     a_prior::Dirichlet
#     A_prior::Vector{Dirichlet}
#     HMM{F,T}(a, A, B) where {F,T} = assert_hmm(a, A, B) && new(a, A, B) 
# end

# Transmats types
# abstract type TransitionMatrix{T} <: AbstractMatrix{T} end

# length(A::TransitionMatrix) = length(A.mat)
# size(A::TransitionMatrix) = size(A.mat)

# struct DenseTransitionMatrix{T} <: TransitionMatrix{T}
#     mat::Matrix{T}
# end

# # copy()

# convert(::Type{Matrix{T}}, A::DenseTransitionMatrix{T}) where T = A.mat

# promote_rule(::Type{DenseTransitionMatrix{T}}, ::Type{Matrix{T}}) where T = Matrix{T}

# function DenseTransitionMatrix(K)

# end

# struct BayesianTransitionMatrix{T} <: TransitionMatrix{T}
#     mat::Matrix{T}
#     prior::Vector{Dirichlet}
# end

# function BayesianTransitionMatrix(K, α = 1.0)
# # TODO
# end

# TODO: Check size A / prior

# TODO
# struct LeftRightTransitionMatrix
# end

# TODO: Constructors, convert, promote, ...
# TODO: Add types parameters on AbstractHMM: support (Discrete/Continuous),
# initial type, transmat type

# MLJ.jl integration
# import MLJBase

# TODO: HMMClassifier with optional sequence ?
# TODO: Semi-supervised with some knowns and some missing
# labels (hidden states)
# TODO: Prior on diag. in transmat rand an in EM.
# TODO: Document fit_mle in EM (that is uses fit_mle
# from Distributions.jl, PDMat.Diag, ... for MvNormal).
# https://github.com/hmmlearn/hmmlearn/commit/c7eac45ec496599c75ab04077370b89a3845b511
# TODO: statdists -> stationnary
# mutable struct HMMCluster
    # K::Int
# 
# end