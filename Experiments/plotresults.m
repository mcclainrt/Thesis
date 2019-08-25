function plotresults(Struct1)
%Need to finish this
% for a = 1:nargin
%     ExNum(a) = inputname(Struct1);
% end

names = fieldnames(Struct1.Results);
Tests = {'Test1' 'Test2' 'Test3' 'Test4'};

for h = 1:numel(Tests)
    switch Tests{h}
        case 'Test1'
            TestType = 'Distances By .5 meter';
        case 'Test2'
            TestType = 'Angles at 6 meters';
        case 'Test3'
            TestType = 'Angles at 4 meters';
        case 'Test4'
            TestType = 'Angles at 2 meters';
    end
    figure
    for k = 1:numel(names)
        switch names{k}
            case 'P'
                TagType = 'Paper Tag';
            case 'V1'
                TagType = 'Acrylic Tag - Circular Light';
            case 'V2'
                TagType = 'Acrylic Tag - Oval Lights';
            case 'T'
                TagType = 'Tablet';
        end
                
        gcf();
        vals = getfield(Struct1.Results,names{k},Tests{h});
        errorbar(vals(:,1),vals(:,1),vals(:,2),'DisplayName',TagType)
        hold on
    end
    legend show
    title(['Experiment 2 ' TestType ' with outliers'])

    figure
    for k = 1:numel(names)
        switch names{k}
            case 'P'
                TagType = 'Paper';
            case 'V1'
                TagType = 'Acrylic Tag with Circular Light';
            case 'V2'
                TagType = 'Acrylic Tag with Oval Lights';
            case 'T'
                TagType = 'Tablet';
        end
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