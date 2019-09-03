function [no_outliers] = outlier_removal(Structure)

TestsAvail = fieldnames(Structure);

%https://www.mathworks.com/matlabcentral/answers/224877-how-to-extract-rows-based-on-column-values-in-a-matrix

no_outliers = struct();

for v = 1:numel(TestsAvail)
    if ~isfield(no_outliers,[TestsAvail{v}])
        no_outliers.(TestsAvail{v}) = [];
    end
    
    knowns = unique(Structure.(TestsAvail{v})(:,1));
    
    for k = 1:numel(knowns)
        evalind = Structure.(TestsAvail{v})(:,1) == knowns(k);
        eval = Structure.(TestsAvail{v})(evalind,:);
        [~,TF] = rmoutliers(eval(:,6));
        no_outs = eval(~TF,:);
        no_outliers.(TestsAvail{v}) = [no_outliers.(TestsAvail{v}); no_outs];
    end
end

