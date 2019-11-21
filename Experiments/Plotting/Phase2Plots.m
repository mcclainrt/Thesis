% close all

%% Absolute Error vs. known dist plots all deisgns (PVT Error)

%% PVT Error for all RAW

EXPname = fieldnames(Data);

for k = 1:numel(EXPname)
    if contains(EXPname{k},'Ex2') | contains(EXPname{k},'Ex3')
              
        switch EXPname{k}
            case 'Ex2'
                EXPtype = ' In Air, Ambient';
            case 'Ex3'
                EXPtype = ' In Air, Dark';
            case 'Ex5'
                EXPtype = ' In Water, Ambient';
            case 'Ex6'
                EXPtype = ' In Water, Dark';
        end
        
        AFMname = fieldnames(Data.(EXPname{k}).Filtered);
        
        figure
        hold on
        for m = 1:numel(AFMname)
            switch AFMname{m}
                case 'P'
                    TagType = 'Paper Tag';
                    ID = 'Tag_5';
                case 'V1'
                    if EXPname{k} == 'Ex2' | EXPname{k} == 'Ex5' 
                        TagType = 'AFM';
                    else
                        TagType = 'AFM-1';
                    end
                    ID = 'Tag_7';
                case 'V2'
                    TagType = 'AFM-2';
                    ID = 'Tag_7';
                case 'T'
                    TagType = 'Tablet';
                    ID = 'Tag_5';
            end
            
            try
                plot(Data.(EXPname{k}).Filtered.(AFMname{m}).Test1.(ID)(:,1),Data.(EXPname{k}).Filtered.(AFMname{m}).Test1.(ID)(:,10),'*','DisplayName',[TagType ' Detections'])
            catch
                warning(['No Detection at ', EXPname{k}, ', ', AFMname{m}, ', Test1']);
                continue
            end
        end

        gcf();
        legend('Location','NW')
        Tsave = ['Measured Distance vs Known Distance with False Positives' EXPtype];
        %%title({'Measured Distance vs Known Distance with False Positives'; EXPtype})
        xlabel('Known Distance (m)')
        ylabel('Distance Error(m)')
        grid on
        hold off
        % Set the background color to white
        plotnorm()
        fprintf('PVTerror_%s_Test1 = %s \n',EXPname{k},Tsave)
        if exportfigs == 1
            eval(sprintf('export_fig PVTerror_%s_Test1 -png -r300 -painters',EXPname{k}))
        end
    else
        continue
    end
end


%% PVT Error for all, smoothed

for k = 1:numel(EXPname)
    if contains(EXPname{k},'Ex2') | contains(EXPname{k},'Ex3')
    
        switch EXPname{k}
            case 'Ex2'
                EXPtype = ' In Air, Ambient';
            case 'Ex3'
                EXPtype = ' In Air, Dark';
            case 'Ex5'
                EXPtype = ' In Water, Ambient';
            case 'Ex6'
                EXPtype = ' In Water, Dark';
        end
        
        AFMname = fieldnames(Data.(EXPname{k}).Smoothed);
        
        figure
        hold on
        for m = 1:numel(AFMname)
            switch AFMname{m}
                case 'P'
                    TagType = 'Paper Tag';
                    ID = 'Tag_5';
                case 'V1'
                    if EXPname{k} == 'Ex2' | EXPname{k} == 'Ex5' 
                        TagType = 'AFM';
                    else
                        TagType = 'AFM-1';
                    end
                    ID = 'Tag_7';
                case 'V2'
                    TagType = 'AFM-2';
                    ID = 'Tag_7';
                case 'T'
                    TagType = 'Tablet';
                    ID = 'Tag_5';
            end
            try
                plot(Data.(EXPname{k}).Smoothed.(AFMname{m}).Test1.(ID)(:,1),Data.(EXPname{k}).Smoothed.(AFMname{m}).Test1.(ID)(:,10),'*','DisplayName',[TagType ' Detections'])
            catch
                warning(['No Detection at ', EXPname{k}, ', ', AFMname{m}, ', Test1']);
                continue
            end
        end

        gcf();
        legend('Location','NW')
        Tsave = ['Measured Distance vs Known Distance without False Positives' EXPtype];
        %%title({'Measured Distance vs Known Distance without False Positives'; EXPtype})
        xlabel('Known Distance (m)')
        ylabel('Distance Error (m)')
        grid on
        hold off
        % Set the background color to white
        plotnorm()
        fprintf('PVTerror_%s_Test1S = %s \n',EXPname{k},Tsave)
        if exportfigs == 1
        eval(sprintf('export_fig PVTerror_%s_Test1S -png -r300 -painters',EXPname{k}))
        end
    else
        continue
    end
end

%% Measured Angle vs. known angle plots all deisgns (PVT)

EXPname = fieldnames(Data);

