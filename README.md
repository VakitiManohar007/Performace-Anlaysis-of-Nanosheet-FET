# Performace-Anlaysis-of-Nanosheet-FET
This project focuses on designing and simulating a 3D Ω-shaped silicon nanosheet FET using Sentaurus TCAD. It explores device geometry, doping profiles, gate-stack materials, and electrical characteristics to analyze transistor performance and support advanced semiconductor device optimization.
# 3D Ω-Shaped Nanosheet FET Using Sentaurus TCAD

##  Project Overview

This project focuses on the design and simulation of a three-dimensional Ω-shaped silicon nanosheet Field-Effect Transistor (FET) using Synopsys Sentaurus TCAD. The device structure includes silicon nanosheet channels, a TiN gate electrode, HfO₂ and SiO₂ dielectric regions, Si₃N₄ spacers, and source/drain regions.

The project uses parameterized Scheme scripting to define device geometry, doping profiles, and mesh refinement regions for semiconductor device simulation.

##  Objectives

- Design a 3D Ω-shaped nanosheet FET structure.
- Define device dimensions using parameterized SDE scripting.
- Create source, drain, channel, gate, dielectric, and spacer regions.
- Assign doping profiles to the source, drain, and channel regions.
- Generate a refined mesh for further device simulation.
- Prepare the device structure for electrical characterization using Sentaurus TCAD.

##  Tools and Technologies

- **Synopsys Sentaurus TCAD**
- **Sentaurus Structure Editor (SDE)**
- Scheme scripting
- Semiconductor device modeling and mesh generation

##  Device Structure

The device script defines the following regions:

- **Substrate:** Silicon
- **Source and Drain:** Silicon with phosphorus doping
- **Nanosheet Channels:** Silicon with boron background doping
- **Gate Electrode:** Titanium Nitride (TiN)
- **Gate Dielectrics:** Hafnium Oxide (HfO₂) and Silicon Dioxide (SiO₂)
- **Spacers:** Silicon Nitride (Si₃N₄)

The geometry includes multiple channel regions and associated gate-stack structures.

##  Simulation Workflow

1. Define device dimensions and coordinate parameters.
2. Create the 3D semiconductor and dielectric regions.
3. Define source, drain, and gate contacts.
4. Assign constant doping profiles.
5. Define global and channel-specific mesh refinement windows.
6. Generate the device mesh using the Sentaurus meshing workflow.
7. Use the generated structure for subsequent electrical simulation and characterization.

##  Repository Structure

```text
Nanosheet-FET/
├── README.md
└── nanosheet_fet.scm
```

Additional folders and files can be added as the project develops.

## Expected Analysis

After successful meshing and device simulation, the project can be extended to study:

- Drain current versus gate voltage (Id–Vg)
- Drain current versus drain voltage (Id–Vd)
- Threshold voltage
- Subthreshold behavior
- Influence of device geometry on electrical performance

*Note: These analyses are planned extensions until simulation results have been generated and verified.*

##  Current Status

**Initial SDE script preparation**

The parameterized device geometry, doping definitions, contact definitions, and mesh refinement setup are prepared in the SDE script. Successful geometry construction, mesh generation, and electrical simulation are verified.

##  Author-Vakiti Manohar
Project developed as part of semiconductor device modeling and advanced transistor simulation studies.

