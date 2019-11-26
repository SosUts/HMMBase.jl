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