for k = 1:numel(EXPname)
    if contains(EXPname{k},'Ex2') | contains(EXPname{k},'Ex3')
               
        switch EXPname{k}
            case 'Ex2'
                EXPtype = ' In Air, Ambient';
            case 'Ex3'
                EXPtype = ' In Air, Dark';
            case 'Ex5'
                EXPtype = ' In Water, Ambient';
            case 'Ex6'
                EXPtype = ' In Water, Dark';
        end
        
        AFMname = fieldnames(Data.(EXPname{k}).Filtered);

        figure
        hold on
       
        for m = 1:numel(AFMname)
            switch AFMname{m}
                case 'P'
                    TagType = 'Paper Tag';
                    ID = 'Tag_5';
                case 'V1'
                    TagType = 'AFM-1';
                    ID = 'Tag_7';
                case 'V2'
                    TagType = 'AFM-2';
                    ID = 'Tag_7';
                case 'T'
                    TagType = 'Tablet';
                    ID = 'Tag_5';
            end
            try
                plot(Data.(EXPname{k}).Filtered.(AFMname{m}).Test2.(ID)(:,1),180-abs(Data.(EXPname{k}).Filtered.(AFMname{m}).Test2.(ID)(:,7)),'*','DisplayName',[TagType ' Detections'])
            catch
                warning(['No Detection at ', EXPname{k}, ', ', AFMname{m}, ', Test2']);
                continue
            end
        end            

        gcf();
        legend('Location','NW')
        Tsave = ['Measured Angle vs Known Angle with False Positives' EXPtype];
        %title({'Measured Angle vs Known Angle with False Positives'; ['At 2 Meters,' EXPtype]})
        xlabel('Known Angle (deg)')
        ylabel('Measured Angle (deg)')
        grid on
        hold off
        % Set the background color to white
        plotnorm()
        fprintf('PVT_%s_Test2 = %s \n',EXPname{k},Tsave)
        if exportfigs == 1
        eval(sprintf('export_fig PVT_%s_Test2 -png -r300 -painters',EXPname{k}))
        end
        
        figure
        hold on            
        for m = 1:numel(AFMname)
            switch AFMname{m}
                case 'P'
                    TagType = 'Paper Tag';
                    ID = 'Tag_5';
                case 'V1'
                    if EXPname{k} == 'Ex2' | EXPname{k} == 'Ex5' 
                        TagType = 'AFM';
                    else
                        TagType = 'AFM-1';
                    end
                    ID = 'Tag_7';
                case 'V2'
                    TagType = 'AFM-2';
                    ID = 'Tag_7';
                case 'T'
                    TagType = 'Tablet';
                    ID = 'Tag_5';
            end

            
            try
                plot(Data.(EXPname{k}).Filtered.(AFMname{m}).Test3.(ID)(:,1),180-abs(Data.(EXPname{k}).Filtered.(AFMname{m}).Test3.(ID)(:,7)),'*','DisplayName',[TagType ' Detections'])
            catch
                warning(['No Detection at ', EXPname{k}, ', ', AFMname{m}, ', Test3']);
                continue
            end
        
        end

        gcf();
        legend('Location','NW')
        Tsave = ['Measured Angle vs Known Angle with False Positives' EXPtype];
        %title({'Measured Angle vs Known Angle with False Positives'; ['At 4 Meters,' EXPtype]})
        xlabel('Known Angle (deg)')
        ylabel('Measured Angle (deg)')
        grid on
        hold off
        % Set the background color to white
        plotnorm()
        fprintf('PVT_%s_Test3 = %s \n',EXPname{k},Tsave)
        if exportfigs == 1
        eval(sprintf('export_fig PVT_%s_Test3 -png -r300 -painters',EXPname{k}))
        end
        
        figure
        hold on
        for m = 1:numel(AFMname)
            switch AFMname{m}
                case 'P'
                    TagType = 'Paper Tag';
                    ID = 'Tag_5';
                case 'V1'
                    if EXPname{k} == 'Ex2' | EXPname{k} == 'Ex5' 
                        TagType = 'AFM';
                    else
                        TagType = 'AFM-1';
                    end
                    ID = 'Tag_7';
                case 'V2'
                    TagType = 'AFM-2';
                    ID = 'Tag_7';
                case 'T'
                    TagType = 'Tablet';
                    ID = 'Tag_5';
            end

            
            try
                plot(Data.(EXPname{k}).Filtered.(AFMname{m}).Test4.(ID)(:,1),180-abs(Data.(EXPname{k}).Filtered.(AFMname{m}).Test4.(ID)(:,7)),'*','DisplayName',[TagType ' Detections'])
            catch
                warning(['No Detection at ', EXPname{k}, ', ', AFMname{m}, ', Test4']);
                continue
            end
        end

        gcf();
        legend('Location','NW')
        Tsave = ['Measured Angle vs Known Angle with False Positives' EXPtype];
        %title({'Measured Angle vs Known Angle with False Positives'; ['At 6 Meters,' EXPtype]})
        xlabel('Known Angle (deg)')
        ylabel('Measured Angle (deg)')
        grid on
        hold off
        % Set the background color to white
        plotnorm()
        fprintf('PVT_%s_Test4 = %s \n',EXPname{k},Tsave)
        if exportfigs == 1
        eval(sprintf('export_fig PVT_%s_Test4 -png -r300 -painters',EXPname{k}))
        end
    else
        continue
    end
end


%% No FP
for k = 1:numel(EXPname)
    if contains(EXPname{k},'Ex2') | contains(EXPname{k},'Ex3')
               
        switch EXPname{k}
            case 'Ex2'
                EXPtype = ' In Air, Ambient';
            case 'Ex3'
                EXPtype = ' In Air, Dark';
            case 'Ex5'
                EXPtype = ' In Water, Ambient';
            case 'Ex6'
                EXPtype = ' In Water, Dark';
        end
        
        figure
        hold on
        for m = 1:numel(AFMname)
            switch AFMname{m}
                case 'P'
                    TagType = 'Paper Tag';
                    ID = 'Tag_5';
                case 'V1'
                    if EXPname{k} == 'Ex2' | EXPname{k} == 'Ex5' 
                        TagType = 'AFM';
                    else
                        TagType = 'AFM-1';
                    end
                    ID = 'Tag_7';
                case 'V2'
                    TagType = 'AFM-2';
                    ID = 'Tag_7';
                case 'T'
                    TagType = 'Tablet';
                    ID = 'Tag_5';
            end

            try
                plot(Data.(EXPname{k}).Smoothed.(AFMname{m}).Test2.(ID)(:,1),180-abs(Data.(EXPname{k}).Smoothed.(AFMname{m}).Test2.(ID)(:,7)),'*','DisplayName',[TagType ' Detections'])
            catch
                warning(['No Detection at ', EXPname{k}, ', ', AFMname{m}, ', Test2']);
                continue
            end
        end

        gcf();
        legend('Location','NW')
        Tsave = ['Measured Angle vs Known Angle without False Positives' EXPtype];
        %title({'Measured Angle vs Known Angle without False Positives'; ['At 2 Meters,' EXPtype]})
        xlabel('Known Angle (deg)')
        ylabel('Measured Angle (deg)')
        grid on
        hold off
        % Set the background color to white
        plotnorm()
        fprintf('PVT_%s_Test2S = %s \n',EXPname{k},Tsave)
        
        if exportfigs == 1
        eval(sprintf('export_fig PVT_%s_Test2S -png -r300 -painters',EXPname{k}))
        end
        
        figure
        hold on            
        for m = 1:numel(AFMname)
            switch AFMname{m}
                case 'P'
                    TagType = 'Paper Tag';
                    ID = 'Tag_5';
                case 'V1'
                    if EXPname{k} == 'Ex2' | EXPname{k} == 'Ex5' 
                        TagType = 'AFM';
                    else
                        TagType = 'AFM-1';
                    end
                    ID = 'Tag_7';
                case 'V2'
                    TagType = 'AFM-2';
                    ID = 'Tag_7';
                case 'T'
                    TagType = 'Tablet';
                    ID = 'Tag_5';
            end

            try
                plot(Data.(EXPname{k}).Smoothed.(AFMname{m}).Test3.(ID)(:,1),180-abs(Data.(EXPname{k}).Smoothed.(AFMname{m}).Test3.(ID)(:,7)),'*','DisplayName',[TagType ' Detections'])
            catch
                warning(['No Detection at ', EXPname{k}, ', ', AFMname{m}, ', Test3']);
                continue
            end
        end

        gcf();
        legend('Location','NW')
        Tsave = ['Measured Angle vs Known Angle without False Positives' EXPtype];
        %title({'Measured Angle vs Known Angle without False Positives'; ['At 4 Meters,' EXPtype]})
        xlabel('Known Angle (deg)')
        ylabel('Measured Angle (deg)')
        grid on
        hold off
        % Set the background color to white
        plotnorm()
        fprintf('PVT_%s_Test3S = %s \n',EXPname{k},Tsave)
        
        if exportfigs == 1
        eval(sprintf('export_fig PVT_%s_Test3S -png -r300 -painters',EXPname{k}))
        end
        
        figure
        hold on
        for m = 1:numel(AFMname)
            switch AFMname{m}
                case 'P'
                    TagType = 'Paper Tag';
                    ID = 'Tag_5';
                case 'V1'
                    if EXPname{k} == 'Ex2' | EXPname{k} == 'Ex5' 
                        TagType = 'AFM';
                    else
                        TagType = 'AFM-1';
                    end
                    ID = 'Tag_7';
                case 'V2'
                    TagType = 'AFM-2';
                    ID = 'Tag_7';
                case 'T'
                    TagType = 'Tablet';
                    ID = 'Tag_5';
            end

            try
                plot(Data.(EXPname{k}).Smoothed.(AFMname{m}).Test4.(ID)(:,1),180-abs(Data.(EXPname{k}).Smoothed.(AFMname{m}).Test4.(ID)(:,7)),'*','DisplayName',[TagType ' Detections'])
            catch
                warning(['No Detection at ', EXPname{k}, ', ', AFMname{m}, ', Test4']);
                continue
            end
        end

        gcf();
        legend('Location','NW')
        Tsave = ['Measured Angle vs Known Angle without False Positives' EXPtype];
        %title({'Measured Angle vs Known Angle without False Positives'; ['At 6 Meters,' EXPtype]})
        xlabel('Known Angle (deg)')
        ylabel('Measured Angle (deg)')
        grid on
        hold off
        % Set the background color to white
        plotnorm()
        fprintf('PVT_%s_Test4S = %s \n',EXPname{k},Tsave)
        if exportfigs == 1
        eval(sprintf('export_fig PVT_%s_Test4S -png -r300 -painters',EXPname{k}))
        end
    else
        continue
    end
