function [Filtered] = tagfilter(Structure, tagID)

TestsAvail = fieldnames(Structure);

%https://www.mathworks.com/matlabcentral/answers/224877-how-to-extract-rows-based-on-column-values-in-a-matrix

Filtered = struct();

for v = 1:numel(TestsAvail)
    if ~isfield(Filtered,[TestsAvail{v}])
        Filtered.(TestsAvail{v}) = [];
    end
    
    Filtered.(TestsAvail{v}) = Structure.(TestsAvail{v})(Structure.(TestsAvail{v})(:,2) == tagID,:);
end