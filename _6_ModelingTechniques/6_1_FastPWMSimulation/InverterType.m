classdef InverterType < Simulink.IntEnumType
% InverterType - enumeration class used by slexVariantManagement
    
% Copyright 2023-2024 The MathWorks, Inc.
   
    enumeration
        Ideal (0)
        MOSFET (1)
        Average (2)
    end
end