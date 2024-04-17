classdef SolverType < Simulink.IntEnumType
% SolverType - enumeration class used by slexVariantManagement
    
% Copyright 2023-2024 The MathWorks, Inc.
   
    enumeration
        odeN (0)
        ode23t (1)
        ode4 (2)
    end
end