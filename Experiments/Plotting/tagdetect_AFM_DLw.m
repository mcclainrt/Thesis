%% Raw detects Light Dark AFM Water

EXPname = {'Ex5'; 'Ex6'};
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
Tsave = ['Detections vs ', TESTtitle, ' with False Positives, Water LD'];
title({['Detections vs ', TESTtitle, ' with False Positives']; 'Water LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
set(gcf,'color','w');
fprintf('DLw_Detect_AFM = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DLw_Detect_AFM -png -r300 -painters'))
end

%% Smooth detects Light Dark AFM Water

EXPname = {'Ex5'; 'Ex6'};
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
Tsave = ['Detections vs ', TESTtitle, ' without False Positives, Water LD'];
title({['Detections vs ', TESTtitle, ' without False Positives']; 'Water LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
set(gcf,'color','w');
fprintf('DLw_Detect_AFM_S = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DLw_Detect_AFM_S -png -r300 -painters'))
end
%% Raw Error bars Light Dark AFM Water

EXPname = {'Ex5'; 'Ex6'};
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
Tsave = ['Distance Error vs ', TESTtitle, ' with False Positives, Water LD'];
title({['Distance Error vs ', TESTtitle, ' with False Positives']; 'Water LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
set(gcf,'color','w');
fprintf('DLw_Error_AFM_ = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DLw_Error_AFM_ -png -r300 -painters'))
end

%% Smooth Error bars Light Dark AFM Water

EXPname = {'Ex5'; 'Ex6'};
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
Tsave = ['Distance Error vs ', TESTtitle, ' without False Positives, Water LD'];
title({['Distance Error vs ', TESTtitle, ' without False Positives']; 'Water LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
set(gcf,'color','w');
fprintf('DLw_Error_AFM_S = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DLw_Error_AFM_S -png -r300 -painters'))
end

%% Raw detects Light Dark AFM Water Test 2

EXPname = {'Ex5'; 'Ex6'};
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
    TESTtitle = 'Known Angle';
    xLBL = 'Known Angle (deg)';
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
            plot(Data.(EXPname{k}).Results.(AFMname{m}).Test2.(ID)(:,1),Data.(EXPname{k}).Results.(AFMname{m}).Test2.(ID)(:,6),'-*','DisplayName',[TagType EXPtype])
        catch
            warning(['Error - DID NOT COMPUTE', EXPname{k}, AFMname{m}, 'Test1', ID]);
            continue
        end
    end
end

gcf();
legend('Location','NW')
Tsave = ['Detections vs ', TESTtitle, ' with False Positives, Water LD'];
title({['Detections vs ', TESTtitle, ' with False Positives']; 'Water LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
set(gcf,'color','w');
fprintf('DLw_Detect_AFM = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DLw_Detect2_AFM -png -r300 -painters'))
end

%% Smooth detects Light Dark AFM Water Test 2

EXPname = {'Ex5'; 'Ex6'};
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
    TESTtitle = 'Known Angle';
    xLBL = 'Known Angle (deg)';
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
            plot(Data.(EXPname{k}).Results.(AFMname{m}).Test2.(ID)(:,1),Data.(EXPname{k}).Results.(AFMname{m}).Test2.(ID)(:,7),'-*','DisplayName',[TagType EXPtype])
        catch
            warning(['Error - DID NOT COMPUTE', EXPname{k}, AFMname{m}, 'Test1', ID]);
            continue
        end
    end
end

gcf();
legend('Location','NW')
Tsave = ['Detections vs ', TESTtitle, ' without False Positives, Water LD'];
title({['Detections vs ', TESTtitle, ' without False Positives']; 'Water LD'})
xlabel(xLBL)
ylabel(yLBL)
grid on
hold off
% Set the background color to white
set(gcf,'color','w');
fprintf('DLw_Detect_AFM_S = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig DLw_Detect2_AFM_S -png -r300 -painters'))
end