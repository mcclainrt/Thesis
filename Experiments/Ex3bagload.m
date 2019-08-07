%% Loads Ex3 bags


%% Structure set-up

Ex3.P = struct('T1',zeros(1,8),'T2',zeros(1,8),'T3',zeros(1,8),'T4',zeros(1,8));
% Ex3.P.T1 = struct('1',0,'1.5',0,'2',0,'2.5',0);
Ex3.T = struct('T1',zeros(1,8),'T2',zeros(1,8),'T3',zeros(1,8),'T4',zeros(1,8));
%Ex3.V1 = struct('T1',0,'T2',0,'T3',0,'T4',0);
Ex3.V1 = struct('T1',zeros(1,8),'T2',zeros(1,8),'T3',zeros(1,8),'T4',zeros(1,8));

%% Loop restructuring 

% how to get rid of the first row of zeros after filling? it wont let me
% fill without having the dimensions right
% also need to figure out how to pull just what I want out, ie: i want just
% the 1m data from all T1's, should be a simple if statement? also need to
% extract the false tags and count them, could use sort? what other data
% options does matlab have? there has to be functions

Prefix = 'Ex3/bags/';
filein = dir(Prefix);
numfile=length(filein);
append = 0;

% this may be cleaner?
for i=1:numfile
    [Fpath,Fname,Fext]=fileparts(filein(i).name);
    if strcmp('.bag',Fext)
        relfilename = strcat(Prefix,filein(i).name);
        Bag = rosbag(relfilename);
        bag_select = select(Bag,'Topic','/tag_detections');
        msgs = readMessages(bag_select);
        Namecell = strsplit(Fname,'_');
        switch Namecell{2}
            case 'P'
                switch Namecell{3}
                    case '1'
                        loaded = loadbagmsgs(msgs,Fname,Ex3.P.T1);
                        Ex3.P.T1 = cat(1,Ex3.P.T1,loaded);
                        if Ex3.P.T1(1)==0 % is there an easier way to do this?
                            Ex3.P.T1(1,:)=[];
                        end
                    case '2'
                        loaded = loadbagmsgs(msgs,Fname,Ex3.P.T2);
                        Ex3.P.T2 = cat(1,Ex3.P.T2,loaded);
                    case '3'
                        loaded = loadbagmsgs(msgs,Fname,Ex3.P.T3);
                        Ex3.P.T3 = cat(1,Ex3.P.T3,loaded);
                    case '4'
                        loaded = loadbagmsgs(msgs,Fname,Ex3.P.T4);
                        Ex3.P.T4 = cat(1,Ex3.P.T4,loaded);
                end
            case 'T'
                switch Namecell{3}
                    case '1'
                        loaded = loadbagmsgs(msgs,Fname,Ex3.T.T1);
                        Ex3.T.T1 = cat(1,Ex3.T.T1,loaded);
                    case '2'
                        loaded = loadbagmsgs(msgs,Fname,Ex3.T.T2);
                        Ex3.T.T2 = cat(1,Ex3.T.T2,loaded);
                    case '3'
                        loaded = loadbagmsgs(msgs,Fname,Ex3.T.T3);
                        Ex3.T.T3 = cat(1,Ex3.T.T3,loaded);
                    case '4'
                        loaded = loadbagmsgs(msgs,Fname,Ex3.T.T4);
                        Ex3.T.T4 = cat(1,Ex3.T.T4,loaded);
                end
            case 'V1'
                switch Namecell{3}
                    case '1'
                        loaded = loadbagmsgs(msgs,Fname,Ex3.V1.T1);
                        Ex3.V1.T1 = cat(1,Ex3.V1.T1,loaded);
                    case '2'
                        loaded = loadbagmsgs(msgs,Fname,Ex3.V1.T2);
                        Ex3.V1.T2 = cat(1,Ex3.V1.T2,loaded);
                    case '3'
                        loaded = loadbagmsgs(msgs,Fname,Ex3.V1.T3);
                        Ex3.V1.T3 = cat(1,Ex3.V1.T3,loaded);
                    case '4'
                        loaded = loadbagmsgs(msgs,Fname,Ex3.V1.T4);
                        Ex3.V1.T4 = cat(1,Ex3.V1.T4,loaded);
                end
            case 'V2'
                switch Namecell{3}
                    case '1'
                        loaded = loadbagmsgs(msgs,Fname,Ex3.V2.T1);
                        Ex3.V2.T1 = cat(1,Ex3.V2.T1,loaded);
                    case '2'
                        loaded = loadbagmsgs(msgs,Fname,Ex3.V2.T2);
                        Ex3.V2.T2 = cat(1,Ex3.V2.T2,loaded);
                    case '3'
                        loaded = loadbagmsgs(msgs,Fname,Ex3.V2.T3);
                        Ex3.V2.T3 = cat(1,Ex3.V2.T3,loaded);
                    case '4'
                        loaded = loadbagmsgs(msgs,Fname,Ex3.V2.T4);
                        Ex3.V2.T4 = cat(1,Ex3.V2.T4,loaded);
                        if Ex3.V2.T4(1)==0
                            Ex3.V2.T4(1,:)=[];
                        end
                end
        end
    end
end
  
%% Fix lengths in first column

for ind=1:size(Ex3.P.T1,1)
    if Ex3.P.T1(ind,1) > 10
        Ex3.P.T1(ind,1) = Ex3.P.T1(ind,1)/10;
    end
end

for ind=1:size(Ex3.V1.T1,1)
    if Ex3.V1.T1(ind,1) > 10
        Ex3.V1.T1(ind,1) = Ex3.V1.T1(ind,1)/10;
    end
end

for ind=1:size(Ex3.T.T1,1)
    if Ex3.T.T1(ind,1) > 10
        Ex3.T.T1(ind,1) = Ex3.T.T1(ind,1)/10;
    end
end

clearvars -except Ex3