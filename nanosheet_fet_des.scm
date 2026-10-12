File {
Grid = "@tdr@"
Plot = "@tdrdat@"
Parameter= "sdevice.par"
Current = "@plot@"
Output = "@log@" }

Electrode {
{ Name="S" Voltage=0.0  }
{ Name="D" Voltage=0.0  }
{ Name="G" Voltage=0.0 }
 }

* DriftDiffusion  

Thermode {
{ Name = "G" Temperature = 300}
{ Name = "D" Temperature = 300 }
{ Name = "S" Temperature = 300 }
}

Physics(Material="TiN")
{
  * Start with 4.46, run it, and see which way the curve needs to shift!
  MetalWorkFunction(WorkFunction=4.49)
}

Physics{
  Fermi                     * FIXED: Required for accurate Vt
  eQuantumPotential         * FIXED: Required because it's in the Solve block!
  
  Mobility(
    PhuMob
    DopingDep
    Enormal                 * FIXED: Crucial for matching ON-current (surface scattering)
    HighFieldSaturation(GradQuasiFermi)
  )

  EffectiveIntrinsicDensity( BandGapNarrowing(OldSlotboom) )

  Recombination(
    SRH(DopingDependence TempDependence)
    Auger
  )
}

Physics(Material="Silicon"){
 Mobility(
  HighFieldSaturation(EparallelToInterface)
 )
 Recombination(
  SRH(DopingDependence TempDependence)
  Auger
 )
}

Math {
   Extrapolate     Iterations=50     Notdamped =100
   * Lowered ErRef slightly to 1.e10 to ensure a smoother, more accurate current curve
   RelErrControl     ErRef(Electron)=1.e10   ErRef(Hole)=1.e10 
   -CheckUndefinedModels
}

Plot{
*--Density and Currents, etc
   eDensity hDensity   TotalCurrent/Vector eCurrent/Vector hCurrent/Vector
   eMobility hMobility   eVelocity hVelocity ElectricField Potential SpaceCharge
   eQuasiFermi hQuasiFermi

*--Temperature
   eTemperature Temperature hTemperature

*--Fields and charges
   ElectricField/Vector Potential SpaceCharge

*--Doping Profiles
   Doping DonorConcentration AcceptorConcentration

*--Band structure/Composition
   BandGap    BandGapNarrowing   Affinity
   ConductionBand ValenceBand
   eQuantumPotential hQuantumPotential
}

Solve {
Poisson
Coupled { Poisson eQuantumPotential hQuantumPotential }

##############################################
* Drain Bias Step
Quasistationary
(InitialStep=0.01 Maxstep=0.01 MinStep=1e-5
Goal { name="D" voltage = 0.7 }
)
{ Coupled { Poisson Electron Hole eQuantumPotential hQuantumPotential} }
Save (FilePrefix="IdVd")

##############################################
* Gate Sweep Step
Load(FilePrefix="IdVd")
NewCurrentPrefix="IdVg_"
Quasistationary
(InitialStep=0.01 Maxstep=0.01 MinStep=1e-5
Goal{ name="G" voltage= 0.75 }
){ Coupled {Poisson Electron Hole eQuantumPotential hQuantumPotential}
CurrentPlot (time=(range = (0 1) intervals=20))}
}