end


%% Tag detections


%% Ambient/Dark comparison plots

%% Test 1 Absolute Error Plots

%% AFM with FP
tests = 'Test1';
try
    figure
    hold on
    plot(Data.Ex2.Filtered.V1.Test1.Tag_7(:,1),Data.Ex2.Filtered.V1.Test1.Tag_7(:,10),'*','DisplayName','AFM Detections Ambient')
    plot(Data.Ex3.Filtered.V1.Test1.Tag_7(:,1),Data.Ex3.Filtered.V1.Test1.Tag_7(:,10),'*','DisplayName','AFM-1 Detections Dark')
    plot(Data.Ex3.Filtered.V2.Test1.Tag_7(:,1),Data.Ex3.Filtered.V2.Test1.Tag_7(:,10),'*','DisplayName','AFM-2 Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = 'Measured Distance vs Known Distance with False Positives In Air, Ambient vs Dark';
    %title({'Measured Distance vs Known Distance with False Positives'; 'In Air, Ambient vs Dark'})
    xlabel('Known Distance (m)')
    ylabel('Error (m)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DLe_AFM_Test1 = %s \n',Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLe_AFM_%s -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex2/Ex3, AFM ', tests]);
    legend('Location','NW')
end

%% AFM no FP

try
    figure
    hold on
    plot(Data.Ex2.Smoothed.V1.Test1.Tag_7(:,1),Data.Ex2.Smoothed.V1.Test1.Tag_7(:,10),'*','DisplayName','AFM Detections Ambient')
    plot(Data.Ex3.Smoothed.V1.Test1.Tag_7(:,1),Data.Ex3.Smoothed.V1.Test1.Tag_7(:,10),'*','DisplayName','AFM-1 Detections Dark')
    plot(Data.Ex3.Smoothed.V2.Test1.Tag_7(:,1),Data.Ex3.Smoothed.V2.Test1.Tag_7(:,10),'*','DisplayName','AFM-2 Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = 'Measured Distance vs Known Distance without False Positives In Air, Ambient vs Dark';
    %title({'Measured Distance vs Known Distance without False Positives'; 'In Air, Ambient vs Dark'})
    xlabel('Known Distance (m)')
    ylabel('Error (m)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DLe_AFM_Test1S = %s \n',Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLe_AFM_%sS -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex2/Ex3, AFM ', tests, 'S']);
    legend('Location','NW')
end


%% Tablet with FP

try
    figure
    hold on
    plot(Data.Ex2.Filtered.T.Test1.Tag_5(:,1),Data.Ex2.Filtered.T.Test1.Tag_5(:,10),'*','DisplayName','Tablet Detections Ambient')
    plot(Data.Ex3.Filtered.T.Test1.Tag_5(:,1),Data.Ex3.Filtered.T.Test1.Tag_5(:,10),'*','DisplayName','Tablet Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = 'Measured Distance vs Known Distance with False Positives In Air, Ambient vs Dark';
    %title({'Measured Distance vs Known Distance with False Positives'; 'In Air, Ambient vs Dark'})
    xlabel('Known Distance (m)')
    ylabel('Error (m)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DLe_T_%s = %s \n',tests,Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLe_T_%s -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex2/Ex3, T ', tests]);
    legend('Location','NW')
end

%% Tablet no FP

try
    figure
    hold on
    plot(Data.Ex2.Smoothed.T.Test1.Tag_5(:,1),Data.Ex2.Smoothed.T.Test1.Tag_5(:,10),'*','DisplayName','Tablet Detections Ambient')
    plot(Data.Ex3.Smoothed.T.Test1.Tag_5(:,1),Data.Ex3.Smoothed.T.Test1.Tag_5(:,10),'*','DisplayName','Tablet Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = 'Measured Distance vs Known Distance without False Positives In Air, Ambient vs Dark';
    %title({'Measured Distance vs Known Distance without False Positives'; 'In Air, Ambient vs Dark'})
    xlabel('Known Distance (m)')
    ylabel('Error (m)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DLe_T_%sS = %s \n',tests,Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLe_T_%sS -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex2/Ex3, T ', tests, 'S']);
    legend('Location','NW')
end

%% Test 2

% close all
tests = 'Test2';
try
    figure
    hold on
    plot(Data.Ex2.Filtered.V1.Test2.Tag_7(:,1),180-abs(Data.Ex2.Filtered.V1.Test2.Tag_7(:,7)),'*','DisplayName','AFM Detections Ambient')
    plot(Data.Ex3.Filtered.V1.Test2.Tag_7(:,1),180-abs(Data.Ex3.Filtered.V1.Test2.Tag_7(:,7)),'*','DisplayName','AFM-1 Detections Dark')
    plot(Data.Ex3.Filtered.V2.Test2.Tag_7(:,1),180-abs(Data.Ex3.Filtered.V2.Test2.Tag_7(:,7)),'*','DisplayName','AFM-2 Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle with False Positives At 2 Meters, In Air, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle with False Positives'; 'At 2 Meters, In Air, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DL_AFM_Test2 = %s \n',Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DL_AFM_%s -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex2/Ex3, AFM ', tests]);
    legend('Location','NW')
end

try
    figure
    hold on
    plot(Data.Ex2.Smoothed.V1.Test2.Tag_7(:,1),180-abs(Data.Ex2.Smoothed.V1.Test2.Tag_7(:,7)),'*','DisplayName','AFM Detections Ambient')
    plot(Data.Ex3.Smoothed.V1.Test2.Tag_7(:,1),180-abs(Data.Ex3.Smoothed.V1.Test2.Tag_7(:,7)),'*','DisplayName','AFM-1 Detections Dark')
    plot(Data.Ex3.Smoothed.V2.Test2.Tag_7(:,1),180-abs(Data.Ex3.Smoothed.V2.Test2.Tag_7(:,7)),'*','DisplayName','AFM-2 Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle without False Positives At 2 Meters, In Air, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle without False Positives'; 'At 2 Meters, In Air, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DL_AFM_Test2S = %s \n',Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DL_AFM_%sS -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex2/Ex3, AFM ', tests, 'S']);
    legend('Location','NW')
end


%%

try
    figure
    hold on
    plot(Data.Ex2.Filtered.T.Test2.Tag_5(:,1),180-abs(Data.Ex2.Filtered.T.Test2.Tag_5(:,7)),'*','DisplayName','Tablet Detections Ambient')
    plot(Data.Ex3.Filtered.T.Test2.Tag_5(:,1),180-abs(Data.Ex3.Filtered.T.Test2.Tag_5(:,7)),'*','DisplayName','Tablet Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle with False Positives At 2 Meters, In Air, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle with False Positives'; 'At 2 Meters, In Air, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DL_T_%s = %s \n',tests,Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DL_T_%s -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex2/Ex3, T ', tests]);
    legend('Location','NW')
end

try
    figure
    hold on
    plot(Data.Ex2.Smoothed.T.Test2.Tag_5(:,1),180-abs(Data.Ex2.Smoothed.T.Test2.Tag_5(:,7)),'*','DisplayName','Tablet Detections Ambient')
    plot(Data.Ex3.Smoothed.T.Test2.Tag_5(:,1),180-abs(Data.Ex3.Smoothed.T.Test2.Tag_5(:,7)),'*','DisplayName','Tablet Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle without False Positives At 2 Meters, In Air, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle without False Positives'; 'At 2 Meters, In Air, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DL_T_%sS = %s \n',tests,Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DL_T_%sS -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex2/Ex3, T ', tests, 'S']);
    legend('Location','NW')
end

%% Test 3

% close all
tests = 'Test3';
try
    figure
    hold on
    plot(Data.Ex2.Filtered.V1.Test3.Tag_7(:,1),180-abs(Data.Ex2.Filtered.V1.Test3.Tag_7(:,7)),'*','DisplayName','AFM Detections Ambient')
    plot(Data.Ex3.Filtered.V1.Test3.Tag_7(:,1),180-abs(Data.Ex3.Filtered.V1.Test3.Tag_7(:,7)),'*','DisplayName','AFM-1 Detections Dark')
    plot(Data.Ex3.Filtered.V2.Test3.Tag_7(:,1),180-abs(Data.Ex3.Filtered.V2.Test3.Tag_7(:,7)),'*','DisplayName','AFM-2 Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle with False Positives At 4 Meters, In Air, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle with False Positives'; 'At 4 Meters, In Air, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DL_AFM_Test3 = %s \n',Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DL_AFM_%s -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex2/Ex3, AFM ', tests]);
    legend('Location','NW')
end

try
    figure
    hold on
    plot(Data.Ex2.Smoothed.V1.Test3.Tag_7(:,1),180-abs(Data.Ex2.Smoothed.V1.Test3.Tag_7(:,7)),'*','DisplayName','AFM Detections Ambient')
    plot(Data.Ex3.Smoothed.V1.Test3.Tag_7(:,1),180-abs(Data.Ex3.Smoothed.V1.Test3.Tag_7(:,7)),'*','DisplayName','AFM-1 Detections Dark')
    plot(Data.Ex3.Smoothed.V2.Test3.Tag_7(:,1),180-abs(Data.Ex3.Smoothed.V2.Test3.Tag_7(:,7)),'*','DisplayName','AFM-2 Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle without False Positives At 4 Meters, In Air, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle without False Positives'; 'At 4 Meters, In Air, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DL_AFM_Test3S = %s \n',Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DL_AFM_%sS -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex2/Ex3, AFM ', tests, 'S']);
    legend('Location','NW')
end


%%

try
    figure
    hold on
    plot(Data.Ex2.Filtered.T.Test3.Tag_5(:,1),180-abs(Data.Ex2.Filtered.T.Test3.Tag_5(:,7)),'*','DisplayName','Tablet Detections Ambient')
    plot(Data.Ex3.Filtered.T.Test3.Tag_5(:,1),180-abs(Data.Ex3.Filtered.T.Test3.Tag_5(:,7)),'*','DisplayName','Tablet Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle with False Positives At 4 Meters, In Air, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle with False Positives'; 'At 4 Meters, In Air, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DL_T_%s = %s \n',tests,Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DL_T_%s -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex2/Ex3, T ', tests]);
    legend('Location','NW')
end

try
    figure
    hold on
    plot(Data.Ex2.Smoothed.T.Test3.Tag_5(:,1),180-abs(Data.Ex2.Smoothed.T.Test3.Tag_5(:,7)),'*','DisplayName','Tablet Detections Ambient')
    plot(Data.Ex3.Smoothed.T.Test3.Tag_5(:,1),180-abs(Data.Ex3.Smoothed.T.Test3.Tag_5(:,7)),'*','DisplayName','Tablet Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle without False Positives At 4 Meters, In Air, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle without False Positives'; 'At 4 Meters, In Air, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DL_T_%sS = %s \n',tests,Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DL_T_%sS -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex2/Ex3, T ', tests, 'S']);
    legend('Location','NW')
end

%% Test 4

% close all
tests = 'Test4';
try
    figure
    hold on
    plot(Data.Ex2.Filtered.V1.Test4.Tag_7(:,1),180-abs(Data.Ex2.Filtered.V1.Test4.Tag_7(:,7)),'*','DisplayName','AFM Detections Ambient')
    plot(Data.Ex3.Filtered.V1.Test4.Tag_7(:,1),180-abs(Data.Ex3.Filtered.V1.Test4.Tag_7(:,7)),'*','DisplayName','AFM-1 Detections Dark')
    plot(Data.Ex3.Filtered.V2.Test4.Tag_7(:,1),180-abs(Data.Ex3.Filtered.V2.Test4.Tag_7(:,7)),'*','DisplayName','AFM-2 Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle with False Positives At 6 Meters, In Air, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle with False Positives'; 'At 6 Meters, In Air, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DL_AFM_Test4 = %s \n',Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DL_AFM_%s -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex2/Ex3, AFM ', tests]);
    legend('Location','NW')
end

try
    figure
    hold on
    plot(Data.Ex2.Smoothed.V1.Test4.Tag_7(:,1),180-abs(Data.Ex2.Smoothed.V1.Test4.Tag_7(:,7)),'*','DisplayName','AFM Detections Ambient')
    plot(Data.Ex3.Smoothed.V1.Test4.Tag_7(:,1),180-abs(Data.Ex3.Smoothed.V1.Test4.Tag_7(:,7)),'*','DisplayName','AFM-1 Detections Dark')
    plot(Data.Ex3.Smoothed.V2.Test4.Tag_7(:,1),180-abs(Data.Ex3.Smoothed.V2.Test4.Tag_7(:,7)),'*','DisplayName','AFM-2 Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle without False Positives At 6 Meters, In Air, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle without False Positives'; 'At 6 Meters, In Air, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DL_AFM_Test4S = %s \n',Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DL_AFM_%sS -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex2/Ex3, AFM ', tests, 'S']);
    legend('Location','NW')
end


%%

try
    figure
    hold on
    plot(Data.Ex2.Filtered.T.Test4.Tag_5(:,1),180-abs(Data.Ex2.Filtered.T.Test4.Tag_5(:,7)),'*','DisplayName','Tablet Detections Ambient')
    plot(Data.Ex3.Filtered.T.Test4.Tag_5(:,1),180-abs(Data.Ex3.Filtered.T.Test4.Tag_5(:,7)),'*','DisplayName','Tablet Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle with False Positives At 6 Meters, In Air, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle with False Positives'; 'At 6 Meters, In Air, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DL_T_%s = %s \n',tests,Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DL_T_%s -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex2/Ex3, T ', tests]);
    legend('Location','NW')
end

try
    figure
    hold on
    plot(Data.Ex2.Smoothed.T.Test4.Tag_5(:,1),180-abs(Data.Ex2.Smoothed.T.Test4.Tag_5(:,7)),'*','DisplayName','Tablet Detections Ambient')
    plot(Data.Ex3.Smoothed.T.Test4.Tag_5(:,1),180-abs(Data.Ex3.Smoothed.T.Test4.Tag_5(:,7)),'*','DisplayName','Tablet Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle without False Positives At 6 Meters, In Air, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle without False Positives'; 'At 6 Meters, In Air, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DL_T_%sS = %s \n',tests,Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DL_T_%sS -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex2/Ex3, T ', tests, 'S']);
    legend('Location','NW')
end

%% Ambient Dark Detections comparison AFM

%% Raw detects Light Dark AFM Air Test 1

EXPname = {'Ex2'; 'Ex3'};
figure
hold on
for k = 1:numel(EXPname)
    
    switch EXPname{k}
        case 'Ex2'
            EXPtype = ' Open Air, Ambient';
        case 'Ex3'
            EXPtype = ' Open Air, Dark';
        case 'Ex5'
            EXPtype = ' In Water, Ambient';
        case 'Ex6'
            EXPtype = ' In Water, Dark';
    end
    
    AFMname = {'V1';'V2'};
    TESTtype = EXPtype;
    TESTtitle = 'Known Distance';
    xLBL = 'Known Distance (m)';
    yLBL = 'Detections';

    for m = 1:numel(AFMname)
        switch AFMname{m}
            case 'P'
                TagType = 'Paper Tag';
                ID = 'Tag_5';
            case 'V1'
                if EXPname{k} == 'Ex2' | EXPname{k} == 'Ex5' 
                    TagType = 'AFM';
                else
                    TagType = 'AFM-1';
                end
                ID = 'Tag_7';
            case 'V2'
                TagType = 'AFM-2';
                ID = 'Tag_7';
            case 'T'
                TagType = 'Tablet';
                ID = 'Tag_5';
        end


        try
            plot(Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,1),Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,6),'-*','DisplayName',[TagType EXPtype])
        catch
            warning(['Error - DID NOT COMPUTE', EXPname{k}, AFMname{m}, 'Test1', ID]);
            continue
        end
    end
end

gcf();
legend('Location','NW')
Tsave = ['Detections vs ', TESTtitle, ' with False Positives, Air LD'];
%title({['Detections vs ', TESTtitle, ' with False Positives']; 'Air LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DL_Detect_AFM = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DL_Detect_AFM -png -r300 -painters'))
end

%% Smooth detects Light Dark AFM Air Test 1

EXPname = {'Ex2'; 'Ex3'};
figure
hold on
for k = 1:numel(EXPname)
    
    switch EXPname{k}
        case 'Ex2'
            EXPtype = ' Open Air, Ambient';
        case 'Ex3'
            EXPtype = ' Open Air, Dark';
        case 'Ex5'
            EXPtype = ' In Water, Ambient';
        case 'Ex6'
            EXPtype = ' In Water, Dark';
    end
    
    AFMname = {'V1';'V2'};
    TESTtype = EXPtype;
    TESTtitle = 'Known Distance';
    xLBL = 'Known Distance (m)';
    yLBL = 'Detections';

    for m = 1:numel(AFMname)
        switch AFMname{m}
            case 'P'
                TagType = 'Paper Tag';
                ID = 'Tag_5';
            case 'V1'
                if EXPname{k} == 'Ex2' | EXPname{k} == 'Ex5' 
                    TagType = 'AFM';
                else
                    TagType = 'AFM-1';
                end
                ID = 'Tag_7';
            case 'V2'
                TagType = 'AFM-2';
                ID = 'Tag_7';
            case 'T'
                TagType = 'Tablet';
                ID = 'Tag_5';
        end


        try
            plot(Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,1),Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,7),'-*','DisplayName',[TagType EXPtype])
        catch
            warning(['Error - DID NOT COMPUTE', EXPname{k}, AFMname{m}, 'Test1', ID]);
            continue
        end
    end
end

gcf();
legend('Location','NW')
Tsave = ['Detections vs ', TESTtitle, ' without False Positives, Air LD'];
%title({['Detections vs ', TESTtitle, ' without False Positives']; 'Air LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DL_Detect_AFM_S = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DL_Detect_AFM_S -png -r300 -painters'))
end
%% Raw Error bars Light Dark AFM Air Test 1

EXPname = {'Ex2'; 'Ex3'};
figure
hold on
for k = 1:numel(EXPname)
    
    switch EXPname{k}
        case 'Ex2'
            EXPtype = ' Open Air, Ambient';
        case 'Ex3'
            EXPtype = ' Open Air, Dark';
        case 'Ex5'
            EXPtype = ' In Water, Ambient';
        case 'Ex6'
            EXPtype = ' In Water, Dark';
    end
    
    AFMname = {'V1';'V2'};
    TESTtype = EXPtype;
    TESTtitle = 'Known Distance';
    xLBL = 'Known Distance (m)';
    yLBL = 'Distance Error (m)';

    for m = 1:numel(AFMname)
        switch AFMname{m}
            case 'P'
                TagType = 'Paper Tag';
                ID = 'Tag_5';
            case 'V1'
                if EXPname{k} == 'Ex2' | EXPname{k} == 'Ex5' 
                    TagType = 'AFM';
                else
                    TagType = 'AFM-1';
                end
                ID = 'Tag_7';
            case 'V2'
                TagType = 'AFM-2';
                ID = 'Tag_7';
            case 'T'
                TagType = 'Tablet';
                ID = 'Tag_5';
        end


        try
            errorbar(Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,1),Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,14),Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,10),Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,11),'-*','DisplayName',[TagType EXPtype])
        catch
            warning(['Error - DID NOT COMPUTE', EXPname{k}, AFMname{m}, 'Test1', ID]);
            continue
        end
    end
end

gcf();
legend('Location','NW')
Tsave = ['Distance Error vs ', TESTtitle, ' with False Positives, Air LD'];
%title({['Distance Error vs ', TESTtitle, ' with False Positives']; 'Air LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DL_Error_AFM_ = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DL_Error_AFM_ -png -r300 -painters'))
end

%% Smooth Error bars Light Dark AFM Air Test 1

EXPname = {'Ex2'; 'Ex3'};
figure
hold on
for k = 1:numel(EXPname)
    
    switch EXPname{k}
        case 'Ex2'
            EXPtype = ' Open Air, Ambient';
        case 'Ex3'
            EXPtype = ' Open Air, Dark';
        case 'Ex5'
            EXPtype = ' In Water, Ambient';
        case 'Ex6'
            EXPtype = ' In Water, Dark';
    end
    
    AFMname = {'V1';'V2'};
    TESTtype = EXPtype;
    TESTtitle = 'Known Distance';
    xLBL = 'Known Distance (m)';
    yLBL = 'Distance Error (m)';

    for m = 1:numel(AFMname)
        switch AFMname{m}
            case 'P'
                TagType = 'Paper Tag';
                ID = 'Tag_5';
            case 'V1'
                if EXPname{k} == 'Ex2' | EXPname{k} == 'Ex5' 
                    TagType = 'AFM';
                else
                    TagType = 'AFM-1';
                end
                ID = 'Tag_7';
            case 'V2'
                TagType = 'AFM-2';
                ID = 'Tag_7';
            case 'T'
                TagType = 'Tablet';
                ID = 'Tag_5';
        end


        try
            errorbar(Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,1),Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,15),Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,12),Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,13),'-*','DisplayName',[TagType EXPtype])
        catch
            warning(['Error - DID NOT COMPUTE', EXPname{k}, AFMname{m}, 'Test1', ID]);
            continue
        end
    end
end

gcf();
legend('Location','NW')
Tsave = ['Distance Error vs ', TESTtitle, ' without False Positives, Air LD'];
%title({['Distance Error vs ', TESTtitle, ' without False Positives']; 'Air LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DL_Error_AFM_S = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DL_Error_AFM_S -png -r300 -painters'))
end

%% Raw detects Light Dark AFM Air Test 2

EXPname = {'Ex2'; 'Ex3'};
figure
hold on
for k = 1:numel(EXPname)
    
    switch EXPname{k}
        case 'Ex2'
            EXPtype = ' Open Air, Ambient';
        case 'Ex3'
            EXPtype = ' Open Air, Dark';
        case 'Ex5'
            EXPtype = ' In Water, Ambient';
        case 'Ex6'
            EXPtype = ' In Water, Dark';
    end
    
    AFMname = {'V1';'V2'};
    TESTtype = EXPtype;
    TESTtitle = 'Known Angle';
    xLBL = 'Known Angle (deg)';
    yLBL = 'Detections';

    for m = 1:numel(AFMname)
        switch AFMname{m}
            case 'P'
                TagType = 'Paper Tag';
                ID = 'Tag_5';
            case 'V1'
                if EXPname{k} == 'Ex2' | EXPname{k} == 'Ex5' 
                    TagType = 'AFM';
                else
                    TagType = 'AFM-1';
                end
                ID = 'Tag_7';
            case 'V2'
                TagType = 'AFM-2';
                ID = 'Tag_7';
            case 'T'
                TagType = 'Tablet';
                ID = 'Tag_5';
        end


        try
            plot(Data.(EXPname{k}).Results.(AFMname{m}).Test2.(ID)(:,1),Data.(EXPname{k}).Results.(AFMname{m}).Test2.(ID)(:,6),'-*','DisplayName',[TagType EXPtype])
        catch
            warning(['Error - DID NOT COMPUTE', EXPname{k}, AFMname{m}, 'Test1', ID]);
            continue
        end
    end
end

gcf();
legend('Location','NW')
Tsave = ['Detections vs ', TESTtitle, ' with False Positives, Air LD'];
%title({['Detections vs ', TESTtitle, ' with False Positives']; 'Air LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DL_Detect2_AFM = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DL_Detect2_AFM -png -r300 -painters'))
end

%% Smooth detects Light Dark AFM Air Test 2

EXPname = {'Ex2'; 'Ex3'};
figure
hold on
for k = 1:numel(EXPname)
    
    switch EXPname{k}
        case 'Ex2'
            EXPtype = ' Open Air, Ambient';
        case 'Ex3'
            EXPtype = ' Open Air, Dark';
        case 'Ex5'
            EXPtype = ' In Water, Ambient';
        case 'Ex6'
            EXPtype = ' In Water, Dark';
    end
    
    AFMname = {'V1';'V2'};
    TESTtype = EXPtype;
    TESTtitle = 'Known Angle';
    xLBL = 'Known Angle (deg)';
    yLBL = 'Detections';

    for m = 1:numel(AFMname)
        switch AFMname{m}
            case 'P'
                TagType = 'Paper Tag';
                ID = 'Tag_5';
            case 'V1'
                if EXPname{k} == 'Ex2' | EXPname{k} == 'Ex5' 
                    TagType = 'AFM';
                else
                    TagType = 'AFM-1';
                end
                ID = 'Tag_7';
            case 'V2'
                TagType = 'AFM-2';
                ID = 'Tag_7';
            case 'T'
                TagType = 'Tablet';
                ID = 'Tag_5';
        end


        try
            plot(Data.(EXPname{k}).Results.(AFMname{m}).Test2.(ID)(:,1),Data.(EXPname{k}).Results.(AFMname{m}).Test2.(ID)(:,7),'-*','DisplayName',[TagType EXPtype])
        catch
            warning(['Error - DID NOT COMPUTE', EXPname{k}, AFMname{m}, 'Test1', ID]);
            continue
        end
    end
end

gcf();
legend('Location','NW')
Tsave = ['Detections vs ', TESTtitle, ' without False Positives, Air LD'];
%title({['Detections vs ', TESTtitle, ' without False Positives']; 'Air LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DL_Detect2_AFM_S = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DL_Detect2_AFM_S -png -r300 -painters'))
end

%% Ambient Dar Comparison detections Tablet

%% Raw detects Light Dark Tab Air Test 1

EXPname = {'Ex2'; 'Ex3'};
figure
hold on
for k = 1:numel(EXPname)
    
    switch EXPname{k}
        case 'Ex2'
            EXPtype = ' Open Air, Ambient';
        case 'Ex3'
            EXPtype = ' Open Air, Dark';
        case 'Ex5'
            EXPtype = ' In Water, Ambient';
        case 'Ex6'
            EXPtype = ' In Water, Dark';
    end
    
    AFMname = {'T'};
    TESTtype = EXPtype;
    TESTtitle = 'Known Distance';
    xLBL = 'Known Distance (m)';
    yLBL = 'Detections';

    for m = 1:numel(AFMname)
        switch AFMname{m}
            case 'P'
                TagType = 'Paper Tag';
                ID = 'Tag_5';
            case 'V1'
                if EXPname{k} == 'Ex2' | EXPname{k} == 'Ex5' 
                    TagType = 'AFM';
                else
                    TagType = 'AFM-1';
                end
                ID = 'Tag_7';
            case 'V2'
                TagType = 'AFM-2';
                ID = 'Tag_7';
            case 'T'
                TagType = 'Tablet';
                ID = 'Tag_5';
        end


        try
            plot(Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,1),Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,6),'-*','DisplayName',[TagType EXPtype])
        catch
            warning(['Error - DID NOT COMPUTE', EXPname{k}, AFMname{m}, 'Test1', ID]);
            continue
        end
    end
end

gcf();
legend('Location','NW')
Tsave = ['Detections vs ', TESTtitle, ' with False Positives, Air LD'];
%title({['Detections vs ', TESTtitle, ' with False Positives']; 'Air LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DL_Detect_AFM = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DL_Detect_AFM -png -r300 -painters'))
end

%% Smooth detects Light Dark Tab Air Test 1

EXPname = {'Ex2'; 'Ex3'};
figure
hold on
for k = 1:numel(EXPname)
    
    switch EXPname{k}
        case 'Ex2'
            EXPtype = ' Open Air, Ambient';
        case 'Ex3'
            EXPtype = ' Open Air, Dark';
        case 'Ex5'
            EXPtype = ' In Water, Ambient';
        case 'Ex6'
            EXPtype = ' In Water, Dark';
    end
    
    AFMname = {'T'};
    TESTtype = EXPtype;
    TESTtitle = 'Known Distance';
    xLBL = 'Known Distance (m)';
    yLBL = 'Detections';

    for m = 1:numel(AFMname)
        switch AFMname{m}
            case 'P'
                TagType = 'Paper Tag';
                ID = 'Tag_5';
            case 'V1'
                if EXPname{k} == 'Ex2' | EXPname{k} == 'Ex5' 
                    TagType = 'AFM';
                else
                    TagType = 'AFM-1';
                end
                ID = 'Tag_7';
            case 'V2'
                TagType = 'AFM-2';
                ID = 'Tag_7';
            case 'T'
                TagType = 'Tablet';
                ID = 'Tag_5';
        end


        try
            plot(Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,1),Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,7),'-*','DisplayName',[TagType EXPtype])
        catch
            warning(['Error - DID NOT COMPUTE', EXPname{k}, AFMname{m}, 'Test1', ID]);
            continue
        end
    end
end

gcf();
legend('Location','NW')
Tsave = ['Detections vs ', TESTtitle, ' without False Positives, Air LD'];
%title({['Detections vs ', TESTtitle, ' without False Positives']; 'Air LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DL_Detect_T_S = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DL_Detect_T_S -png -r300 -painters'))
end
%% Raw Error bars Light Dark AFM Air Test 1

EXPname = {'Ex2'; 'Ex3'};
figure
hold on
for k = 1:numel(EXPname)
    
    switch EXPname{k}
        case 'Ex2'
            EXPtype = ' Open Air, Ambient';
        case 'Ex3'
            EXPtype = ' Open Air, Dark';
        case 'Ex5'
            EXPtype = ' In Water, Ambient';
        case 'Ex6'
            EXPtype = ' In Water, Dark';
    end
    
    AFMname = {'T'};
    TESTtype = EXPtype;
    TESTtitle = 'Known Distance';
    xLBL = 'Known Distance (m)';
    yLBL = 'Distance Error (m)';

    for m = 1:numel(AFMname)
        switch AFMname{m}
            case 'P'
                TagType = 'Paper Tag';
                ID = 'Tag_5';
            case 'V1'
                if EXPname{k} == 'Ex2' | EXPname{k} == 'Ex5' 
                    TagType = 'AFM';
                else
                    TagType = 'AFM-1';
                end
                ID = 'Tag_7';
            case 'V2'
                TagType = 'AFM-2';
                ID = 'Tag_7';
            case 'T'
                TagType = 'Tablet';
                ID = 'Tag_5';
        end


        try
            errorbar(Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,1),Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,14),Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,10),Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,11),'-*','DisplayName',[TagType EXPtype])
        catch
            warning(['Error - DID NOT COMPUTE', EXPname{k}, AFMname{m}, 'Test1', ID]);
            continue
        end
    end
