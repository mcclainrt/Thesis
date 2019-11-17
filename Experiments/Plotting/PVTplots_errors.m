% PVT plots

% Only addition would be to make each tag same color for all plots

% used export_fig to save all images, currently commented out

%close all

%% PVT Error for all RAW

EXPname = fieldnames(Data);

for k = 1:numel(EXPname)
    if contains(EXPname{k},'Ex1') | contains(EXPname{k},'Ex4') | contains(EXPname{k},'Ex7')
        continue
    else
               
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
        %title({'Measured Distance vs Known Distance with False Positives'; EXPtype})
        xlabel('Known Distance (m)')
        ylabel('Distance Error(m)')
        grid on
        hold off
        % Set the background color to white
        set(gcf,'color','w');
        fprintf('PVTerror_%s_Test1 = %s \n',EXPname{k},Tsave)
        if exportfigs == 1
            eval(sprintf('export_fig PVTerror_%s_Test1 -png -r300 -painters',EXPname{k}))
        end
    end
end


%% PVT Error for all, smoothed

for k = 1:numel(EXPname)
    if contains(EXPname{k},'Ex1') | contains(EXPname{k},'Ex4') | contains(EXPname{k},'Ex7')
        continue
    else
               
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
        %title({'Measured Distance vs Known Distance without False Positives'; EXPtype})
        xlabel('Known Distance (m)')
        ylabel('Distance Error (m)')
        grid on
        hold off
        % Set the background color to white
        set(gcf,'color','w');
        fprintf('PVTerror_%s_Test1S = %s \n',EXPname{k},Tsave)
        if exportfigs == 1
        eval(sprintf('export_fig PVTerror_%s_Test1S -png -r300 -painters',EXPname{k}))
        end
    end
end