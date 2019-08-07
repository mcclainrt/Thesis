%% Loads Ex2 bags


%% Structure set-up

Ex2.P = struct('T1',zeros(1,8),'T2',zeros(1,8),'T3',zeros(1,8),'T4',zeros(1,8));
% Ex2.P.T1 = struct('1',0,'1.5',0,'2',0,'2.5',0);
Ex2.T = struct('T1',zeros(1,8),'T2',zeros(1,8),'T3',zeros(1,8),'T4',zeros(1,8));
%Ex2.V1 = struct('T1',0,'T2',0,'T3',0,'T4',0);
Ex2.V1 = struct('T1',zeros(1,8),'T2',zeros(1,8),'T3',zeros(1,8),'T4',zeros(1,8));

%% Loop restructuring 

% how to get rid of the first row of zeros after filling? it wont let me
% fill without having the dimensions right
% also need to figure out how to pull just what I want out, ie: i want just
% the 1m data from all T1's, should be a simple if statement? also need to
% extract the false tags and count them, could use sort? what other data
% options does matlab have? there has to be functions

Prefix = 'Ex2/bags/';
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
                        loaded = loadbagmsgs(msgs,Fname,Ex2.P.T1);
                        Ex2.P.T1 = cat(1,Ex2.P.T1,loaded);
                        if Ex2.P.T1(1)==0 % is there an easier way to do this?
                            Ex2.P.T1(1,:)=[];
                        end
                    case '2'
                        loaded = loadbagmsgs(msgs,Fname,Ex2.P.T2);
                        Ex2.P.T2 = cat(1,Ex2.P.T2,loaded);
                    case '3'
                        loaded = loadbagmsgs(msgs,Fname,Ex2.P.T3);
                        Ex2.P.T3 = cat(1,Ex2.P.T3,loaded);
                    case '4'
                        loaded = loadbagmsgs(msgs,Fname,Ex2.P.T4);
                        Ex2.P.T4 = cat(1,Ex2.P.T4,loaded);
                end
            case 'T'
                switch Namecell{3}
                    case '1'
                        loaded = loadbagmsgs(msgs,Fname,Ex2.T.T1);
                        Ex2.T.T1 = cat(1,Ex2.T.T1,loaded);
                    case '2'
                        loaded = loadbagmsgs(msgs,Fname,Ex2.T.T2);
                        Ex2.T.T2 = cat(1,Ex2.T.T2,loaded);
                    case '3'
                        loaded = loadbagmsgs(msgs,Fname,Ex2.T.T3);
                        Ex2.T.T3 = cat(1,Ex2.T.T3,loaded);
                    case '4'
                        loaded = loadbagmsgs(msgs,Fname,Ex2.T.T4);
                        Ex2.T.T4 = cat(1,Ex2.T.T4,loaded);
                end
            case 'V1'
                switch Namecell{3}
                    case '1'
                        loaded = loadbagmsgs(msgs,Fname,Ex2.V1.T1);
                        Ex2.V1.T1 = cat(1,Ex2.V1.T1,loaded);
                    case '2'
                        loaded = loadbagmsgs(msgs,Fname,Ex2.V1.T2);
                        Ex2.V1.T2 = cat(1,Ex2.V1.T2,loaded);
                    case '3'
                        loaded = loadbagmsgs(msgs,Fname,Ex2.V1.T3);
                        Ex2.V1.T3 = cat(1,Ex2.V1.T3,loaded);
                    case '4'
                        loaded = loadbagmsgs(msgs,Fname,Ex2.V1.T4);
                        Ex2.V1.T4 = cat(1,Ex2.V1.T4,loaded);
                end
            case 'V2'
                switch Namecell{3}
                    case '1'
                        loaded = loadbagmsgs(msgs,Fname,Ex2.V2.T1);
                        Ex2.V2.T1 = cat(1,Ex2.V2.T1,loaded);
                    case '2'
                        loaded = loadbagmsgs(msgs,Fname,Ex2.V2.T2);
                        Ex2.V2.T2 = cat(1,Ex2.V2.T2,loaded);
                    case '3'
                        loaded = loadbagmsgs(msgs,Fname,Ex2.V2.T3);
                        Ex2.V2.T3 = cat(1,Ex2.V2.T3,loaded);
                    case '4'
                        loaded = loadbagmsgs(msgs,Fname,Ex2.V2.T4);
                        Ex2.V2.T4 = cat(1,Ex2.V2.T4,loaded);
                        if Ex2.V2.T4(1)==0
                            Ex2.V2.T4(1,:)=[];
                        end
                end
        end
    end
