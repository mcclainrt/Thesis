close all
tests = 'Test2';
try
    figure
    hold on
    plot(Data.Ex2.Filtered.V1.Test2.Tag_7(:,1),180-abs(Data.Ex2.Filtered.V1.Test2.Tag_7(:,7)),'*','DisplayName','AFM-1 Detections Ambient')
    plot(Data.Ex3.Filtered.V1.Test2.Tag_7(:,1),180-abs(Data.Ex3.Filtered.V1.Test2.Tag_7(:,7)),'*','DisplayName','AFM-1 Detections Dark')
    plot(Data.Ex3.Filtered.V2.Test2.Tag_7(:,1),180-abs(Data.Ex3.Filtered.V2.Test2.Tag_7(:,7)),'*','DisplayName','AFM-2 Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle with False Positives At 2 Meters In Air Ambient vs Dark'];
    title({'Measured Angle vs Known Angle with False Positives'; 'At 2 Meters In Air Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    set(gcf,'color','w');
    fprintf('DL_AFM_Test2 = %s \n',Tsave)
    eval(sprintf('export_fig DL_AFM_%s -png -r300 -painters',tests))

catch
    warning(['No Detection at Ex2/Ex3, AFM ', tests]);
    legend('Location','NW')
end

try
    figure
    hold on
    plot(Data.Ex2.Smoothed.V1.Test2.Tag_7(:,1),180-abs(Data.Ex2.Smoothed.V1.Test2.Tag_7(:,7)),'*','DisplayName','AFM-1 Detections Ambient')
    plot(Data.Ex3.Smoothed.V1.Test2.Tag_7(:,1),180-abs(Data.Ex3.Smoothed.V1.Test2.Tag_7(:,7)),'*','DisplayName','AFM-1 Detections Dark')
    plot(Data.Ex3.Smoothed.V2.Test2.Tag_7(:,1),180-abs(Data.Ex3.Smoothed.V2.Test2.Tag_7(:,7)),'*','DisplayName','AFM-2 Detections Dark')

    gcf();
    legend('Location','NW')
    Tsave = ['Measured Angle vs Known Angle without False Positives At 2 Meters In Air Ambient vs Dark'];
    title({'Measured Angle vs Known Angle without False Positives'; 'At 2 Meters In Air Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    set(gcf,'color','w');
    fprintf('DL_AFM_Test2S = %s \n',Tsave)
    eval(sprintf('export_fig DL_AFM_%sS -png -r300 -painters',tests))

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
    Tsave = ['Measured Angle vs Known Angle with False Positives At 2 Meters In Air Ambient vs Dark'];
    title({'Measured Angle vs Known Angle with False Positives'; 'At 2 Meters In Air Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    set(gcf,'color','w');
    fprintf('DL_T_%s = %s \n',tests,Tsave)
    eval(sprintf('export_fig DL_T_%s -png -r300 -painters',tests))

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
    Tsave = ['Measured Angle vs Known Angle without False Positives At 2 Meters In Air Ambient vs Dark'];
    title({'Measured Angle vs Known Angle without False Positives'; 'At 2 Meters In Air Ambient vs Dark'})
    xlabel('Known Angle (deg)')
    ylabel('Measured Angle (deg)')
    grid on
    hold off
    % Set the background color to white
    set(gcf,'color','w');
    fprintf('DL_T_%sS = %s \n',tests,Tsave)
    eval(sprintf('export_fig DL_T_%sS -png -r300 -painters',tests))

catch
    warning(['No Detection at Ex2/Ex3, T ', tests, 'S']);
    legend('Location','NW')
end