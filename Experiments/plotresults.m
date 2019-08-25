function plotresults(Struct1)
%Need to finish this
names = fieldnames(Struct1.Results);
Tests = {'T1' 'T2' 'T3' 'T4'};

for h = 1:length(Tests)
    figure
    for k = 1:length(names)
        gcf();
        vals = getfield(Struct1.Results,names{k},Tests{h});
        errorbar(vals(:,1),vals(:,1),vals(:,2),'DisplayName',names{k})
        hold on
    end
    legend show
    title(['Experiment 2 ' Tests{h} ' with outliers'])

    figure
    for k = 1:length(names)
        gcf();
        errorbar(vals(:,1),vals(:,1),vals(:,3),'DisplayName',names{k})
        hold on
        
    end
    legend show    
end

% errorbar(Struct1.Results.P.T1(:,1),Struct1.Results.P.T1(:,1),Struct1.Results.P.T1(:,3))
% 
% figure
% plot(Struct1.Results.P.T1(:,1),Struct1.Results.P.T1(:,4),Struct1.Results.P.T1(:,1),Struct1.Results.P.T1(:,5))