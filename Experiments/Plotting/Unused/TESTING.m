EXPname = {'Ex2'; 'Ex3'; 'Ex5'; 'Ex6'};
figure
hold on
for k = 1:numel(EXPname)
    
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
    
    AFMname = {'V1';'V2'};

    for m = 1:numel(AFMname)
        switch AFMname{m}
            case 'P'
                TagType = 'Paper Tag';
                ID = 'Tag_5';
            case 'V1'
                if EXPname{k} == 'Ex2' | EXPname{k} == 'Ex5' 
                    TagType = 'AFM'
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
    Tsave = ['Detections vs ', TESTtitle, ' without False Positives', TESTtype];
    title({['Detections vs ', TESTtitle, ' without False Positives']; TESTtype})
    xlabel(xLBL)
    ylabel(yLBL)
    grid on
    hold off
    % Set the background color to white
    set(gcf,'color','w');
    fprintf('AllDetect_AFM_S = %s \n',Tsave)
    if exportfigs == 1
        eval(sprintf('export_fig AllDetect_AFM_S -png -r300 -painters')
    end