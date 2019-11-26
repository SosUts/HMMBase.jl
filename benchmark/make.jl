using PkgBenchmark
using HMMBase

# TODO: Add timestamp to result files
# TODO: Compare with latest tag
# results = benchmarkpkg(parent(pathof(HMMBase)))
results = benchmarkpkg(pwd(), resultfile = "benchmark.json")
export_markdown("benchmark.md", results)