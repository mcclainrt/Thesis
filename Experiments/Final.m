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
save('Data/AllBags.mat')


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
        %Data.(exps{k}).Results.(tags{m}) = resultcalcs(Data.(exps{k}).(tags{m}),tagID,exps{k},tags{m});
    end
end

%save('Data/all_results.mat', 'Data')

% plot points, x = known dist y = measured, line through mean? and compare
% paper in air, vinyl in air, tablet in air
% vinyl in air and in air dark(1 and 2 lights) and offset (1/2 lights),
% tablet in air and dark, 
% ambient air (all tags) and ambient water (all tags)
% vinyl in water and in water dark(1 and 2 lights) and offset (1/2 lights),
% tablet in water and dark, 
% tablet in dark vs vinyl in dark air and both in water


plot(Data.Ex2.Filtered.V1.Test1(:,1),Data.Ex2.Filtered.V1.Test1(:,6),'*')



% Ex2.Results.P = structparse(Ex2.P,5);
% Ex2.Results.V1 = structparse(Ex2.V1,5);
% Ex2.Results.T = structparse(Ex2.T,5);

%  Ex3.Results.V2 = structparse(Ex3.V2,5);
%  Ex3.Results.V1 = structparse(Ex3.V1,5);
%  Ex3.Results.T = structparse(Ex3.T,5);


% plotresults(Ex3)
