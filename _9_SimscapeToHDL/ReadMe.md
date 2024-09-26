# High Fidelity Electric Drive FPGA-based HIL Simulation
Please see [this in-product example](https://www.mathworks.com/help/hdlcoder/ug/generate-hdl-code-for-simscape-models-using-linearized-switch-approximation.html) for an introduction to this method. This demo project extends the previous example comparing different approaches, and adding further steps for code generation and deployment to complete a full workflow for FPGA-based HIL.

## Important technical background
Until R2023a, there were some features missing in the partitioning solver that makes this workflow useless due to lack of accuracy after converstion to state-space representation and too high consumption of FPGA resources for real customer use cases. Please see [this geck](https://komodo.mathworks.com/main/gecko/view?Record=2738581) for more details.

The solution has followed the Pejovic's method for real-time simulation, which has been extensively used in the industry of power electronics simulation. In R2023b, we are shipping a Simulink library compliant with the Pejovic method and a [PMSM shipping example](https://www.mathworks.com/help/hdlcoder/ug/generate-hdl-code-for-simscape-models-using-linearized-switch-approximation.html), please find more details about the RFA [here](https://confluence.mathworks.com/display/SLE/Pejovic+Replacement). This library however is using simple Simulink and Simscape blocks, and can be exported and used in earlier MATLAB versions, since it implements a modelling technique and not a new product feature.

Pejovic's method replaces the Simscape switches and diodes with a combination of linear Simscape blocks and Simulink switches that will enable a conversion to a LTI (linear time-invariant) model. This method works with any solver, it has been tested with backward Euler and partitioning solver. This sample project features the latter but Pejovic and its implementation library is not restricted to that application and can be used with other converters and network topologies, please see the model `TwoLevelConverterIdealExample_Pejovic` for another simple example.

This project shows the different manual steps for the transformation of a Simscape model to an HDL-optimized Simulink model. In a later MATLAB Release, the Pejovic replacement of switches in a Simscape network may become automated.

See the original Pejovic's [paper](https://ieeexplore.ieee.org/document/318904) for further technical reference.

### Fixed-point optimization
To enable further optimization of timing and resources on FPGA, the model TwoLevelConverterIdealExample_HDL implements a variant using the [Fixed-Point State-Space block](https://www.mathworks.com/help/simulink/slref/fixedpointstatespace.html) with the input data obtained from the Simscape to HDL Workflow Advisor. Using the built-in block simplifies the eventual conversion of the HDL model to fixed-point w.r.t. the HDL subystem automatically built by the advisor.

### Subcycle Averaging
As a proof of concept, the Simscape Pejovic Switch library has been extended with a linear averaged switch subsystem that interpolates linearly between the extreme values feeding the switch block in the standard built-in implementation. The subcycle averaging logic used is optimized for HDL code generation and is therefore suitable for very high frequency switching applications.

## Special Instructions
Please open the live scripts from the shortcut toolstrip or the liveScripts folder for more detailed and step-by-step instructions.

## Recording
Please find a guided introduction recording to this demo [here](./SimscapeToHDL-SpeedUpSim.mp4).

## Contact
Pablo Romero, promero@mathworks.com

## Relevant Industries
All, electrification, power electronics.

## Relevant Products
- Simulink Real-Time
- HDL Coder
- Simscape Electrical
- Speedgoat IO334 HDL Coder Integration Package
