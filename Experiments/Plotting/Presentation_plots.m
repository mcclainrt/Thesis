%% Smooth detects All Exp

EXPname = {'Ex3'; 'Ex6'};
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
    
    AFMname = {'V2'};
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
                Savetitle = 'AFM';
            case 'V2'
                TagType = 'AFM-2';
                ID = 'Tag_7';
                Savetitle = 'AFM';
            case 'T'
                TagType = 'Tablet';
                ID = 'Tag_5';
                Savetitle = 'T';
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
Tsave = ['Detections vs ', TESTtitle, ' without False Positives, All Scenarios'];
%title({['Detections vs ', TESTtitle, ' without False Positives']; 'All Scenarios'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('PresentDetect_%s_S = %s \n',Savetitle, Tsave)
if exportfigs == 1
    eval(sprintf('export_fig PresentDetect_AFM_S -png -r300 -painters'))
end

%% Smooth Error bars All Exp

EXPname = {'Ex3'; 'Ex6'};
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
    
    AFMname = {'V2'};
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
                Savetitle = 'AFM';
            case 'V2'
                TagType = 'AFM-2';
                ID = 'Tag_7';
                Savetitle = 'AFM';
            case 'T'
                TagType = 'Tablet';
                ID = 'Tag_5';
                Savetitle = 'T';
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
Tsave = ['Distance Error vs ', TESTtitle, ' without False Positives, All Scenarios'];
%title({['Distance Error vs ', TESTtitle, ' without False Positives']; 'All Scenarios'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
plotnorm()
fprintf('PresentError_%s_S = %s \n',Savetitle, Tsave)
if exportfigs == 1
    eval(sprintf('export_fig PresentError_AFM_S -png -r300 -painters'))
end