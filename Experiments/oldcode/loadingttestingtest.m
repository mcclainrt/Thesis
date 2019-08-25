directory = 'Ex2/bags/';


structout.P = struct('Test1',zeros(1,9),'Test2',zeros(1,9),'Test3',zeros(1,9),'Test4',zeros(1,9));

structout.T = struct('Test1',zeros(1,9),'Test2',zeros(1,9),'Test3',zeros(1,9),'Test4',zeros(1,9));

structout.V1 = struct('Test1',zeros(1,9),'Test2',zeros(1,9),'Test3',zeros(1,9),'Test4',zeros(1,9));

structout.V2 = struct('Test1',zeros(1,9),'Test2',zeros(1,9),'Test3',zeros(1,9),'Test4',zeros(1,9));
Prefix = directory;
filein = dir(Prefix);
numfile=length(filein);
append = 0;
for i=1:numfile
    [Fpath,Fname,Fext]=fileparts(filein(i).name);
    if strcmp('.bag',Fext)
        relfilename = strcat(Prefix,filein(i).name);
        Bag = rosbag(relfilename);
        bag_select = select(Bag,'Topic','/tag_detections');
        msgs = readMessages(bag_select);
        Namecell = strsplit(Fname,'_');
        loaded = loadbagmsgs(msgs,Fname);
        structout.(Namecell{2}).(['Test' Namecell{3}]) = cat(1,structout.(Namecell{2}).(['Test' Namecell{3}]),loaded); % is it worth it to take "cat" out?
        if structout.(Namecell{2}).(['Test' Namecell{3}])(1)==0 % is there an easier way to do this?
                            structout.(Namecell{2}).(['Test' Namecell{3}])(1,:)=[];
        end
    end
end