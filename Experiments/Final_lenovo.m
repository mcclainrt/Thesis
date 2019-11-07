%% The final product
% Contains code that is "verified"
% this assumes that bag files for each experiment ar in separate
% directories, if they are all in one directory then this will not work
% properly

clear all
clc
close all

% 
% Check if mat file exists in current directory
if isfile('Data/AllBags.mat')
    load('Data/AllBags.mat')
    availEx = fieldnames(Data);
    fprintf('Available Experiments:\n')
    for k = 1:numel(availEx)
        fprintf('%s Loaded: %i/%i %i:%i\n', availEx{k}, Data.(availEx{k}).Date(2:5))
    end
    
    prompt = ['\nWhat Experiments would you like to load/reload?\n' ... 
    '(You can enter 0-7, an array [], or 999 for all)\n'];
    imports = input(prompt);
    if imports~=0
        if (999>imports(1) && (imports(1)>0))
            for k = 1:numel(imports)
                dirs{k,:} = ['Ex' num2str(imports(k))];
            end
        elseif imports == 999
            imports = 1:7;
            for k = 1:numel(imports)
                dirs{k,:} = ['Ex' num2str(imports(k))];
            end
        end
        
        for m = 1:numel(dirs)
            if ~isfield(Data,dirs{m})
                Data.(dirs{m})=struct;
            end
            Data.(dirs{m}) = bagloading(char(strcat(dirs{m},'/')));
        end
    end

else
    Data = struct;
    prompt = ['Which Experiments would you like to import?\n' ... 
    '(You can enter 0-7, an array [], or 999 for all)\n'];
    imports = input(prompt);
    if imports~=0
        if (999>imports(1) && (imports(1)>0))
            for k = 1:numel(imports)
                dirs{k,:} = ['Ex' num2str(imports(k))];
            end
        elseif imports == 999
            imports = 1:7;
            for k = 1:numel(imports)
                dirs{k,:} = ['Ex' num2str(imports(k))];
            end
        end
        
        for m = 1:numel(dirs)
            if ~isfield(Data,dirs{m})
                Data.(dirs{m})=struct;
            end
            Data.(dirs{m}) = bagloading(char(strcat(dirs{m},'/')));
        end
    end

end

clearvars -except Data
save('Data/AllBags_new.mat')

%%
if verLessThan('matlab','9.5')
    % -- Code to run in MATLAB R2018a and earlier here --
    fprintf('Please use a newer version of MATLAB to continue \n')
    return

end

% Results and Filtering calculations
exps = fieldnames(Data);
for k = 1:numel(exps)
    tags = fieldnames(Data.(exps{k}));
    for m = 1:numel(tags)
        if contains(tags{m},'V1') | contains(tags{m},'V2')
            tagID = 7;
        elseif contains(tags{m},'Date')
            break
        else
            tagID = 5;
        end
        Data.(exps{k}).Filtered.(tags{m}) = tagfilter(Data.(exps{k}).(tags{m}),tagID);
        Data.(exps{k}).Results.(tags{m}) = resultcalcs(Data.(exps{k}).Filtered.(tags{m}));
        Data.(exps{k}).Smoothed.(tags{m}) = outlier_removal(Data.(exps{k}).Filtered.(tags{m}));
    end
end

fprintf('Results: \n Knowndist, STD_w/outliers, mean val w/ouliers, STD without, meanval without, Tag Count \n')

%save('Data/all_results.mat', 'Data')
%% Plotting

close all

% plot points, x = known dist y = measured, line through mean? and compare
% paper in air, vinyl in air, tablet in air
% vinyl in air and in air dark(1 and 2 lights) and offset (1/2 lights),
% tablet in air and dark, 
% ambient air (all tags) and ambient water (all tags)
% vinyl in water and in water dark(1 and 2 lights) and offset (1/2 lights),
% tablet in water and dark, 
% tablet in dark vs vinyl in dark air and both in water

