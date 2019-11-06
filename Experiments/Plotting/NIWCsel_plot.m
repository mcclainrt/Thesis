load('..\Data\NIWCsel')

close all

figure
hold on
plot(NIWC.USBL_D_1(:,2),NIWC.USBL_D_1(:,1),'*','DisplayName','USBL (Scenario 1)')
plot(NIWC.USBL_L_1(:,2),NIWC.USBL_L_1(:,1),'*','DisplayName','USBL (Scenario 2)')
plot(NIWC.APRIL_D_1(:,2),NIWC.APRIL_D_1(:,1),'*','DisplayName','AprilTag (Scenario 1)')
plot(NIWC.APRIL_L_1(:,2),NIWC.APRIL_L_1(:,1),'*','DisplayName','AprilTag (Scenario 2)')

gcf();
legend('Location','NW')
Tsave = 'Measured Distance vs Timestamp';
title('Measured Distance vs Timestamp')
xlabel('Timestamp (s)')
ylabel('Measured Dist (m)')
grid  on
hold off
% Set the background color to white
set(gcf,'color','w');
fprintf('NIWCsel_1m = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig NIWCsel_1m -png -r300 -painters'))
end
%%
figure
hold on
plot(NIWC.USBL_D_5(:,2),NIWC.USBL_D_5(:,1),'*','DisplayName','USBL (Scenario 3)')
plot(NIWC.USBL_L_5(:,2),NIWC.USBL_L_5(:,1),'*','DisplayName','USBL (Scenario 4)')
plot(NIWC.APRIL_D_5(:,2),NIWC.APRIL_D_5(:,1),'*','DisplayName','AprilTag (Scenario 3)')
plot(NIWC.APRIL_L_5(:,2),NIWC.APRIL_L_5(:,1),'*','DisplayName','AprilTag (Scenario 4)')

gcf();
legend('Location','NW')
Tsave = 'Measured Distance vs Timestamp';
title('Measured Distance vs Timestamp')
xlabel('Timestamp (s)')
ylabel('Measured Dist (m)')
grid on
hold off
% Set the background color to white
set(gcf,'color','w');
fprintf('NIWCsel_5m = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig NIWCsel_5m -png -r300 -painters'))
end
%%
figure
hold on
plot(NIWC.meanU_D(:,1),NIWC.meanU_D(:,2),'*','DisplayName','USBL (Scenario 1/3)')
plot(NIWC.meanA_D(:,1),NIWC.meanA_D(:,2),'*','DisplayName','AprilTag (Scenario 1/3)')
plot(NIWC.meanU_L(:,1),NIWC.meanU_L(:,2),'*','DisplayName','USBL (Scenario 2/4)')
plot(NIWC.meanA_L(:,1),NIWC.meanA_L(:,2),'*','DisplayName','AprilTag (Scenario 2/4)')

gcf();
legend('Location','NW')
Tsave = 'Mean Measured Distance vs Estimated Distance';
title('Mean Measured Distance vs Estimated Distance')
xlabel('Estimated Dist (m)')
ylabel('Measured Dist (m)')
grid minor
hold off
 axis([.4 1.1 .5 1.8])
 xticks([.5 .75 1])
 yticks([.5 .75 1 1.25 1.5 1.75])
% Set the background color to white
set(gcf,'color','w');
fprintf('NIWCsel_means = %s \n',Tsave)
if exportfigs == 1
    eval(sprintf('export_fig NIWCsel_means -png -r300 -painters'))
end
