% close all

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
    set(gcf,'color','w');
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
    set(gcf,'color','w');
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
    set(gcf,'color','w');
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
    set(gcf,'color','w');
    fprintf('DLe_T_%sS = %s \n',tests,Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLe_T_%sS -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex2/Ex3, T ', tests, 'S']);
    legend('Location','NW')
end