end

gcf();
legend('Location','NW')
Tsave = ['Distance Error vs ', TESTtitle, ' with False Positives, Air LD'];
%title({['Distance Error vs ', TESTtitle, ' with False Positives']; 'Air LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DL_Error_T_ = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DL_Error_T_ -png -r300 -painters'))
end

%% Smooth Error bars Light Dark Tab Air Test 1

EXPname = {'Ex2'; 'Ex3'};
figure
hold on
for k = 1:numel(EXPname)
    
    switch EXPname{k}
        case 'Ex2'
            EXPtype = ' Open Air, Ambient';
        case 'Ex3'
            EXPtype = ' Open Air, Dark';
        case 'Ex5'
            EXPtype = ' In Water, Ambient';
        case 'Ex6'
            EXPtype = ' In Water, Dark';
    end
    
    AFMname = {'T'};
    TESTtype = EXPtype;
    TESTtitle = 'Known Distance';
    xLBL = 'Known Distance (m)';
    yLBL = 'Distance Error (m)';

    for m = 1:numel(AFMname)
        switch AFMname{m}
            case 'P'
                TagType = 'Paper Tag';
                ID = 'Tag_5';
            case 'V1'
                if EXPname{k} == 'Ex2' | EXPname{k} == 'Ex5' 
                    TagType = 'AFM';
                else
                    TagType = 'AFM-1';
                end
                ID = 'Tag_7';
            case 'V2'
                TagType = 'AFM-2';
                ID = 'Tag_7';
            case 'T'
                TagType = 'Tablet';
                ID = 'Tag_5';
        end


        try
            errorbar(Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,1),Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,15),Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,12),Data.(EXPname{k}).Results.(AFMname{m}).Test1.(ID)(:,13),'-*','DisplayName',[TagType EXPtype])
        catch
            warning(['Error - DID NOT COMPUTE', EXPname{k}, AFMname{m}, 'Test1', ID]);
            continue
        end
    end
