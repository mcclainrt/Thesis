Test1Data = getfield(AprilTagData.Filtered,'Test1');
Test2Data = getfield(AprilTagData.Filtered,'Test2');
Test3Data = getfield(AprilTagData.Filtered,'Test3');

plotT1 = Test1Data(:,[6 10]);
plotT2 = Test2Data(:,[6 10]);

ind1 = plotT1(:,1)<=1 & plotT1(:,1)>=.2;
plotting1 = plotT1(ind1,:);

ind2 = plotT2(:,1)<=1.2 & plotT2(:,1>=.5);
plotting2 = plotT2(ind2,:);