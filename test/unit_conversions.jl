@testset "Esat_from_Tair" begin
  Tair = 25.2
  formula=Val(:Sonntag_1990)
  constants=bigleaf_constants()
  eSat = Esat_from_Tair(Tair; formula, constants)
  # regression test
  @test isapprox(eSat, 3.197, atol=1e-3)
end

@testset "Esat_from_Tair_slope" begin
    step = 0.1
    Tair = range(20.0, 22.0, step = step)
    formula=Val(:Sonntag_1990)
    constants=bigleaf_constants()
    Esat = Esat_from_Tair.(Tair)
    delta = Esat_from_Tair_deriv.(Tair)
    delta2 = diff(Esat)/step 
    @test all(isapprox.(delta[2:end] - delta2, 0, atol=1e-3))
end
  

@testset "e_to_rH" begin
  Tair = 25.0
  eSat = Esat_from_Tair(Tair)
  e = range(0,eSat, length = 5)
  vpd = e_to_VPD.(e, Tair)
  @test VPD_to_e.(vpd, Tair) ≈ e
  rH0 = VPD_to_rH.(vpd,Tair)
  @test rH_to_VPD.(rH0, Tair) ≈ vpd
  rH = e_to_rH.(e, Tair)
  @test  rH ≈ rH0
  #
  @test_logs (:warn,"higher than saturation")
    rHOversat = e_to_rH(eSat + 1e-3, Tair)
  @test rHOversat == 1.0
end

@testset "e_to_q" begin
  pressure = 0.1 #kPa
  Tair = 25.0
  eSat = Esat_from_Tair(Tair)
  e = range(0,eSat, length = 5)
  q = e_to_q.(e, pressure)
  @test q_to_e.(q, pressure) ≈ e
  vpd = q_to_VPD.(q, Tair, pressure)
  @test VPD_to_q.(vpd, Tair, pressure) ≈ q
end

@testset "Rg_to_PPFD" begin
  Rg = 500.0
  PPFD = Rg_to_PPFD(Rg)
  @test PPFD_to_Rg(PPFD) ≈ Rg
end

@testset "kg_to_mol" begin
  mass = 10.0
  molarMass = bigleaf_constants()[:H2Omol]
  amountOfSubstance = kg_to_mol(mass, molarMass)
  @test amountOfSubstance == mass/molarMass
end

@testset "umolCO2_to_gC" begin
  CO2_flux = 50.0
  C_flux = umolCO2_to_gC(CO2_flux)
  @test gC_to_umolCO2(C_flux) ≈ CO2_flux
end