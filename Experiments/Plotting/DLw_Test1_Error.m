% close all
tests = 'Test1';
try
    figure
    hold on
    plot(Data.Ex5.Filtered.V1.Test1.Tag_7(:,1),Data.Ex5.Filtered.V1.Test1.Tag_7(:,10),'*','DisplayName','AFM Detections Ambient')
    plot(Data.Ex6.Filtered.V1.Test1.Tag_7(:,1),Data.Ex6.Filtered.V1.Test1.Tag_7(:,10),'*','DisplayName','AFM-1 Detections Dark')
    plot(Data.Ex6.Filtered.V2.Test1.Tag_7(:,1),Data.Ex6.Filtered.V2.Test1.Tag_7(:,10),'*','DisplayName','AFM-2 Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = 'Measured Distance vs Known Distance with False Positives In Water, Ambient vs Dark';
    title({'Measured Distance vs Known Distance with False Positives'; 'In Water, Ambient vs Dark'})
    xlabel('Known Dist (m)')
    ylabel('Measured Dist (m)')
    grid on
    hold off
    % Set the background color to white
    set(gcf,'color','w');
    fprintf('DLwe_AFM_Test1 = %s \n',Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLwe_AFM_%s -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex5/Ex6, AFM ', tests]);
    legend('Location','NW')
end

try
    figure
    hold on
    plot(Data.Ex5.Smoothed.V1.Test1.Tag_7(:,1),Data.Ex5.Smoothed.V1.Test1.Tag_7(:,10),'*','DisplayName','AFM Detections Ambient')
    plot(Data.Ex6.Smoothed.V1.Test1.Tag_7(:,1),Data.Ex6.Smoothed.V1.Test1.Tag_7(:,10),'*','DisplayName','AFM-1 Detections Dark')
    plot(Data.Ex6.Smoothed.V2.Test1.Tag_7(:,1),Data.Ex6.Smoothed.V2.Test1.Tag_7(:,10),'*','DisplayName','AFM-2 Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = 'Measured Distance vs Known Distance without False Positives In Water, Ambient vs Dark';
    title({'Measured Distance vs Known Distance without False Positives'; 'In Water, Ambient vs Dark'})
    xlabel('Known Dist (m)')
    ylabel('Measured Dist (m)')
    grid on
    hold off
    % Set the background color to white
    set(gcf,'color','w');
    fprintf('DLwe_AFM_Test1S = %s \n',Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLwe_AFM_%sS -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex5/Ex6, AFM ', tests, 'S']);
    legend('Location','NW')
end


%%

try
    figure
    hold on
    plot(Data.Ex5.Filtered.T.Test1.Tag_5(:,1),Data.Ex5.Filtered.T.Test1.Tag_5(:,10),'*','DisplayName','Tablet Detections Ambient')
    plot(Data.Ex6.Filtered.T.Test1.Tag_5(:,1),Data.Ex6.Filtered.T.Test1.Tag_5(:,10),'*','DisplayName','Tablet Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = 'Measured Distance vs Known Distance with False Positives In Water, Ambient vs Dark';
    title({'Measured Distance vs Known Distance with False Positives'; 'In Water, Ambient vs Dark'})
    xlabel('Known Dist (m)')
    ylabel('Measured Dist (m)')
    grid on
    hold off
    % Set the background color to white
    set(gcf,'color','w');
    fprintf('DLwe_T_%s = %s \n',tests,Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLwe_T_%s -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex5/Ex6, T ', tests]);
    legend('Location','NW')
end

try
    figure
    hold on
    plot(Data.Ex5.Smoothed.T.Test1.Tag_5(:,1),Data.Ex5.Smoothed.T.Test1.Tag_5(:,10),'*','DisplayName','Tablet Detections Ambient')
    plot(Data.Ex6.Smoothed.T.Test1.Tag_5(:,1),Data.Ex6.Smoothed.T.Test1.Tag_5(:,10),'*','DisplayName','Tablet Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = 'Measured Distance vs Known Distance without False Positives In Water, Ambient vs Dark';
    title({'Measured Distance vs Known Distance without False Positives'; 'In Water, Ambient vs Dark'})
    xlabel('Known Dist (m)')
    ylabel('Measured Dist (m)')
    grid on
    hold off
    % Set the background color to white
    set(gcf,'color','w');
    fprintf('DLwe_T_%sS = %s \n',tests,Tsave)
    if exportfigs == 1
    eval(sprintf('export_fig DLwe_T_%sS -png -r300 -painters',tests))
    end
catch
    warning(['No Detection at Ex5/Ex6, T ', tests, 'S']);
    legend('Location','NW')
end