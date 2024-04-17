classdef liveScriptTests < matlab.unittest.TestCase

    properties (TestParameter)
        liveScript = {'PMSM_Inverter_Guide','Subcycle_Average_Guide'};
    end

    methods (TestClassSetup)
        % Disable some warnings for CI tests
        function disableWarnings(testCase)
            testCase.applyFixture(matlab.unittest.fixtures.SuppressedWarningsFixture('SimulinkFixedPoint:util:fxpParameterPrecisionLoss'));
            testCase.applyFixture(matlab.unittest.fixtures.SuppressedWarningsFixture('Simulink:Engine:SaveWithDisabledLinks_Warning'));
        end

    end

    methods (Test)
        % Test methods
        function runScript(testCase, liveScript)
            run(liveScript);
            bdclose all;
            close all;
        end
    end

end