end

gcf();
legend('Location','NW')
Tsave = ['Distance Error vs ', TESTtitle, ' without False Positives, Air LD'];
%title({['Distance Error vs ', TESTtitle, ' without False Positives']; 'Air LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DL_Error_T_S = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DL_Error_T_S -png -r300 -painters'))
end

%% Raw detects Light Dark Tab Air Test 2

EXPname = {'Ex2'; 'Ex3'};
figure
hold on
for k = 1:numel(EXPname)
    
    switch EXPname{k}
        case 'Ex2'
            EXPtype = ' Open Air, Ambient';
        case 'Ex3'
            EXPtype = ' Open Air, Dark';
        case 'Ex5'
            EXPtype = ' In Water, Ambient';
        case 'Ex6'
            EXPtype = ' In Water, Dark';
    end
    
    AFMname = {'T'};
    TESTtype = EXPtype;
    TESTtitle = 'Known Angle';
    xLBL = 'Known Angle (deg)';
    yLBL = 'Detections';

    for m = 1:numel(AFMname)
        switch AFMname{m}
            case 'P'
                TagType = 'Paper Tag';
                ID = 'Tag_5';
            case 'V1'
                if EXPname{k} == 'Ex2' | EXPname{k} == 'Ex5' 
                    TagType = 'AFM';
                else
                    TagType = 'AFM-1';
                end
                ID = 'Tag_7';
            case 'V2'
                TagType = 'AFM-2';
                ID = 'Tag_7';
            case 'T'
                TagType = 'Tablet';
                ID = 'Tag_5';
        end


        try
            plot(Data.(EXPname{k}).Results.(AFMname{m}).Test2.(ID)(:,1),Data.(EXPname{k}).Results.(AFMname{m}).Test2.(ID)(:,6),'-*','DisplayName',[TagType EXPtype])
        catch
            warning(['Error - DID NOT COMPUTE', EXPname{k}, AFMname{m}, 'Test1', ID]);
            continue
        end
    end
