function ee_converter_dcdc_llc_setabstractdetailed(modelname,variantname)
% Code to select variant for electronic switches in ee_converter_dcdc_llc

% Copyright 2015-2024 The MathWorks, Inc.

switch(variantname)
    case 'Abstract'
% if(strcmp(variantname,'Abstract'))
    evalin('base','switchType=2;');
    set_param([modelname '/Bus Voltage'],'ac_voltage','0');
    set_param([modelname '/Bus Voltage'],'ac_shift','0');
    set_param([modelname '/Bus Voltage'],'ac_frequency','0');
%else
    case 'Detailed'
    evalin('base','switchType=1;');
    set_param([modelname '/Bus Voltage'],'ac_voltage','Vbus_ripple');
    set_param([modelname '/Bus Voltage'],'ac_shift','0');
    set_param([modelname '/Bus Voltage'],'ac_frequency','busRippleFrequency');

    case 'Simplified'
    evalin('base','switchType=3;');
    set_param([modelname '/Bus Voltage'],'ac_voltage','0');
    set_param([modelname '/Bus Voltage'],'ac_shift','0');
    set_param([modelname '/Bus Voltage'],'ac_frequency','0');

end

% Trigger update of mask image
set_param([modelname '/High Side'],'Name','High Side');
set_param([modelname '/Low Side'],'Name','Low Side');