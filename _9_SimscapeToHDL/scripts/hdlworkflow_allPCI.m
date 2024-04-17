%--------------------------------------------------------------------------
% HDL Workflow Script
% Generated with MATLAB 9.14 (R2023a) at 08:08:00 on 29/05/2023
% This script was generated using the following parameter values:
%     Filename  : 'C:\Users\promero\git_work\Demos\Simscape_PMSM_FPGA_HIL_Demo\scripts\hdlworkflow_allPCI.m'
%     Overwrite : true
%     Comments  : true
%     Headers   : true
%     DUT       : 'm02_PMSM_HDL/FPGA Model'
% To view changes after modifying the workflow, run the following command:
% >> hWC.export('DUT','m02_PMSM_HDL/FPGA Model');
%--------------------------------------------------------------------------

%% Load the Model
load_system('m02_PMSM_HDL');

%% Restore the Model to default HDL parameters
%hdlrestoreparams('m02_PMSM_HDL/FPGA Model');

%% Model HDL Parameters
%% Set Model 'm02_PMSM_HDL' HDL parameters
hdlset_param('m02_PMSM_HDL', 'CriticalPathEstimation', 'on');
hdlset_param('m02_PMSM_HDL', 'EDAScriptGeneration', 'off');
hdlset_param('m02_PMSM_HDL', 'FPToleranceValue', 1.000000e-03);
fpconfig = hdlcoder.createFloatingPointTargetConfig('NATIVEFLOATINGPOINT' ...
, 'LatencyStrategy', 'Min' ...
);
hdlset_param('m02_PMSM_HDL', 'FloatingPointTargetConfiguration', fpconfig);
hdlset_param('m02_PMSM_HDL', 'GenerateHDLTestBench', 'off');
hdlset_param('m02_PMSM_HDL', 'HDLSubsystem', 'm02_PMSM_HDL/FPGA Model');
hdlset_param('m02_PMSM_HDL', 'MaskParameterAsGeneric', 'on');
hdlset_param('m02_PMSM_HDL', 'OptimizationReport', 'on');
hdlset_param('m02_PMSM_HDL', 'Oversampling', 400);
hdlset_param('m02_PMSM_HDL', 'ReferenceDesign', 'Speedgoat IO334-325k');
hdlset_param('m02_PMSM_HDL', 'ReferenceDesignParameter', {'PCIe_Link_Width','X4','timingSeverity','error','RearPlugin','-21','AuroraMode','None','AuroraCrc','true','AuroraByteswap','true','HDLVerifierAXI','off','HDLVerifierFDC','JTAG'});
hdlset_param('m02_PMSM_HDL', 'ResetType', 'Synchronous');
hdlset_param('m02_PMSM_HDL', 'ResourceReport', 'on');
hdlset_param('m02_PMSM_HDL', 'ScalarizePorts', 'DUTLevel');
hdlset_param('m02_PMSM_HDL', 'SynthesisTool', 'Xilinx Vivado');
hdlset_param('m02_PMSM_HDL', 'SynthesisToolChipFamily', 'Kintex7');
hdlset_param('m02_PMSM_HDL', 'SynthesisToolDeviceName', 'xc7k325t');
hdlset_param('m02_PMSM_HDL', 'SynthesisToolPackageName', 'fbg676');
hdlset_param('m02_PMSM_HDL', 'SynthesisToolSpeedValue', '-2');
hdlset_param('m02_PMSM_HDL', 'TargetDirectory', 'hdl_prj\hdlsrc');
hdlset_param('m02_PMSM_HDL', 'TargetFrequency', 160);
hdlset_param('m02_PMSM_HDL', 'TargetPlatform', 'Speedgoat IO334-325k');
hdlset_param('m02_PMSM_HDL', 'UseFloatingPoint', 'on');
hdlset_param('m02_PMSM_HDL', 'Workflow', 'Simulink Real-Time FPGA I/O');

% Set SubSystem HDL parameters
hdlset_param('m02_PMSM_HDL/FPGA Model', 'AXI4SlaveIDWidth', '14');
hdlset_param('m02_PMSM_HDL/FPGA Model', 'ProcessorFPGASynchronization', 'Free running');

% Set Inport HDL parameters
hdlset_param('m02_PMSM_HDL/FPGA Model/TgabcON', 'IOInterface', 'PCIe Interface');
hdlset_param('m02_PMSM_HDL/FPGA Model/TgabcON', 'IOInterfaceMapping', 'x"100"');

