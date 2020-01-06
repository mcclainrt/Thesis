 close all

 %% Absolute Error vs. known dist plots all deisgns (PVT Error)
 
 %% PVT Error for all RAW

EXPname = fieldnames(Data);

for k = 1:numel(EXPname)
    if contains(EXPname{k},'Ex5') | contains(EXPname{k},'Ex6')
              
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
    if contains(EXPname{k},'Ex5') | contains(EXPname{k},'Ex6')
    
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
    if contains(EXPname{k},'Ex5') | contains(EXPname{k},'Ex6')
               
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


%%
for k = 1:numel(EXPname)
    if contains(EXPname{k},'Ex5') | contains(EXPname{k},'Ex6')
               
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
        fprintf('PVT_%s_Test2 = %s \n',EXPname{k},Tsave)
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
        fprintf('PVT_%s_Test3 = %s \n',EXPname{k},Tsave)
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
        fprintf('PVT_%s_Test4 = %s \n',EXPname{k},Tsave)
        if exportfigs == 1
        eval(sprintf('export_fig PVT_%s_Test4S -png -r300 -painters',EXPname{k}))
        end
    else
        continue
    end
end

%% Tag Detections

%% Ambient/Dark comparison plots

tests = 'Test1';

%% AFM Error raw

try
    figure
    hold on
    plot(Data.Ex5.Filtered.V1.Test1.Tag_7(:,1),Data.Ex5.Filtered.V1.Test1.Tag_7(:,10),'*','DisplayName','AFM Detections Ambient')
    plot(Data.Ex6.Filtered.V1.Test1.Tag_7(:,1),Data.Ex6.Filtered.V1.Test1.Tag_7(:,10),'*','DisplayName','AFM-1 Detections Dark')
    plot(Data.Ex6.Filtered.V2.Test1.Tag_7(:,1),Data.Ex6.Filtered.V2.Test1.Tag_7(:,10),'*','DisplayName','AFM-2 Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = 'Measured Distance vs Known Distance with False Positives In Water, Ambient vs Dark';
    %title({'Measured Distance vs Known Distance with False Positives'; 'In Water, Ambient vs Dark'})
    xlabel('Known Distance (m)')
    ylabel('Distance Error (m)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DLwe_AFM_Test1 = %s \n',Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLwe_AFM_%s -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex5/Ex6, AFM ', tests]);
    legend('Location','NW')
end

%% AFM Error smooth

try
    figure
    hold on
    plot(Data.Ex5.Smoothed.V1.Test1.Tag_7(:,1),Data.Ex5.Smoothed.V1.Test1.Tag_7(:,10),'*','DisplayName','AFM Detections Ambient')
    plot(Data.Ex6.Smoothed.V1.Test1.Tag_7(:,1),Data.Ex6.Smoothed.V1.Test1.Tag_7(:,10),'*','DisplayName','AFM-1 Detections Dark')
    plot(Data.Ex6.Smoothed.V2.Test1.Tag_7(:,1),Data.Ex6.Smoothed.V2.Test1.Tag_7(:,10),'*','DisplayName','AFM-2 Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = 'Measured Distance vs Known Distance without False Positives In Water, Ambient vs Dark';
    %title({'Measured Distance vs Known Distance without False Positives'; 'In Water, Ambient vs Dark'})
    xlabel('Known Distance (m)')
    ylabel('Distance Error (m)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DLwe_AFM_Test1S = %s \n',Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLwe_AFM_%sS -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex5/Ex6, AFM ', tests, 'S']);
    legend('Location','NW')
end
%% Tablet Error Raw

try
    figure
    hold on
    plot(Data.Ex5.Filtered.T.Test1.Tag_5(:,1),Data.Ex5.Filtered.T.Test1.Tag_5(:,10),'*','DisplayName','Tablet Detections Ambient')
    plot(Data.Ex6.Filtered.T.Test1.Tag_5(:,1),Data.Ex6.Filtered.T.Test1.Tag_5(:,10),'*','DisplayName','Tablet Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = 'Measured Distance vs Known Distance with False Positives In Water, Ambient vs Dark';
    %title({'Measured Distance vs Known Distance with False Positives'; 'In Water, Ambient vs Dark'})
    xlabel('Known Distance (m)')
    ylabel('Distance Error (m)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DLwe_T_%s = %s \n',tests,Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLwe_T_%s -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex5/Ex6, T ', tests]);
    legend('Location','NW')
end

%% Tablet error smooth

try
    figure
    hold on
    plot(Data.Ex5.Smoothed.T.Test1.Tag_5(:,1),Data.Ex5.Smoothed.T.Test1.Tag_5(:,10),'*','DisplayName','Tablet Detections Ambient')
    plot(Data.Ex6.Smoothed.T.Test1.Tag_5(:,1),Data.Ex6.Smoothed.T.Test1.Tag_5(:,10),'*','DisplayName','Tablet Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = 'Measured Distance vs Known Distance without False Positives In Water, Ambient vs Dark';
    %title({'Measured Distance vs Known Distance without False Positives'; 'In Water, Ambient vs Dark'})
    xlabel('Known Distance (m)')
    ylabel('Distance Error (m)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DLwe_T_%sS = %s \n',tests,Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLwe_T_%sS -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex5/Ex6, T ', tests, 'S']);
    legend('Location','NW')
end

tests = 'Test2';
try
    figure
    hold on
    plot(Data.Ex5.Filtered.V1.Test2.Tag_7(:,1),180-abs(Data.Ex5.Filtered.V1.Test2.Tag_7(:,7)),'*','DisplayName','AFM Detections Ambient')
    plot(Data.Ex6.Filtered.V1.Test2.Tag_7(:,1),180-abs(Data.Ex6.Filtered.V1.Test2.Tag_7(:,7)),'*','DisplayName','AFM-1 Detections Dark')
    plot(Data.Ex6.Filtered.V2.Test2.Tag_7(:,1),180-abs(Data.Ex6.Filtered.V2.Test2.Tag_7(:,7)),'*','DisplayName','AFM-2 Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle with False Positives At 2 Meters, In Water, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle with False Positives'; 'At 2 Meters, In Water, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DLw_AFM_Test2 = %s \n',Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLw_AFM_%s -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex5/Ex6, AFM ', tests]);
    legend('Location','NW')
end

try
    figure
    hold on
    plot(Data.Ex5.Smoothed.V1.Test2.Tag_7(:,1),180-abs(Data.Ex5.Smoothed.V1.Test2.Tag_7(:,7)),'*','DisplayName','AFM Detections Ambient')
    plot(Data.Ex6.Smoothed.V1.Test2.Tag_7(:,1),180-abs(Data.Ex6.Smoothed.V1.Test2.Tag_7(:,7)),'*','DisplayName','AFM-1 Detections Dark')
    plot(Data.Ex6.Smoothed.V2.Test2.Tag_7(:,1),180-abs(Data.Ex6.Smoothed.V2.Test2.Tag_7(:,7)),'*','DisplayName','AFM-2 Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle without False Positives At 2 Meters, In Water, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle without False Positives'; 'At 2 Meters, In Water, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DLw_AFM_Test2S = %s \n',Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLw_AFM_%sS -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex5/Ex6, AFM ', tests, 'S']);
    legend('Location','NW')
end


%%

try
    figure
    hold on
    plot(Data.Ex5.Filtered.T.Test2.Tag_5(:,1),180-abs(Data.Ex5.Filtered.T.Test2.Tag_5(:,7)),'*','DisplayName','Tablet Detections Ambient')
    plot(Data.Ex6.Filtered.T.Test2.Tag_5(:,1),180-abs(Data.Ex6.Filtered.T.Test2.Tag_5(:,7)),'*','DisplayName','Tablet Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle with False Positives At 2 Meters, In Water, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle with False Positives'; 'At 2 Meters, In Water, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DLw_T_%s = %s \n',tests,Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLw_T_%s -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex5/Ex6, T ', tests]);
    legend('Location','NW')
end

try
    figure
    hold on
    plot(Data.Ex5.Smoothed.T.Test2.Tag_5(:,1),180-abs(Data.Ex5.Smoothed.T.Test2.Tag_5(:,7)),'*','DisplayName','Tablet Detections Ambient')
    plot(Data.Ex6.Smoothed.T.Test2.Tag_5(:,1),180-abs(Data.Ex6.Smoothed.T.Test2.Tag_5(:,7)),'*','DisplayName','Tablet Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle without False Positives At 2 Meters, In Water, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle without False Positives'; 'At 2 Meters, In Water, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DLw_T_%sS = %s \n',tests,Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLw_T_%sS -png -r300 -painters',tests))
    end
    
catch
    warning(['No Detection at Ex5/Ex6, T ', tests, 'S']);
    legend('Location','NW')
end

tests = 'Test3';
try
    figure
    hold on
    plot(Data.Ex5.Filtered.V1.Test3.Tag_7(:,1),180-abs(Data.Ex5.Filtered.V1.Test3.Tag_7(:,7)),'*','DisplayName','AFM Detections Ambient')
    plot(Data.Ex6.Filtered.V1.Test3.Tag_7(:,1),180-abs(Data.Ex6.Filtered.V1.Test3.Tag_7(:,7)),'*','DisplayName','AFM-1 Detections Dark')
    plot(Data.Ex6.Filtered.V2.Test3.Tag_7(:,1),180-abs(Data.Ex6.Filtered.V2.Test3.Tag_7(:,7)),'*','DisplayName','AFM-2 Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle with False Positives At 4 Meters, In Water, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle with False Positives'; 'At 4 Meters, In Water, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DLw_AFM_Test3 = %s \n',Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLw_AFM_%s -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex5/Ex6, AFM ', tests]);
    legend('Location','NW')
end

try
    figure
    hold on
    plot(Data.Ex5.Smoothed.V1.Test3.Tag_7(:,1),180-abs(Data.Ex5.Smoothed.V1.Test3.Tag_7(:,7)),'*','DisplayName','AFM Detections Ambient')
    plot(Data.Ex6.Smoothed.V1.Test3.Tag_7(:,1),180-abs(Data.Ex6.Smoothed.V1.Test3.Tag_7(:,7)),'*','DisplayName','AFM-1 Detections Dark')
    plot(Data.Ex6.Smoothed.V2.Test3.Tag_7(:,1),180-abs(Data.Ex6.Smoothed.V2.Test3.Tag_7(:,7)),'*','DisplayName','AFM-2 Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle without False Positives At 4 Meters, In Water, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle without False Positives'; 'At 4 Meters, In Water, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DLw_AFM_Test3S = %s \n',Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLw_AFM_%sS -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex5/Ex6, AFM ', tests, 'S']);
    legend('Location','NW')
end


%%

try
    figure
    hold on
    plot(Data.Ex5.Filtered.T.Test3.Tag_5(:,1),180-abs(Data.Ex5.Filtered.T.Test3.Tag_5(:,7)),'*','DisplayName','Tablet Detections Ambient')
    plot(Data.Ex6.Filtered.T.Test3.Tag_5(:,1),180-abs(Data.Ex6.Filtered.T.Test3.Tag_5(:,7)),'*','DisplayName','Tablet Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle with False Positives At 4 Meters, In Water, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle with False Positives'; 'At 4 Meters, In Water, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DLw_T_%s = %s \n',tests,Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLw_T_%s -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex5/Ex6, T ', tests]);
    legend('Location','NW')
end

try
    figure
    hold on
    plot(Data.Ex5.Smoothed.T.Test3.Tag_5(:,1),180-abs(Data.Ex5.Smoothed.T.Test3.Tag_5(:,7)),'*','DisplayName','Tablet Detections Ambient')
    plot(Data.Ex6.Smoothed.T.Test3.Tag_5(:,1),180-abs(Data.Ex6.Smoothed.T.Test3.Tag_5(:,7)),'*','DisplayName','Tablet Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle without False Positives At 4 Meters, In Water, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle without False Positives'; 'At 4 Meters, In Water, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DLw_T_%sS = %s \n',tests,Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLw_T_%sS -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex5/Ex6, T ', tests, 'S']);
    legend('Location','NW')
end

tests = 'Test4';
try
    figure
    hold on
    plot(Data.Ex5.Filtered.V1.Test4.Tag_7(:,1),180-abs(Data.Ex5.Filtered.V1.Test4.Tag_7(:,7)),'*','DisplayName','AFM Detections Ambient')
    plot(Data.Ex6.Filtered.V1.Test4.Tag_7(:,1),180-abs(Data.Ex6.Filtered.V1.Test4.Tag_7(:,7)),'*','DisplayName','AFM-1 Detections Dark')
    plot(Data.Ex6.Filtered.V2.Test4.Tag_7(:,1),180-abs(Data.Ex6.Filtered.V2.Test4.Tag_7(:,7)),'*','DisplayName','AFM-2 Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle with False Positives At 6 Meters, In Water, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle with False Positives'; 'At 6 Meters, In Water, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DLw_AFM_Test4 = %s \n',Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLw_AFM_%s -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex5/Ex6, AFM ', tests]);
    legend('Location','NW')
end

try
    figure
    hold on
    plot(Data.Ex5.Smoothed.V1.Test4.Tag_7(:,1),180-abs(Data.Ex5.Smoothed.V1.Test4.Tag_7(:,7)),'*','DisplayName','AFM Detections Ambient')
    plot(Data.Ex6.Smoothed.V1.Test4.Tag_7(:,1),180-abs(Data.Ex6.Smoothed.V1.Test4.Tag_7(:,7)),'*','DisplayName','AFM-1 Detections Dark')
    plot(Data.Ex6.Smoothed.V2.Test4.Tag_7(:,1),180-abs(Data.Ex6.Smoothed.V2.Test4.Tag_7(:,7)),'*','DisplayName','AFM-2 Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle without False Positives At 6 Meters, In Water, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle without False Positives'; 'At 6 Meters, In Water, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DLw_AFM_Test4S = %s \n',Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLw_AFM_%sS -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex5/Ex6, AFM ', tests, 'S']);
    legend('Location','NW')
end


%%

try
    figure
    hold on
    plot(Data.Ex5.Filtered.T.Test4.Tag_5(:,1),180-abs(Data.Ex5.Filtered.T.Test4.Tag_5(:,7)),'*','DisplayName','Tablet Detections Ambient')
    plot(Data.Ex6.Filtered.T.Test4.Tag_5(:,1),180-abs(Data.Ex6.Filtered.T.Test4.Tag_5(:,7)),'*','DisplayName','Tablet Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle with False Positives At 6 Meters, In Water, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle with False Positives'; 'At 6 Meters, In Water, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DLw_T_%s = %s \n',tests,Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLw_T_%s -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex5/Ex6, T ', tests]);
    legend('Location','NW')
end

try
    figure
    hold on
    plot(Data.Ex5.Smoothed.T.Test4.Tag_5(:,1),180-abs(Data.Ex5.Smoothed.T.Test4.Tag_5(:,7)),'*','DisplayName','Tablet Detections Ambient')
    plot(Data.Ex6.Smoothed.T.Test4.Tag_5(:,1),180-abs(Data.Ex6.Smoothed.T.Test4.Tag_5(:,7)),'*','DisplayName','Tablet Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle without False Positives At 6 Meters, In Water, Ambient vs Dark'];
    %title({'Measured Angle vs Known Angle without False Positives'; 'At 6 Meters, In Water, Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    plotnorm()
    fprintf('DLw_T_%sS = %s \n',tests,Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLw_T_%sS -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex5/Ex6, T ', tests, 'S']);
    legend('Location','NW')
end

%% Ambient Dark Detections comparison AFM

%% Raw Error bars Light Dark AFM Water

EXPname = {'Ex5'; 'Ex6'};
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
Tsave = ['Distance Error vs ', TESTtitle, ' with False Positives, Water LD'];
%title({['Distance Error vs ', TESTtitle, ' with False Positives']; 'Water LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DLw_Error_AFM_ = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DLw_Error_AFM_ -png -r300 -painters'))
end

%% Smooth Error bars Light Dark AFM Water

EXPname = {'Ex5'; 'Ex6'};
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
Tsave = ['Distance Error vs ', TESTtitle, ' without False Positives, Water LD'];
%title({['Distance Error vs ', TESTtitle, ' without False Positives']; 'Water LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DLw_Error_AFM_S = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DLw_Error_AFM_S -png -r300 -painters'))
end


%% Raw detects Light Dark AFM Water

EXPname = {'Ex5'; 'Ex6'};
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
Tsave = ['Detections vs ', TESTtitle, ' with False Positives, Water LD'];
%title({['Detections vs ', TESTtitle, ' with False Positives']; 'Water LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DLw_Detect_AFM = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DLw_Detect_AFM -png -r300 -painters'))
end

%% Smooth detects Light Dark AFM Water

EXPname = {'Ex5'; 'Ex6'};
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
Tsave = ['Detections vs ', TESTtitle, ' without False Positives, Water LD'];
%title({['Detections vs ', TESTtitle, ' without False Positives']; 'Water LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DLw_Detect_AFM_S = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DLw_Detect_AFM_S -png -r300 -painters'))
end

%% Raw detects Light Dark AFM Water Test 2

EXPname = {'Ex5'; 'Ex6'};
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
Tsave = ['Detections vs ', TESTtitle, ' with False Positives, Water LD'];
%title({['Detections vs ', TESTtitle, ' with False Positives']; 'Water LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DLw_Detect_AFM = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DLw_Detect2_AFM -png -r300 -painters'))
end

%% Smooth detects Light Dark AFM Water Test 2

EXPname = {'Ex5'; 'Ex6'};
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
Tsave = ['Detections vs ', TESTtitle, ' without False Positives, Water LD'];
%title({['Detections vs ', TESTtitle, ' without False Positives']; 'Water LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DLw_Detect_AFM_S = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DLw_Detect2_AFM_S -png -r300 -painters'))
end

%% Ambient Dark Detections comparison Tab

%% Raw Error bars Light Dark Tab Water

EXPname = {'Ex5'; 'Ex6'};
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
Tsave = ['Distance Error vs ', TESTtitle, ' with False Positives, Water LD'];
%title({['Distance Error vs ', TESTtitle, ' with False Positives']; 'Water LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DLw_Error_T_ = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DLw_Error_T_ -png -r300 -painters'))
end

%% Smooth Error bars Light Dark tab Water

EXPname = {'Ex5'; 'Ex6'};
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
Tsave = ['Distance Error vs ', TESTtitle, ' without False Positives, Water LD'];
%title({['Distance Error vs ', TESTtitle, ' without False Positives']; 'Water LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DLw_Error_T_S = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DLw_Error_T_S -png -r300 -painters'))
end


%% Raw detects Light Dark tab Water

EXPname = {'Ex5'; 'Ex6'};
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
Tsave = ['Detections vs ', TESTtitle, ' with False Positives, Water LD'];
%title({['Detections vs ', TESTtitle, ' with False Positives']; 'Water LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DLw_Detect_T = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DLw_Detect_T -png -r300 -painters'))
end

%% Smooth detects Light Dark tab Water

EXPname = {'Ex5'; 'Ex6'};
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
Tsave = ['Detections vs ', TESTtitle, ' without False Positives, Water LD'];
%title({['Detections vs ', TESTtitle, ' without False Positives']; 'Water LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DLw_Detect_T_S = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DLw_Detect_T_S -png -r300 -painters'))
end

%% Raw detects Light Dark tab Water Test 2

EXPname = {'Ex5'; 'Ex6'};
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
Tsave = ['Detections vs ', TESTtitle, ' with False Positives, Water LD'];
%title({['Detections vs ', TESTtitle, ' with False Positives']; 'Water LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DLw_Detect_T = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DLw_Detect2_T -png -r300 -painters'))
end

%% Smooth detects Light Dark tab Water Test 2

EXPname = {'Ex5'; 'Ex6'};
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
Tsave = ['Detections vs ', TESTtitle, ' without False Positives, Water LD'];
%title({['Detections vs ', TESTtitle, ' without False Positives']; 'Water LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('DLw_Detect_T_S = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DLw_Detect2_T_S -png -r300 -painters'))
end

