classdef makehdlTests < matlab.unittest.TestCase

    properties (TestParameter)
        hdlModel = {'m02_PMSM_HDL','m02_PMSM_HDL'};
        sampleTime = {2.5e-6, 2.5e-7};
        avgFactor = {1, 10};
        oversampling = {400,40};
    end

    methods (TestClassSetup)
        % Disable some warnings for CI tests
        function disableWarnings(testCase)
            testCase.applyFixture(matlab.unittest.fixtures.SuppressedWarningsFixture('SimulinkFixedPoint:util:fxpParameterPrecisionLoss'));
            testCase.applyFixture(matlab.unittest.fixtures.SuppressedWarningsFixture('Simulink:Engine:SaveWithDisabledLinks_Warning'));
        end

    end

    methods (Test, ParameterCombination='sequential')
        % Test methods
        function makehdl(testCase, hdlModel, sampleTime, avgFactor, oversampling)
            load_system(hdlModel);

            hdlset_param(hdlModel,'Oversampling',oversampling);

            % Must assign new variables after running model callbacks
            assignin("base",'Ts',sampleTime);
            assignin("base",'avgFactor',avgFactor);

            %testCase.verifyWarningFree(@() makehdl([hdlModel,'/FPGA Model']));
            makehdl([hdlModel,'/FPGA Model']);
            bdclose(hdlModel);
        end
    end

end
