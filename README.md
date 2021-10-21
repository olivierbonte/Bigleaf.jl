# bigleaf

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://bgctw.github.io/bigleaf.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://bgctw.github.io/bigleaf.jl/dev)
[![Build Status](https://github.com/bgctw/bigleaf.jl/workflows/CI/badge.svg)](https://github.com/bgctw/bigleaf.jl/actions)
[![Coverage](https://codecov.io/gh/bgctw/bigleaf.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/bgctw/bigleaf.jl)


**bigleaf.jl** is a partial Julia port of Jürgen Knauer's 
[**bigleaf** R package](https://bitbucket.org/juergenknauer/bigleaf) 
for the calculation of physical (e.g. aerodynamic conductance, surface temperature) 
and physiological (e.g. canopy conductance, water-use efficiency) ecosystem properties 
from eddy covariance data and accompanying meteorological measurements. 
All calculations are based on a 'big-leaf' representation of the vegetation and 
return representative bulk ecosystem/canopy variables.


## Citation
Knauer J, El-Madany TS, Zaehle S, Migliavacca M (2018) Bigleaf—An R package for the calculation of physical and physiological ecosystem properties from eddy covariance data.
PLoS ONE 13(8): e0201114. [https://doi.org/10.1371/journal.pone.0201114](https://doi.org/10.1371/journal.pone.0201114)


## Installation and Loading

The `bigleaf.jl` R package can be installed with the usual command once:

```julia
using Pkg
Pkg.add(bigleaf)
```

And then importet to the every Julia session by:
```julia
using bigleaf
```

## Usage
See the [Documentation](https://bgctw.github.io/bigleaf.jl/dev/) 
that includes a [walkthrough](https://bgctw.github.io/bigleaf.jl/dev/walkthrough/).

[Please report bugs or issues here](https://github.com/bgctw/bigleaf.jl/issues)

## Package content 
We are porting functionality of the [R package](https://bitbucket.org/juergenknauer/bigleaf) as needed. Please
file an [issue](https://github.com/bgctw/bigleaf.jl/issues) if you need a specific feature.

At the current state we ported
- Meteorological variables
- Unit conversions

Upcoming:
- Computation of potential radiation