end
  
%% Fix lengths in first column

for ind=1:size(Ex2.P.T1,1)
    if Ex2.P.T1(ind,1) > 10
        Ex2.P.T1(ind,1) = Ex2.P.T1(ind,1)/10;
    end
end

for ind=1:size(Ex2.V1.T1,1)
    if Ex2.V1.T1(ind,1) > 10
        Ex2.V1.T1(ind,1) = Ex2.V1.T1(ind,1)/10;
    end
end

for ind=1:size(Ex2.T.T1,1)
    if Ex2.T.T1(ind,1) > 10
        Ex2.T.T1(ind,1) = Ex2.T.T1(ind,1)/10;
    end
end

%% Haven't done anything below this

%start batch comment:
% 
% time = 10;
% 
% %T1s
% 
% dists = [1 1.5 2 2.5 3 3.5 4 4.5 6];
% 
% for i = 1:length(dists)
%     plot1x 
% end
%     
% 
% %% Data collection
% % Take total time divided by number none zero tag detections
% % how to do detection rate? number of detections over time? time is always
% % 10 seconds
% 
% % need tag percentage over 10 seconds
% 
% % need measured distance vs actual distance arrays - these should be
% % included in structure
% 
% 
% %% Plotting
% 
% 
% 
% close all
% 
% % error bars? will need error vectors, how to measure the error? is it the
% % variance over the 10 seconds? what is RMS? idk
% 
% % y = est dist, x = actual dist
% 
% % y = est angle, x = actual angle at 2, 4, 6
% 
% % y = tag %, x = actual dist
% 
% % y = tag %, x = actual angle at 2, 4 ,6
% 
% % y = measured dist, x = actual angle, for 2, 4, 6 error bars and O's at
% % actual distance
% 
% 
% 
% 
% % Map as Background
% % Information copied from the map.yaml file
% % NOTE: These numbers will change on a case-by-case basis!
% resolution = 0.05;
% origin = [-10.000000, -10.000000, 0.000000];
%  
% % Read the image - assumes the image file is in your home directory, change path as necessary
% ifile = '../maps/map.pgm';   % Image file name
% I=imread(ifile);
%  
% % Span of image in meters
% dx = size(I,2)*resolution;
% dy = size(I,1)*resolution;
%  
% % Set the size scaling
% xWorldLimits = [0 dx]+origin(1);
% yWorldLimits = [0 dy]+origin(2);
% % Reference to world coordinates (meters)
% RI = imref2d(size(I),xWorldLimits,yWorldLimits);
%   
% % Plot Map
% figure;
% imshow(flipud(I),RI)
% set(gca,'YDir','normal')
%  
% % Optionally, put a maker at the origin
% hold on;
% plot(0,0,'r*')
% 
% % Odom plot
% plot(ts_odom.Data(:,1),ts_odom.Data(:,2));
% xlabel('X position')
% ylabel('Y position')
% title('Turtle Position') 
% 
% % AMCL Pose plot
% plot(ts_amcl.Data(:,1),ts_amcl.Data(:,2),"--");
% 
% % Goal Pose plot
% plot(ts_goal.Data(:,1),ts_goal.Data(:,2),"o");
% legend('Origin', 'Odom', 'AMCL Pose', 'Goal Pose');
% 
% % Save figure
% saveas(gcf, '../images/rviz_goals.png');
% 