end

gcf();
legend('Location','NW')
Tsave = ['Detections vs ', TESTtitle, ' with False Positives, Air LD'];
%title({['Detections vs ', TESTtitle, ' with False Positives']; 'Air LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DL_Detect2_T = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DL_Detect2_T -png -r300 -painters'))
end

%% Smooth detects Light Dark Tab Air Test 2

EXPname = {'Ex2'; 'Ex3'};
figure
hold on
for k = 1:numel(EXPname)
    
    switch EXPname{k}
        case 'Ex2'
            EXPtype = ' Open Air, Ambient';
        case 'Ex3'
            EXPtype = ' Open Air, Dark';
        case 'Ex5'
            EXPtype = ' In Water, Ambient';
        case 'Ex6'
            EXPtype = ' In Water, Dark';
    end
    
    AFMname = {'T'};
    TESTtype = EXPtype;
    TESTtitle = 'Known Angle';
    xLBL = 'Known Angle (deg)';
    yLBL = 'Detections';

    for m = 1:numel(AFMname)
        switch AFMname{m}
            case 'P'
                TagType = 'Paper Tag';
                ID = 'Tag_5';
            case 'V1'
                if EXPname{k} == 'Ex2' | EXPname{k} == 'Ex5' 
                    TagType = 'AFM';
                else
                    TagType = 'AFM-1';
                end
                ID = 'Tag_7';
            case 'V2'
                TagType = 'AFM-2';
                ID = 'Tag_7';
            case 'T'
                TagType = 'Tablet';
                ID = 'Tag_5';
        end


        try
            plot(Data.(EXPname{k}).Results.(AFMname{m}).Test2.(ID)(:,1),Data.(EXPname{k}).Results.(AFMname{m}).Test2.(ID)(:,7),'-*','DisplayName',[TagType EXPtype])
        catch
            warning(['Error - DID NOT COMPUTE', EXPname{k}, AFMname{m}, 'Test1', ID]);
            continue
        end
    end
end

gcf();
legend('Location','NW')
Tsave = ['Detections vs ', TESTtitle, ' without False Positives, Air LD'];
%title({['Detections vs ', TESTtitle, ' without False Positives']; 'Air LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DL_Detect2_T_S = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DL_Detect2_T_S -png -r300 -painters'))
end