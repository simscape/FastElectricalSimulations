function [hTime,hTimeFast,hPhasor] = setup_figure_local(simlog_time,simlog_timeFast,simlog_phasor,type)
% Copyright 2023-2024 The MathWorks, Inc.

% This function creates the figure and sets up the axes.    
    switch(type)
        case 'dc'
            figure;
            subplot1=subplot(2,1,1);
            grid(subplot1,'on'); hold(subplot1,'on');
            ylabel(subplot1,'Terminal voltage (per-unit)')
            ylim(subplot1,[0.99,1.01]);
            subplot2=subplot(2,1,2);
            grid(subplot2,'on'); hold(subplot2,'on');
            xlabel(subplot2,'Time (s)')
            ylabel(subplot2,'Rotor velocity (per-unit)')

            hTime=generate_dc_plot(simlog_time,'Time');
            hTimeFast=generate_dc_plot(simlog_timeFast,'TimeFast');
            hPhasor=generate_dc_plot(simlog_phasor,'Phasor');
        case 'ac'
            figure;
            ax=axes; grid(ax,'on'); hold(ax,'on');
            xlabel(ax,'Time (s)')
            ylabel(ax,'{\it a}-phase voltage (V)','Interpreter','tex')
            xlim(ax,[1,1.1]);
            xticks(ax,[1:0.02:1.1]);

            hTime=generate_ac_plot(simlog_time,'Time');
            hTimeFast=generate_ac_plot(simlog_timeFast,'TimeFast');
            hPhasor=generate_ac_plot(simlog_phasor,'Phasor');
    end 
    
end

function hLine=generate_dc_plot(simlog,name)
    % This function creates the plot from the simlog.
    t = simlog.AVR_and_Exciter.Terminal_Voltage_Measurement.pu_output.series.time;
    pu_Vt = simlog.AVR_and_Exciter.Terminal_Voltage_Measurement.pu_output.series.values;
    pu_w = simlog.Governor_and_Prime_Mover.Rotor_Velocity_Measurement.pu_output.series.values;
    
    if(strcmp(name,'Time'))
        color='black';
        marker='o';
    elseif(strcmp(name,'TimeFast'))
        color='blue';
        marker='+';
    else
        color='red';
        marker='*';
    end
    subplot1=subplot(2,1,1);
    subplot2=subplot(2,1,2);
    plot(subplot1,t,pu_Vt,'-','Color',color);
    plot(subplot2,t,pu_w,'-','Color',color);
    delim=50;
    plot(subplot1,t(1:delim:end),pu_Vt(1:delim:end),marker,'Color',color);
    hLine=plot(subplot2,t(1:delim:end),pu_w(1:delim:end),marker,'Color',color);
end

function hLine=generate_ac_plot(simlog,name)
    % This function creates the plot from the simlog.
    t = simlog.Synchronous_Machine_Round_Rotor_standard.V.series.time;
    vabc = simlog.Synchronous_Machine_Round_Rotor_standard.V.series.values;
    va = vabc(1:3:end);
    
    if(strcmp(name,'Time'))
        color='black';
        marker='-o';
    elseif(strcmp(name,'TimeFast'))
        color='blue';
        marker='--+';
    else
        color='red';
        marker='--*';
    end
    hLine=plot(t,va,marker,'Color',color);
end