function fixSampleTimeBlocks(sysPath,sampleTime)

arguments
    sysPath {mustBeTextScalar}
    sampleTime = -1
end

constBlocks = Simulink.findBlocksOfType(sysPath,'Constant');
arrayfun(@(block) set_param(block,'SampleTime',num2str(sampleTime)), constBlocks);

otherBlocks = Simulink.findBlocksOfType(sysPath,'Sum');
otherBlocks = [otherBlocks; Simulink.findBlocksOfType(sysPath,'Gain')];
otherBlocks = [otherBlocks; Simulink.findBlocksOfType(sysPath,'UnaryMinus')];
otherBlocks = [otherBlocks; Simulink.findBlocksOfType(sysPath,'Product')];
otherBlocks = [otherBlocks; Simulink.findBlocksOfType(sysPath,'Selector')];
otherBlocks = [otherBlocks; Simulink.findBlocksOfType(sysPath,'Inport')];
otherBlocks = [otherBlocks; Simulink.findBlocksOfType(sysPath,'Outport')];
otherBlocks = [otherBlocks; Simulink.findBlocksOfType(sysPath,'Trigonometry')];
arrayfun(@(block) set_param(block,'SampleTime','-1'), otherBlocks);

end