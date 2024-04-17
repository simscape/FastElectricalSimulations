classdef slrtBuildTests < matlab.unittest.TestCase

    properties (TestParameter)
        model = {'m03_PMSM_SLRT_PCI'};
    end

    methods (TestClassSetup)
        % Add Speedgoat IO Blockset to MATLAB path if not installed locally yet
        function setSpeedgoatIOPath(testCase)
            if ~exist('speedgoat','file')
                % See https://confluence.mathworks.com/display/SLRT/Use+Speedgoat+Library+in+Sandbox
                slrealtimetest.utils.sgLibUtils.addPathInTest(testCase);
                slrealtimetest.utils.sgLibUtils.addPathAddOn('IO334')
            end
        end
    end

    methods (Test)
        % Test methods
        function slrtBuild(~, model)
            slbuild(model);
        end
    end

end