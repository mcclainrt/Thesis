function [no_outliers] = outlier_removal(Structure)

% Removes rows of data where the calculated distance is greater than 3 MADs
% from the known distance

TestsAvail = fieldnames(Structure);

%https://www.mathworks.com/matlabcentral/answers/224877-how-to-extract-rows-based-on-column-values-in-a-matrix

no_outliers = struct();

for v = 1:numel(TestsAvail)
    if ~isfield(no_outliers,[TestsAvail{v}])
        no_outliers.(TestsAvail{v}) = [];
    end
    
    Tagids = fieldnames(Structure.(TestsAvail{v}));
    
    for q = 1:numel(Tagids)
        if ~isfield(no_outliers.(TestsAvail{v}),[Tagids{q}])
            no_outliers.(TestsAvail{v}).(Tagids{q}) = [];
        end
            
        knowns = unique(Structure.(TestsAvail{v}).(Tagids{q})(:,1));

        for k = 1:numel(knowns)
            evalind = Structure.(TestsAvail{v}).(Tagids{q})(:,1) == knowns(k);
            eval = Structure.(TestsAvail{v}).(Tagids{q})(evalind,:);
            [~,TF] = rmoutliers(eval(:,6));
            no_outs = eval(~TF,:);
            no_outliers.(TestsAvail{v}).(Tagids{q}) = [no_outliers.(TestsAvail{v}).(Tagids{q}); no_outs];
        end
        clearvars knowns
    end
    clearvars Tagids
end

