classdef PWMType < Simulink.IntEnumType
% PWMType - enumeration class used by slexVariantManagement
    
% Copyright 2023-2024 The MathWorks, Inc.
   
    enumeration
        CarrierFreqPWMGen (1)
        CarrierFreqPWMGenHighLowDeadTime (2)
        Def3PhasePWMGen (3)
        Def3PhasePWMGenHighLowDeadTime (4)
        FastSimulinkPWMGen (5)
        FastSimulinkPWMGenHighLowDeadTime (6)
        SubcycleAvg (7)
        Averaging (8)
    end
end