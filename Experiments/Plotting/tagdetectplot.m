close all

EXPname = fieldnames(Data);
%% raw detects each exp
for k = 1:numel(EXPname)
    if contains(EXPname{k},'Ex1') | contains(EXPname{k},'Ex4') | contains(EXPname{k},'Ex7')
        continue
    else
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
        
        Testname = {'Test1';'Test2';'Test3';'Test4'};
        for n = 1:numel(Testname)

            switch Testname{n}
                case 'Test1'
                    TESTtype = EXPtype;
                    TESTtitle = 'Known Dist';
                    xLBL = 'Known Dist (m)';
                    yLBL = 'Detections';
                case 'Test2'
                    TESTtype = ['At 2 Meters,' EXPtype];
                    TESTtitle = 'Known Angle';
                    xLBL = 'Known Angle (deg)';
                    yLBL = 'Detections';
                case 'Test3'
                    TESTtype = ['At 4 Meters,' EXPtype];
                    TESTtitle = 'Known Angle';
                    xLBL = 'Known Angle (deg)';
                    yLBL = 'Detections';                    
                case 'Test4'
                    TESTtype = ['At 6 Meters,' EXPtype];
                    TESTtitle = 'Known Angle';
                    xLBL = 'Known Angle (deg)';
                    yLBL = 'Detections';
            end
            
            figure
            hold on
            AFMname = fieldnames(Data.(EXPname{k}).Results);
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

%                 Testname = fieldnames(Data.(EXPname{k}).Results.(AFMname{m}));


                try
                    plot(Data.(EXPname{k}).Results.(AFMname{m}).(Testname{n}).(ID)(:,1),Data.(EXPname{k}).Results.(AFMname{m}).(Testname{n}).(ID)(:,6),'-*','DisplayName',[TagType ' Detections'])
                catch
                    warning(['Error - DID NOT COMPUTE', EXPname{k}, AFMname{m}, Testname{n}, ID]);
                    continue
                end
            end
            
            gcf();
            legend('Location','NW')
            Tsave = ['Detections vs ', TESTtitle, ' with False Positives', TESTtype];
            title({['Detections vs ', TESTtitle, ' with False Positives']; TESTtype})
            xlabel(xLBL)
            ylabel(yLBL)
            grid on
            hold off
            % Set the background color to white
            set(gcf,'color','w');
            fprintf('Detect_%s_%s = %s \n',EXPname{k},Testname{n},Tsave)
            if exportfigs == 1
                eval(sprintf('export_fig Detect_%s_%s -png -r300 -painters',EXPname{k},Testname{n}))
            end
        end  
    end
end
%% smoothed detects each exp
for k = 1:numel(EXPname)
    if contains(EXPname{k},'Ex1') | contains(EXPname{k},'Ex4') | contains(EXPname{k},'Ex7')
        continue
    else
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
        
        Testname = {'Test1';'Test2';'Test3';'Test4'};
        for n = 1:numel(Testname)

            switch Testname{n}
                case 'Test1'
                    TESTtype = EXPtype;
                    TESTtitle = 'Known Dist';
                    xLBL = 'Known Dist (m)';
                    yLBL = 'Detections';
                case 'Test2'
                    TESTtype = ['At 2 Meters,' EXPtype];
                    TESTtitle = 'Known Angle';
                    xLBL = 'Known Angle (deg)';
                    yLBL = 'Detections';
                case 'Test3'
                    TESTtype = ['At 4 Meters,' EXPtype];
                    TESTtitle = 'Known Angle';
                    xLBL = 'Known Angle (deg)';
                    yLBL = 'Detections';                    
                case 'Test4'
                    TESTtype = ['At 6 Meters,' EXPtype];
                    TESTtitle = 'Known Angle';
                    xLBL = 'Known Angle (deg)';
                    yLBL = 'Detections';
            end
            
            figure
            hold on
            AFMname = fieldnames(Data.(EXPname{k}).Results);
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
%                 Testname = fieldnames(Data.(EXPname{k}).Results.(AFMname{m}));


                try
                    plot(Data.(EXPname{k}).Results.(AFMname{m}).(Testname{n}).(ID)(:,1),Data.(EXPname{k}).Results.(AFMname{m}).(Testname{n}).(ID)(:,7),'-*','DisplayName',[TagType ' Detections'])
                catch
                    warning(['Error - DID NOT COMPUTE', EXPname{k}, AFMname{m}, Testname{n}, ID]);
                    continue
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
            fprintf('Detect_%s_%sS = %s \n',EXPname{k},Testname{n},Tsave)
            if exportfigs == 1
                eval(sprintf('export_fig Detect_%s_%sS -png -r300 -painters',EXPname{k},Testname{n}))
            end
        end  
    end
end


%% Raw detects ALL Exp
EXPname = {'Ex2'; 'Ex3'; 'Ex5'; 'Ex6'};
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
    TESTtitle = 'Known Dist';
    xLBL = 'Known Dist (m)';
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
Tsave = ['Detections vs ', TESTtitle, ' with False Positives, All Scenarios'];
title({['Detections vs ', TESTtitle, ' with False Positives']; 'All Scenarios'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
set(gcf,'color','w');
fprintf('AllDetect_AFM = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig AllDetect_AFM -png -r300 -painters'))
end

%% Smooth detects All Exp
EXPname = {'Ex2'; 'Ex3'; 'Ex5'; 'Ex6'};
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
    TESTtitle = 'Known Dist';
    xLBL = 'Known Dist (m)';
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
Tsave = ['Detections vs ', TESTtitle, ' without False Positives, All Scenarios'];
title({['Detections vs ', TESTtitle, ' without False Positives']; 'All Scenarios'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
set(gcf,'color','w');
fprintf('AllDetect_AFM_S = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig AllDetect_AFM_S -png -r300 -painters'))
end
%% Raw Error bars ALL Exp

EXPname = {'Ex2'; 'Ex3'; 'Ex5'; 'Ex6'};
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
    TESTtitle = 'Known Dist';
    xLBL = 'Known Dist (m)';
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
Tsave = ['Distance Error vs ', TESTtitle, ' with False Positives, All Scenarios'];
title({['Distance Error vs ', TESTtitle, ' with False Positives']; 'All Scenarios'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
set(gcf,'color','w');
fprintf('AllError_AFM_ = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig AllError_AFM_ -png -r300 -painters'))
end

%% Smooth Error bars All Exp

EXPname = {'Ex2'; 'Ex3'; 'Ex5'; 'Ex6'};
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
    TESTtitle = 'Known Dist';
    xLBL = 'Known Dist (m)';
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
Tsave = ['Distance Error vs ', TESTtitle, ' without False Positives, All Scenarios'];
title({['Distance Error vs ', TESTtitle, ' without False Positives']; 'All Scenarios'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
set(gcf,'color','w');
fprintf('AllError_AFM_S = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig AllError_AFM_S -png -r300 -painters'))
end