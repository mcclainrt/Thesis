% PHASE II

% Only addition would be to make each tag same color for all plots

close all

EXPname = fieldnames(Data);

for k = 1:numel(EXPname)
    if contains(EXPname{k},'Ex1') | contains(EXPname{k},'Ex4') | contains(EXPname{k},'Ex7')
        continue
    else
               
        switch EXPname{k}
            case 'Ex2'
                EXPtype = ' In Air, Ambient Lighting';
            case 'Ex3'
                EXPtype = ' In Air, No Lighting';
            case 'Ex5'
                EXPtype = ' In Water, Ambient Lighting';
            case 'Ex6'
                EXPtype = ' In Water, No Lighting';
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
                plot(Data.(EXPname{k}).Filtered.(AFMname{m}).Test1.(ID)(:,1),Data.(EXPname{k}).Filtered.(AFMname{m}).Test1.(ID)(:,6),'*','DisplayName',[TagType ' Detections'])
            catch
                warning(['No Detection at ', EXPname{k}, ', ', AFMname{m}, ', Test1']);
                continue
            end
        end

        gcf();
        legend('Location','NW')
        title({'Measured distance vs Known Distance with False Positives'; EXPtype})
        xlabel('Known Dist (m)')
        ylabel('Measured Dist (m)')
        grid on
        hold off

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
        title({'Measured Angle vs Known Angle with False Positives'; ['At 2 Meters ' EXPtype]})
        xlabel('Known Angle (deg)')
        ylabel('Measured Angle (deg)')
        grid on
        hold off

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
                plot(Data.(EXPname{k}).Filtered.(AFMname{m}).Test3.(ID)(:,1),180-abs(Data.(EXPname{k}).Filtered.(AFMname{m}).Test3.(ID)(:,7)),'*','DisplayName',[TagType ' Detections'])
            catch
                warning(['No Detection at ', EXPname{k}, ', ', AFMname{m}, ', Test3']);
                continue
            end
        
        end

        gcf();
        legend('Location','NW')
        title({'Measured Angle vs Known Angle with False Positives'; ['At 4 Meters ' EXPtype]})
        xlabel('Known Angle (deg)')
        ylabel('Measured Angle (deg)')
        grid on
        hold off

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
                plot(Data.(EXPname{k}).Filtered.(AFMname{m}).Test4.(ID)(:,1),180-abs(Data.(EXPname{k}).Filtered.(AFMname{m}).Test4.(ID)(:,7)),'*','DisplayName',[TagType ' Detections'])
            catch
                warning(['No Detection at ', EXPname{k}, ', ', AFMname{m}, ', Test4']);
                continue
            end
        end

        gcf();
        legend('Location','NW')
        title({'Measured Angle vs Known Angle with False Positives'; ['At 6 Meters' EXPtype]})
        xlabel('Known Angle (deg)')
        ylabel('Measured Angle (deg)')
        grid on
        hold off
        
    end
end