% Set Inport HDL parameters
hdlset_param('m02_PMSM_HDL/FPGA Model/TgabcOFF', 'IOInterface', 'PCIe Interface');
hdlset_param('m02_PMSM_HDL/FPGA Model/TgabcOFF', 'IOInterfaceMapping', 'x"120"');

% Set Inport HDL parameters
hdlset_param('m02_PMSM_HDL/FPGA Model/PWM Enable', 'IOInterface', 'PCIe Interface');
hdlset_param('m02_PMSM_HDL/FPGA Model/PWM Enable', 'IOInterfaceMapping', 'x"114"');

% Set Inport HDL parameters
hdlset_param('m02_PMSM_HDL/FPGA Model/FPGAtoCPUratio', 'IOInterface', 'PCIe Interface');
hdlset_param('m02_PMSM_HDL/FPGA Model/FPGAtoCPUratio', 'IOInterfaceMapping', 'x"138"');
hdlset_param('m02_PMSM_HDL/FPGA Model/FPGAtoCPUratio', 'IOInterfaceOptions', {'RegisterInitialValue','100','EnableReadback','inherit'});

% Set Outport HDL parameters
hdlset_param('m02_PMSM_HDL/FPGA Model/thetaMotor', 'IOInterface', 'PCIe Interface');
hdlset_param('m02_PMSM_HDL/FPGA Model/thetaMotor', 'IOInterfaceMapping', 'x"118"');

% Set Outport HDL parameters
hdlset_param('m02_PMSM_HDL/FPGA Model/omegaMotor', 'IOInterface', 'PCIe Interface');
hdlset_param('m02_PMSM_HDL/FPGA Model/omegaMotor', 'IOInterfaceMapping', 'x"11C"');

% Set Outport HDL parameters
hdlset_param('m02_PMSM_HDL/FPGA Model/trqMotor', 'IOInterface', 'PCIe Interface');
hdlset_param('m02_PMSM_HDL/FPGA Model/trqMotor', 'IOInterfaceMapping', 'x"134"');

% Set Outport HDL parameters
hdlset_param('m02_PMSM_HDL/FPGA Model/Iabc', 'IOInterface', 'PCIe Interface');
hdlset_param('m02_PMSM_HDL/FPGA Model/Iabc', 'IOInterfaceMapping', 'x"140"');

% Set Outport HDL parameters
hdlset_param('m02_PMSM_HDL/FPGA Model/INTA', 'IOInterface', 'Interrupt');
hdlset_param('m02_PMSM_HDL/FPGA Model/INTA', 'IOInterfaceMapping', '[0]');


%% Workflow Configuration Settings
% Construct the Workflow Configuration Object with default settings
hWC = hdlcoder.WorkflowConfig('SynthesisTool','Xilinx Vivado','TargetWorkflow','Simulink Real-Time FPGA I/O');

% Specify the top level project directory
hWC.ProjectFolder = 'hdl_prj';
hWC.ReferenceDesignToolVersion = '2022.1';
hWC.IgnoreToolVersionMismatch = false;

% Set Workflow tasks to run
hWC.RunTaskGenerateRTLCodeAndIPCore = true;
hWC.RunTaskCreateProject = true;
hWC.RunTaskBuildFPGABitstream = true;
hWC.RunTaskGenerateSimulinkRealTimeInterface = true;

% Set properties related to 'RunTaskGenerateRTLCodeAndIPCore' Task
hWC.IPCoreRepository = '';
hWC.GenerateIPCoreReport = true;

% Set properties related to 'RunTaskCreateProject' Task
hWC.Objective = hdlcoder.Objective.None;
hWC.AdditionalProjectCreationTclFiles = '';
hWC.EnableIPCaching = true;

% Set properties related to 'RunTaskBuildFPGABitstream' Task
hWC.RunExternalBuild = false;
hWC.EnableDesignCheckpoint = false;
hWC.TclFileForSynthesisBuild = hdlcoder.BuildOption.Default;
hWC.CustomBuildTclFile = '';
hWC.DefaultCheckpointFile = 'Default';
hWC.RoutedDesignCheckpointFilePath = '';
hWC.MaxNumOfCoresForBuild = '';

% Validate the Workflow Configuration Object
hWC.validate;

%% Run the workflow
hdlcoder.runWorkflow('m02_PMSM_HDL/FPGA Model', hWC);
