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
if isfile('Data/all_results.mat')
    prompt = ['Results data available. Would you like to use old data?\n' ... 
    ' (Enter 1 - yes or 0 - no)\n'];
    loadresults = input(prompt);
    load('Data/all_results.mat')
    save('Data/all_results_old.mat','Data')
    if loadresults == 1
        load('Data/all_results.mat')
        availEx = fieldnames(Data);
        fprintf('Available Experiments with results:\n')
        for k = 1:numel(availEx)
            fprintf('%s Loaded: %i/%i %i:%i\n', availEx{k}, Data.(availEx{k}).Date(2:5))
        end
    
    elseif isfile('Data/AllBags_new.mat')
        load('Data/AllBags_new.mat')
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
            clearvars -except Data
            save('Data/AllBags_new.mat')
        end
    end

elseif isfile('Data/AllBags_new.mat')
    load('Data/AllBags_new.mat')
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
        clearvars -except Data
        save('Data/AllBags_new.mat')
    end
   
else
    Data = struct;
    prompt = ['No Data available. Which Experiments would you like to import?\n' ... 
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
        clearvars -except Data
        save('Data/AllBags_new.mat')
    end

end

%%
if verLessThan('matlab','9.5')
    % -- Code to run in MATLAB R2018a and earlier here --
    fprintf('Please use a newer version of MATLAB to continue \n')
    return

end

% Results and Filtering calculations
exps = fieldnames(Data);

for k = 1:numel(exps)
    if exps{k} == "Ex1"
        baseline = 10;
    else
        baseline = 20;
    end
    tags = fieldnames(Data.(exps{k}));
    overwrite = 1;
    if isfield(Data.(exps{k}),'Filtered') || isfield(Data.(exps{k}),'Results') || isfield(Data.(exps{k}),'Smoothed')
        prompt = ['\n', exps{k}, ' data already contains Results. Overwrite data?\n' ... 
        ' (Enter 1 - yes or 0 - no)\n'];
        overwrite = input(prompt);
    end
    for m = 1:numel(tags)
        if isequal(tags{m},'Date') || isequal(tags{m},'Filtered') || isequal(tags{m},'Results') || isequal(tags{m},'Smoothed')
            continue
        end
        if overwrite == 1
            Data.(exps{k}).Filtered.(tags{m}) = tagfilter(Data.(exps{k}).(tags{m}));
            Data.(exps{k}).Results.(tags{m}) = resultcalcs(Data.(exps{k}).Filtered.(tags{m}),baseline,exps{k},tags{m});
            Data.(exps{k}).Smoothed.(tags{m}) = outlier_removal(Data.(exps{k}).Filtered.(tags{m}));
        end
    end
end

fprintf('Results: \n Knowns, STD_w/outliers, mean val w/outliers, STD without, meanval without, Tag Count with, Tag count without, Baseline used, Id percent \n')

% Add error calculations to a new column in the data 
errorcolumn

save('Data/all_results.mat', 'Data')

exportfigs = 0; % If 1 then images will be saved to the Plotting folder.

run('.\Plotting\AllPlot')