%%
for k = 1:numel(EXPname)
    if contains(EXPname{k},'Ex1') | contains(EXPname{k},'Ex4') | contains(EXPname{k},'Ex7')
        continue
    else
               
        switch EXPname{k}
            case 'Ex2'
                EXPtype = ' In Air, Ambient Lighting';
            case 'Ex3'
                EXPtype = ' In Air, No Lighting';
            case 'Ex5'
                EXPtype = ' In Water, Ambient Lighting';
            case 'Ex6'
                EXPtype = ' In Water, No Lighting';
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
                plot(Data.(EXPname{k}).Smoothed.(AFMname{m}).Test1.(ID)(:,1),Data.(EXPname{k}).Smoothed.(AFMname{m}).Test1.(ID)(:,6),'*','DisplayName',[TagType ' Detections'])
            catch
                warning(['No Detection at ', EXPname{k}, ', ', AFMname{m}, ', Test1']);
                continue
            end
        end

        gcf();
        legend('Location','NW')
        title({'Measured distance vs Known Distance without False Positives'; EXPtype})
        xlabel('Known Dist (m)')
        ylabel('Measured Dist (m)')
        grid on
        hold off

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
                plot(Data.(EXPname{k}).Smoothed.(AFMname{m}).Test2.(ID)(:,1),180-abs(Data.(EXPname{k}).Smoothed.(AFMname{m}).Test2.(ID)(:,7)),'*','DisplayName',[TagType ' Detections'])
            catch
                warning(['No Detection at ', EXPname{k}, ', ', AFMname{m}, ', Test2']);
                continue
            end
        end

        gcf();
        legend('Location','NW')
        title({'Measured Angle vs Known Angle without False Positives'; ['At 2 Meters ' EXPtype]})
        xlabel('Known Angle (deg)')
        ylabel('Measured Angle (deg)')
        grid on
        hold off

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
                plot(Data.(EXPname{k}).Smoothed.(AFMname{m}).Test3.(ID)(:,1),180-abs(Data.(EXPname{k}).Smoothed.(AFMname{m}).Test3.(ID)(:,7)),'*','DisplayName',[TagType ' Detections'])
            catch
                warning(['No Detection at ', EXPname{k}, ', ', AFMname{m}, ', Test3']);
                continue
            end
        end

        gcf();
        legend('Location','NW')
        title({'Measured Angle vs Known Angle without False Positives'; ['At 4 Meters ' EXPtype]})
        xlabel('Known Angle (deg)')
        ylabel('Measured Angle (deg)')
        grid on
        hold off

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
                plot(Data.(EXPname{k}).Smoothed.(AFMname{m}).Test4.(ID)(:,1),180-abs(Data.(EXPname{k}).Smoothed.(AFMname{m}).Test4.(ID)(:,7)),'*','DisplayName',[TagType ' Detections'])
            catch
                warning(['No Detection at ', EXPname{k}, ', ', AFMname{m}, ', Test4']);
                continue
            end
        end

        gcf();
        legend('Location','NW')
        title({'Measured Angle vs Known Angle without False Positives'; ['At 6 Meters' EXPtype]})
        xlabel('Known Angle (deg)')
        ylabel('Measured Angle (deg)')
        grid on
        hold off
        
    end
end


%%


