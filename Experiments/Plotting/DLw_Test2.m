close all
tests = 'Test2';
try
    figure
    hold on
    plot(Data.Ex5.Filtered.V1.Test2.Tag_7(:,1),180-abs(Data.Ex5.Filtered.V1.Test2.Tag_7(:,7)),'*','DisplayName','AFM-1 Detections Ambient')
    plot(Data.Ex6.Filtered.V1.Test2.Tag_7(:,1),180-abs(Data.Ex6.Filtered.V1.Test2.Tag_7(:,7)),'*','DisplayName','AFM-1 Detections Dark')
    plot(Data.Ex6.Filtered.V2.Test2.Tag_7(:,1),180-abs(Data.Ex6.Filtered.V2.Test2.Tag_7(:,7)),'*','DisplayName','AFM-2 Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle with False Positives At 2 Meters In Water Ambient vs Dark'];
    title({'Measured Angle vs Known Angle with False Positives'; 'At 2 Meters In Water Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    set(gcf,'color','w');
    fprintf('DLw_AFM_Test2 = %s \n',Tsave)
    eval(sprintf('export_fig DLw_AFM_%s -png -r300 -painters',tests))

catch
    warning(['No Detection at Ex5/Ex6, AFM ', tests]);
    legend('Location','NW')
end

try
    figure
    hold on
    plot(Data.Ex5.Smoothed.V1.Test2.Tag_7(:,1),180-abs(Data.Ex5.Smoothed.V1.Test2.Tag_7(:,7)),'*','DisplayName','AFM-1 Detections Ambient')
    plot(Data.Ex6.Smoothed.V1.Test2.Tag_7(:,1),180-abs(Data.Ex6.Smoothed.V1.Test2.Tag_7(:,7)),'*','DisplayName','AFM-1 Detections Dark')
    plot(Data.Ex6.Smoothed.V2.Test2.Tag_7(:,1),180-abs(Data.Ex6.Smoothed.V2.Test2.Tag_7(:,7)),'*','DisplayName','AFM-2 Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle without False Positives At 2 Meters In Water Ambient vs Dark'];
    title({'Measured Angle vs Known Angle without False Positives'; 'At 2 Meters In Water Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    set(gcf,'color','w');
    fprintf('DLw_AFM_Test2S = %s \n',Tsave)
    eval(sprintf('export_fig DLw_AFM_%sS -png -r300 -painters',tests))

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
    Tsave = ['Measured Angle vs Known Angle with False Positives At 2 Meters In Water Ambient vs Dark'];
    title({'Measured Angle vs Known Angle with False Positives'; 'At 2 Meters In Water Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    set(gcf,'color','w');
    fprintf('DLw_T_%s = %s \n',tests,Tsave)
    eval(sprintf('export_fig DLw_T_%s -png -r300 -painters',tests))

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
    Tsave = ['Measured Angle vs Known Angle without False Positives At 2 Meters In Water Ambient vs Dark'];
    title({'Measured Angle vs Known Angle without False Positives'; 'At 2 Meters In Water Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    set(gcf,'color','w');
    fprintf('DLw_T_%sS = %s \n',tests,Tsave)
    eval(sprintf('export_fig DLw_T_%sS -png -r300 -painters',tests))

catch
    warning(['No Detection at Ex5/Ex6, T ', tests, 'S']);
    legend('Location','NW')
end