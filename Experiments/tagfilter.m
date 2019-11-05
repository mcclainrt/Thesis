function [Filtered] = tagfilter(Structure) % removed tagID

TestsAvail = fieldnames(Structure);

%https://www.mathworks.com/matlabcentral/answers/224877-how-to-extract-rows-based-on-column-values-in-a-matrix

Filtered = struct();

for v = 1:numel(TestsAvail)
    if ~isfield(Filtered,[TestsAvail{v}])
        Filtered.(TestsAvail{v}) = [];
    end
    tagID = unique(Structure.(TestsAvail{v})(:,2)); % added
    Tags = {};
    for u = 1:numel(tagID)
        Tags(u,1) = {"Tag_" + tagID(u)};
    end
    for q = 1:numel(Tags)
        if ~isfield(Filtered.(TestsAvail{v}),[Tags{q}])
            Filtered.(TestsAvail{v}).(Tags{q}) = [];
        end
        Filtered.(TestsAvail{v}).(Tags{q}) = Structure.(TestsAvail{v})(Structure.(TestsAvail{v})(:,2) == tagID(q),:);
    end
end