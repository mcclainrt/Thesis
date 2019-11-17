% PHASE I
% close  all
% Only addition would be to make each tag same color for all plots

%% Test 1

TR = Data.Ex1.Results.P.Test1;

Plnames = fieldnames(TR);
figure
hold on
for k = 1:numel(Plnames)
    
    plot(TR.(Plnames{k})(:,1),TR.(Plnames{k})(:,6),'-*','DisplayName',string(join([split(Plnames{k},'_')'])))
    
end
gcf();
legend('Location','NE')
Tsave = 'Detections vs Distance with False Positives In Air, Ambient Lighting';
%title({'Detections vs Distance with False Positives'; 'In Air, Ambient Lighting'})
xlabel('Known Distance (m)')
% xticks([0:.5:6]);
ylabel('Detections')
% yticks([0:.5:6]);
% axis([0 6.5 0 6.5]);
grid on
hold off
% Set the background color to white
set(gcf,'color','w');
fprintf('PhaseI_Test1 = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig PhaseI_Test1 -png -r300 -painters'))
end

% Without outliers

figure
hold on
for k = 1:numel(Plnames)
    plot(TR.(Plnames{k})(:,1),TR.(Plnames{k})(:,7),'-*','DisplayName',string(join([split(Plnames{k},'_')'])))
    
end
gcf();
legend('Location','NE')
Tsave = 'Detections vs Distance without False Positives In Air, Ambient Lighting';
%title({'Detections vs Distance without False Positives'; 'In Air, Ambient Lighting'})
xlabel('Known Distance (m)')
ylabel('Detections')
grid on
hold off
% Set the background color to white
set(gcf,'color','w');
fprintf('PhaseI_Test1S = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig PhaseI_Test1S -png -r300 -painters'))
end
%% Test 2 - this is at 6 meters unlike the other experiments

TR = Data.Ex1.Results.P.Test2;

Plnames = fieldnames(TR);

figure
hold on
for k = 1:numel(Plnames)
    plot(TR.(Plnames{k})(:,1),TR.(Plnames{k})(:,6),'-*','DisplayName',string(join([split(Plnames{k},'_')'])))
    
end
gcf();
legend('Location','NE')
Tsave = 'Detections vs Angle without False Positives at 6 Meters, In Air, Ambient Lighting';
%title({'Detections vs Angle without False Positives'; '6 Meters, In Air, Ambient Lighting'})
xlabel('Known Angle (deg)')
ylabel('Detections')
grid on
hold off
% Set the background color to white
set(gcf,'color','w');
fprintf('PhaseI_Test2 = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig PhaseI_Test2 -png -r300 -painters'))
end

% Without outliers
figure
hold on
for k = 1:numel(Plnames)
    plot(TR.(Plnames{k})(:,1),TR.(Plnames{k})(:,7),'-*','DisplayName',string(join([split(Plnames{k},'_')'])))
    
end
gcf();
legend('Location','NE')
Tsave = 'Detections vs Angle without False Positives at 2 Meters, In Air, Ambient Lighting';
%title({'Detections vs Angle without False Positives'; '2 Meters, In Air, Ambient Lighting'})
xlabel('Known Angle (deg)')
ylabel('Detections')
grid on
hold off
% Set the background color to white
set(gcf,'color','w');
fprintf('PhaseI_Test2S = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig PhaseI_Test2S -png -r300 -painters'))
end

%% Test 3

TR = Data.Ex1.Results.P.Test3;

Plnames = fieldnames(TR);

figure
hold on
for k = 1:numel(Plnames)
    plot(TR.(Plnames{k})(:,1),TR.(Plnames{k})(:,6),'-*','DisplayName',string(join([split(Plnames{k},'_')'])))
    
end
gcf();
legend('Location','NE')
Tsave = 'Detections vs Angle with False Positives at 4 Meters, In Air, Ambient Lighting';
%title({'Detections vs Angle with False Positives'; '4 Meters, In Air, Ambient Lighting'})
xlabel('Known Angle (deg)')
ylabel('Detections')
grid on
hold off
% Set the background color to white
set(gcf,'color','w');
fprintf('PhaseI_Test3 = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig PhaseI_Test3 -png -r300 -painters'))
end

% Without outliers
figure
hold on
for k = 1:numel(Plnames)
    plot(TR.(Plnames{k})(:,1),TR.(Plnames{k})(:,7),'-*','DisplayName',string(join([split(Plnames{k},'_')'])))
    
end
gcf();
legend('Location','NE')
Tsave = 'Detections vs Angle without False Positives at 4 Meters, In Air, Ambient Lighting';
%title({'Detections vs Angle without False Positives'; '4 Meters, In Air, Ambient Lighting'})
xlabel('Known Angle (deg)')
ylabel('Detections')
grid on
hold off
% Set the background color to white
set(gcf,'color','w');
fprintf('PhaseI_Test3S = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig PhaseI_Test3S -png -r300 -painters'))
end

%% Test 4 - this is at 2 meters unlike the other experiments

TR = Data.Ex1.Results.P.Test4;

Plnames = fieldnames(TR);

figure
hold on
for k = 1:numel(Plnames)
    plot(TR.(Plnames{k})(:,1),TR.(Plnames{k})(:,6),'-*','DisplayName',string(join([split(Plnames{k},'_')'])))
    
end
gcf();
legend('Location','NE')
Tsave = 'Detections vs Angle with False Positives at 2 Meters, In Air, Ambient Lighting';
%title({'Detections vs Angle with False Positives'; '2 Meters, In Air, Ambient Lighting'})
xlabel('Known Angle (deg)')
ylabel('Detections')
grid on
hold off
% Set the background color to white
set(gcf,'color','w');
fprintf('PhaseI_Test4 = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig PhaseI_Test4 -png -r300 -painters'))
end

% Without outliers
figure
hold on
for k = 1:numel(Plnames)
    plot(TR.(Plnames{k})(:,1),TR.(Plnames{k})(:,7),'-*','DisplayName',string(join([split(Plnames{k},'_')'])))
    
end
gcf();
legend('Location','NE')
Tsave = 'Detections vs Angle without False Positives at 6 Meters, In Air, Ambient Lighting';
%title({'Detections vs Angle without False Positives'; '6 Meters, In Air, Ambient Lighting'})
xlabel('Known Angle (deg)')
ylabel('Detections')
grid on
hold off
% Set the background color to white
set(gcf,'color','w');
fprintf('PhaseI_Test4S = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig PhaseI_Test4S -png -r300 -painters'))
end