% PVT plots

% Only addition would be to make each tag same color for all plots

% used export_fig to save all images, currently commented out

% Set the default text sizes for the root figure
set(0,'defaulttextfontsize',20);
set(0,'defaultaxesfontsize',12);

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
        Tsave = ['Measured distance vs Known Distance with False Positives' EXPtype];
        title({'Measured distance vs Known Distance with False Positives'; EXPtype})
        xlabel('Known Dist (m)')
        ylabel('Measured Dist (m)')
        grid on
        hold off
        % Set the background color to white
        set(gcf,'color','w');
        fprintf('PVT_%s_Test1 = %s \n',EXPname{k},Tsave)
        eval(sprintf('export_fig PVT_%s_Test1 -png -r300 -painters',EXPname{k}))

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
        title({'Measured Angle vs Known Angle with False Positives'; ['At 2 Meters ' EXPtype]})
        xlabel('Known Angle (deg)')
        ylabel('Measured Angle (deg)')
        grid on
        hold off
        % Set the background color to white
        set(gcf,'color','w');
        fprintf('PVT_%s_Test2 = %s \n',EXPname{k},Tsave)
        eval(sprintf('export_fig PVT_%s_Test2 -png -r300 -painters',EXPname{k}))

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
        Tsave = ['Measured Angle vs Known Angle with False Positives' EXPtype];
        title({'Measured Angle vs Known Angle with False Positives'; ['At 4 Meters ' EXPtype]})
        xlabel('Known Angle (deg)')
        ylabel('Measured Angle (deg)')
        grid on
        hold off
        % Set the background color to white
        set(gcf,'color','w');
        fprintf('PVT_%s_Test3 = %s \n',EXPname{k},Tsave)
        eval(sprintf('export_fig PVT_%s_Test3 -png -r300 -painters',EXPname{k}))

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
        Tsave = ['Measured Angle vs Known Angle with False Positives' EXPtype];
        title({'Measured Angle vs Known Angle with False Positives'; ['At 6 Meters' EXPtype]})
        xlabel('Known Angle (deg)')
        ylabel('Measured Angle (deg)')
        grid on
        hold off
        % Set the background color to white
        set(gcf,'color','w');
        fprintf('PVT_%s_Test4 = %s \n',EXPname{k},Tsave)
        eval(sprintf('export_fig PVT_%s_Test4 -png -r300 -painters',EXPname{k}))
        
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
        Tsave = ['Measured distance vs Known Distance without False Positives' EXPtype];
        title({'Measured distance vs Known Distance without False Positives'; EXPtype})
        xlabel('Known Dist (m)')
        ylabel('Measured Dist (m)')
        grid on
        hold off
        % Set the background color to white
        set(gcf,'color','w');
        fprintf('PVT_%s_Test1 = %s \n',EXPname{k},Tsave)
        eval(sprintf('export_fig PVT_%s_Test1S -png -r300 -painters',EXPname{k}))

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
        Tsave = ['Measured Angle vs Known Angle without False Positives' EXPtype];
        title({'Measured Angle vs Known Angle without False Positives'; ['At 2 Meters ' EXPtype]})
        xlabel('Known Angle (deg)')
        ylabel('Measured Angle (deg)')
        grid on
        hold off
        % Set the background color to white
        set(gcf,'color','w');
        fprintf('PVT_%s_Test2 = %s \n',EXPname{k},Tsave)
        eval(sprintf('export_fig PVT_%s_Test2S -png -r300 -painters',EXPname{k}))
        
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
        Tsave = ['Measured Angle vs Known Angle without False Positives' EXPtype];
        title({'Measured Angle vs Known Angle without False Positives'; ['At 4 Meters ' EXPtype]})
        xlabel('Known Angle (deg)')
        ylabel('Measured Angle (deg)')
        grid on
        hold off
        % Set the background color to white
        set(gcf,'color','w');
        fprintf('PVT_%s_Test3 = %s \n',EXPname{k},Tsave)
        eval(sprintf('export_fig PVT_%s_Test3S -png -r300 -painters',EXPname{k}))
        
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
        Tsave = ['Measured Angle vs Known Angle without False Positives' EXPtype];
        title({'Measured Angle vs Known Angle without False Positives'; ['At 6 Meters' EXPtype]})
        xlabel('Known Angle (deg)')
        ylabel('Measured Angle (deg)')
        grid on
        hold off
        % Set the background color to white
        set(gcf,'color','w');
        fprintf('PVT_%s_Test4 = %s \n',EXPname{k},Tsave)
        eval(sprintf('export_fig PVT_%s_Test4S -png -r300 -painters',EXPname{k}))
        
    end
end