% Plot 1, experiment 2, all tags, test1,
P1names = fieldnames(Data.Ex2.Filtered);
figure
hold on
for k = 1:numel(P1names)
    switch P1names{k}
        case 'P'
            TagType = 'Paper Tag';
        case 'V1'
            TagType = 'Acrylic/Vinyl Tag';
        case 'T'
            TagType = 'Tablet';
    end
    plot(Data.Ex2.Filtered.(P1names{k}).Test1(:,1),Data.Ex2.Filtered.(P1names{k}).Test1(:,6),'*','DisplayName',[TagType ' Hits'])
    errorbar(Data.Ex2.Results.(P1names{k}).Test1(:,1),Data.Ex2.Results.(P1names{k}).Test1(:,3),Data.Ex2.Results.(P1names{k}).Test1(:,2), 'DisplayName', [TagType ' Mean'])
end
gcf();
legend show
title({'Measured Distances vs. Known Tag Distance'; 'In Air, Ambient Lighting'})
xlabel('Known Dist (m)')
xticks([0:.5:6]);
ylabel('Measured Dist (m)')
yticks([0:.5:6]);
% axis([0 6.5 0 6.5]);
grid on
hold off

%%

% Plot 2 same as above without outliers right now the raw data needs to be
% filtered to remove outliers, probably have to do it in the filtering
% part, add it as the last column then i can use that?
P2names = fieldnames(Data.Ex2.Filtered);
figure
hold on
for k = 1:numel(P2names)
    switch P1names{k}
        case 'P'
            TagType = 'Paper Tag';
        case 'V1'
            TagType = 'Acrylic/Vinyl Tag';
        case 'T'
            TagType = 'Tablet';
    end

    plot(Data.Ex2.Smoothed.(P2names{k}).Test1(:,1),Data.Ex2.Smoothed.(P2names{k}).Test1(:,6),'*','DisplayName',[TagType ' Hits'])
    errorbar(Data.Ex2.Results.(P2names{k}).Test1(:,1),Data.Ex2.Results.(P2names{k}).Test1(:,5),Data.Ex2.Results.(P2names{k}).Test1(:,4), 'DisplayName', [TagType ' Mean'])
end
gcf();
legend show
title({'Measured Distances vs. Known Tag Distance';'In Air, Ambient Lighting';'Outliers Removed'})
xlabel('Known Dist (m)')
xticks([0:.5:6]);
ylabel('Measured Dist (m)')
yticks([0:.5:6]);
axis([0 6.5 0 6.5]);
grid on

%%

% Plot 3, loop(Exp 2, 3, 4), V1 and V2, test 1 compares vinyl tags with
% one, and two lights for both back lighting and offet lighting

P3names = {'Ex2'; 'Ex3'; 'Ex4'};
P3tags = {'V1'; 'V2'};
figure(3)
hold on
for k = 1:numel(P3names)
    for v = 1:numel(P3tags)
        switch P3names{k}
            case 'Ex2'
                TagType = 'Acrylic/Vinyl Tag, Ambient Lighting';
            case 'Ex3'
                switch P3tags{v}
                    case 'V1'
                        TagType = 'Acrylic/Vinyl Tag, Back Lighting with Circular Light';
                    case 'V2'
                        TagType = 'Acrylic/Vinyl Tag Back Lighting with Oval Lights';
                end
            case 'Ex4'
                switch P3tags{v}
                    case 'V1'
                        TagType = 'Acrylic/Vinyl Tag, Offset Lighting with Circular Light';
                    case 'V2'
                        TagType = 'Acrylic/Vinyl Tag Offset Lighting with Oval Lights';
                end
        end
        figure(3)
        plot(Data.(P3names{k}).Filtered.(P3tags{v}).Test1(:,1),Data.(P3names{k}).Filtered.(P3tags{v}).Test1(:,6),'*','DisplayName',[TagType ' Hits'])
        errorbar(Data.(P3names{k}).Results.(P3tags{v}).Test1(:,1),Data.(P3names{k}).Results.(P3tags{v}).Test1(:,3),Data.(P3names{k}).Results.(P3tags{v}).Test1(:,2), 'DisplayName', [TagType ' Mean'])
        hold on
    end
