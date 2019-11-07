% Loads one Experiment at a time

function [stOUT] = bagloading(directory)

Prefix = directory;
filein = dir(Prefix);
numfile=length(filein);
stOUT = struct;


for i=1:numfile
    [Fpath,Fname,Fext]=fileparts(filein(i).name);
    if strcmp('.bag',Fext)
        relfilename = strcat(Prefix,filein(i).name);
        Bag = rosbag(relfilename);
        bag_select = select(Bag,'Topic','/tag_detections');
        msgs = readMessages(bag_select);
        Namecell = strsplit(Fname,'_');
        loaded = loadbagmsgs(msgs,Fname);
        if ~isfield(stOUT,[Namecell{2}])
            stOUT.(Namecell{2})=struct;
        end
        if ~isfield(stOUT.(Namecell{2}),['Test' Namecell{3}])
            stOUT.(Namecell{2}).(['Test' Namecell{3}]) = [];
        end
        stOUT.(Namecell{2}).(['Test' Namecell{3}]) = [stOUT.(Namecell{2}).(['Test' Namecell{3}]);loaded];
    end
end

Tags = fieldnames(stOUT);
for b = 1:numel(Tags)
    for ind=1:size(stOUT.(Tags{b}).Test1,1)
        if stOUT.(Tags{b}).Test1(ind,1) > 10
            stOUT.(Tags{b}).Test1(ind,1) = stOUT.(Tags{b}).Test1(ind,1)/10;
        end
    end
end

if ~isfield(stOUT,'Date')
    stOUT.Date=struct;
end
stOUT.Date = clock;