% %% Test 1
% 
% Paper1 = Data.Ex2.Filtered.P.Test1.Tag_5;
% Paper2 = Data.Ex2.Filtered.P.Test2.Tag_5;
% Paper3 = Data.Ex2.Filtered.P.Test3.Tag_5;
% Paper4 = Data.Ex2.Filtered.P.Test4.Tag_5;
% 
% Vinyl1 = Data.Ex2.Filtered.V1.Test1.Tag_7;
% Vinyl2 = Data.Ex2.Filtered.V1.Test2.Tag_7;
% Vinyl3 = Data.Ex2.Filtered.V1.Test3.Tag_7;
% Vinyl4 = Data.Ex2.Filtered.V1.Test4.Tag_7;
% 
% Tablet1 = Data.Ex2.Filtered.T.Test1.Tag_5;
% Tablet2 = Data.Ex2.Filtered.T.Test2.Tag_5;
% Tablet3 = Data.Ex2.Filtered.T.Test3.Tag_5;
% Tablet4 = Data.Ex2.Filtered.T.Test4.Tag_5;
% 
% 
% Paper1S = Data.Ex2.Smoothed.P.Test1.Tag_5;
% Paper2S = Data.Ex2.Smoothed.P.Test2.Tag_5;
% Paper3S = Data.Ex2.Smoothed.P.Test3.Tag_5;
% Paper4S = Data.Ex2.Smoothed.P.Test4.Tag_5;
% 
% Vinyl1S = Data.Ex2.Smoothed.V1.Test1.Tag_7;
% Vinyl2S = Data.Ex2.Smoothed.V1.Test2.Tag_7;
% Vinyl3S = Data.Ex2.Smoothed.V1.Test3.Tag_7;
% Vinyl4S = Data.Ex2.Smoothed.V1.Test4.Tag_7;
% 
% Tablet1S = Data.Ex2.Smoothed.T.Test1.Tag_5;
% Tablet2S = Data.Ex2.Smoothed.T.Test2.Tag_5;
% Tablet3S = Data.Ex2.Smoothed.T.Test3.Tag_5;
% Tablet4S = Data.Ex2.Smoothed.T.Test4.Tag_5;
% 
% 
% figure
% hold on
% 
% plot(Paper1(:,1),Paper1(:,6),'*','DisplayName','Paper Tag')
% plot(Vinyl1(:,1),Vinyl1(:,6),'*','DisplayName','Vinyl Tag')
% plot(Tablet1(:,1),Tablet1(:,6),'*','DisplayName','Tablet Tag')
% 
% gcf();
% legend('Location','NW')
% title({'Distance vs Distance with False Positives'; 'In Air, Ambient Lighting'})
% xlabel('Known Dist (m)')
% ylabel('Detections')
% grid on
% hold off
% 
% % Without outliers
% 
% figure
% hold on
% 
% plot(Paper1S(:,1),Paper1S(:,6),'*','DisplayName','Paper Tag')
% plot(Vinyl1S(:,1),Vinyl1S(:,6),'*','DisplayName','Vinyl Tag')
% plot(Tablet1S(:,1),Tablet1S(:,6),'*','DisplayName','Tablet Tag')
% 
% gcf();
% legend('Location','NW')
% title({'Distance vs Distance with False Positives'; 'In Air, Ambient Lighting'})
% xlabel('Known Dist (m)')
% ylabel('Detections')
% grid on
% hold off
% 
% % for a fit line:
% %     coeffs = polyfit(x, y, 1);
% %     % Get fitted values
% %     fittedX = linspace(min(x), max(x), 200);
% %     fittedY = polyval(coeffs, fittedX);
% %     % Plot the fitted line
% %     hold on;
% %     plot(fittedX, fittedY, 'r-', 'LineWidth', 3);
% 
% %% Test 2
% 
% TR = Data.Ex1.Results.P.Test2;
% 
% Plnames = fieldnames(TR);
% 
% figure
% hold on
% for k = 1:numel(Plnames)
%     plot(TR.(Plnames{k})(:,1),TR.(Plnames{k})(:,6),'-*','DisplayName',string(join([split(Plnames{k},'_')','Detections'])))
%     
% end
% gcf();
% legend('Location','SW')
% title({'Detections vs Angle without False Positives'; '6 meters In Air, Ambient Lighting'})
% xlabel('Known Dist (m)')
% ylabel('Measured Dist (m)')
% grid on
% hold off
% 
% % Without outliers
% figure
% hold on
% for k = 1:numel(Plnames)
%     plot(TR.(Plnames{k})(:,1),TR.(Plnames{k})(:,7),'-*','DisplayName',string(join([split(Plnames{k},'_')','Detections'])))
%     
% end
% gcf();
% legend('Location','SW')
% title({'Detections vs Angle without False Positives'; '6 meters In Air, Ambient Lighting'})
% xlabel('Known Dist (m)')
% ylabel('Measured Dist (m)')
% grid on
% hold off
% 
% %% Test 3
% 
% TR = Data.Ex1.Results.P.Test3;
% 
% Plnames = fieldnames(TR);
% 
% figure
% hold on
% for k = 1:numel(Plnames)
%     plot(TR.(Plnames{k})(:,1),TR.(Plnames{k})(:,6),'-*','DisplayName',string(join([split(Plnames{k},'_')','Detections'])))
%     
% end
% gcf();
% legend('Location','SW')
% title({'Detections vs Angle with False Positives'; '4 meters In Air, Ambient Lighting'})
% xlabel('Known Dist (m)')
% ylabel('Measured Dist (m)')
% grid on
% hold off
% 
% % Without outliers
% figure
% hold on
% for k = 1:numel(Plnames)
%     plot(TR.(Plnames{k})(:,1),TR.(Plnames{k})(:,7),'-*','DisplayName',string(join([split(Plnames{k},'_')','Detections'])))
%     
% end
% gcf();
% legend('Location','SW')
% title({'Detections vs Angle without False Positives'; '4 meters In Air, Ambient Lighting'})
% xlabel('Known Dist (m)')
% ylabel('Measured Dist (m)')
% grid on
% hold off
% 
% %% Test 4
% 
% TR = Data.Ex1.Results.P.Test4;
% 
% Plnames = fieldnames(TR);
% 
% figure
% hold on
% for k = 1:numel(Plnames)
%     plot(TR.(Plnames{k})(:,1),TR.(Plnames{k})(:,6),'-*','DisplayName',string(join([split(Plnames{k},'_')','Detections'])))
%     
% end
% gcf();
% legend('Location','SW')
% title({'Detections vs Angle with False Positives'; '2 meters In Air, Ambient Lighting'})
% xlabel('Known Dist (m)')
% ylabel('Measured Dist (m)')
% grid on
% hold off
% 
% % Without outliers
% figure
% hold on
% for k = 1:numel(Plnames)
%     plot(TR.(Plnames{k})(:,1),TR.(Plnames{k})(:,7),'-*','DisplayName',string(join([split(Plnames{k},'_')','Detections'])))
%     
% end
% gcf();
% legend('Location','SW')
% title({'Detections vs Angle without False Positives'; '2 meters In Air, Ambient Lighting'})
% xlabel('Known Dist (m)')
% ylabel('Measured Dist (m)')
% grid on
% hold off