end
    
for k = 1:numel(P3names)
    for v = 1:numel(P3tags)
        switch P3names{k}
            case 'Ex2'
                TagType = 'Acrylic/Vinyl Tag, Ambient Lighting';
            case 'Ex3'
                switch P3tags{v}
                    case 'V1'
                        TagType = 'Acrylic/Vinyl Tag, Back Lighting with Circular Light';
                    case 'V2'
                        TagType = 'Acrylic/Vinyl Tag Back Lighting with Oval Lights';
                end
            case 'Ex4'
                switch P3tags{v}
                    case 'V1'
                        TagType = 'Acrylic/Vinyl Tag, Offset Lighting with Circular Light';
                    case 'V2'
                        TagType = 'Acrylic/Vinyl Tag Offset Lighting with Oval Lights';
                end
        end
        % plot without outliers... need to fix the raw hits
        figure(4)
        plot(Data.(P3names{k}).Smoothed.(P3tags{v}).Test1(:,1),Data.(P3names{k}).Smoothed.(P3tags{v}).Test1(:,6),'*','DisplayName',[TagType ' Hits'])
        errorbar(Data.(P3names{k}).Results.(P3tags{v}).Test1(:,1),Data.(P3names{k}).Results.(P3tags{v}).Test1(:,5),Data.(P3names{k}).Results.(P3tags{v}).Test1(:,4), 'DisplayName', [TagType ' Mean'])
        hold on
    end
end


figure(3)
legend show
grid on
title({'Measured Distances vs. Known Tag Distance';'In Air, Back Lighting and Offset Lighting'})
xlabel('Known Dist (m)')
yticks([0:.5:6]);
ylabel('Measured Dist (m)')
figure(4)
legend show
grid on
title({'Measured Distances vs. Known Tag Distance';'In Air, Back Lighting and Offset Lighting'})
xlabel('Known Dist (m)')
yticks([0:.5:6]);
ylabel('Measured Dist (m)')

%%

% Plot 5, loop(Exp 2, 5), V1, test 1 compares vinyl tags in and out 
% of water with ambient light.

P5names = {'Ex2'; 'Ex5'};
P5tags = {'V1'};
figure(5)
hold on
for k = 1:numel(P5names)
    for v = 1:numel(P5tags)
        switch P5names{k}
            case 'Ex2'
                TagType = 'Acrylic/Vinyl Tag, In Air, Ambient Lighting';
            case 'Ex5'
                TagType = 'Acrylic/Vinyl Tag, In Water, Ambient Lighting';
        end
        
        figure(5)
        plot(Data.(P5names{k}).Filtered.(P5tags{v}).Test1(:,1),Data.(P5names{k}).Filtered.(P5tags{v}).Test1(:,6),'*','DisplayName',[TagType ' Hits'])
        errorbar(Data.(P5names{k}).Results.(P5tags{v}).Test1(:,1),Data.(P5names{k}).Results.(P5tags{v}).Test1(:,3),Data.(P5names{k}).Results.(P5tags{v}).Test1(:,2), 'DisplayName', [TagType ' Mean'])
        hold on
    end
end




legend show
title({'Measured Distances vs. Known Tag Distance'; 'In Air and In Water, Ambient Lighting'})
xlabel('Known Dist (m)')
xticks([0:.5:6]);
ylabel('Measured Dist (m)')
yticks([0:.5:6]);
% axis([0 6.5 0 6.5]);
grid on
hold off


%% Need to do tag counsts now, maybe all air ambient, or by tag type?
%%
% Ex2.Results.P = structparse(Ex2.P,5);
% Ex2.Results.V1 = structparse(Ex2.V1,5);
% Ex2.Results.T = structparse(Ex2.T,5);

%  Ex3.Results.V2 = structparse(Ex3.V2,5);
%  Ex3.Results.V1 = structparse(Ex3.V1,5);
%  Ex3.Results.T = structparse(Ex3.T,5);


% plotresults(Ex3)
