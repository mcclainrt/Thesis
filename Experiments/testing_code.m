% Initial script to code things out, possibly split loading into a function
% or a separate script?
% The basics came from ME4823 HW
% Had to load custom ROS message. https://www.mathworks.com/help/releases/R2017b/robotics/ug/ros-custom-message-support.html
% Package for messages is at https://www.mathworks.com/help/robotics/ug/create-custom-messages-from-ros-package.html
% pull from git the apriltags2_ros folder
% rosgenmsg('C:\Users\mccla\Documents\MATLAB\custom_msgs\apriltags2_ros')



clear all
close all
clc

%% Load file

% load all files in directory and name them accordingly. 
% File name convention: Experiment#_TagandLight_test#_distance/angle
% Example: Experiment 3 with vinyl tag using single light for test 1 at 6m
% Ex3_V1_1_6

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
                        loaded = loadbagmsgs(msgs,Fname);
                        Ex2.P.T1 = cat(1,Ex2.P.T1,loaded);
                        if Ex2.P.T1(1)==0 % is there an easier way to do this?
                            Ex2.P.T1(1,:)=[];
                        end
                    case '2'
                        loaded = loadbagmsgs(msgs,Fname);
                        Ex2.P.T2 = cat(1,Ex2.P.T2,loaded);
                    case '3'
                        loaded = loadbagmsgs(msgs,Fname);
                        Ex2.P.T3 = cat(1,Ex2.P.T3,loaded);
                    case '4'
                        loaded = loadbagmsgs(msgs,Fname);
                        Ex2.P.T4 = cat(1,Ex2.P.T4,loaded);
                end
            case 'T'
                switch Namecell{3}
                    case '1'
                        loaded = loadbagmsgs(msgs,Fname);
                        Ex2.T.T1 = cat(1,Ex2.T.T1,loaded);
                    case '2'
                        loaded = loadbagmsgs(msgs,Fname);
                        Ex2.T.T2 = cat(1,Ex2.T.T2,loaded);
                    case '3'
                        loaded = loadbagmsgs(msgs,Fname);
                        Ex2.T.T3 = cat(1,Ex2.T.T3,loaded);
                    case '4'
                        loaded = loadbagmsgs(msgs,Fname);
                        Ex2.T.T4 = cat(1,Ex2.T.T4,loaded);
                end
            case 'V1'
                switch Namecell{3}
                    case '1'
                        loaded = loadbagmsgs(msgs,Fname);
                        Ex2.V1.T1 = cat(1,Ex2.V1.T1,loaded);
                    case '2'
                        loaded = loadbagmsgs(msgs,Fname);
                        Ex2.V1.T2 = cat(1,Ex2.V1.T2,loaded);
                    case '3'
                        loaded = loadbagmsgs(msgs,Fname);
                        Ex2.V1.T3 = cat(1,Ex2.V1.T3,loaded);
                    case '4'
                        loaded = loadbagmsgs(msgs,Fname);
                        Ex2.V1.T4 = cat(1,Ex2.V1.T4,loaded);
                end
            case 'V2'
                switch Namecell{3}
                    case '1'
                        loaded = loadbagmsgs(msgs,Fname);
                        Ex2.V2.T1 = cat(1,Ex2.V2.T1,loaded);
                    case '2'
                        loaded = loadbagmsgs(msgs,Fname);
                        Ex2.V2.T2 = cat(1,Ex2.V2.T2,loaded);
                    case '3'
                        loaded = loadbagmsgs(msgs,Fname);
                        Ex2.V2.T3 = cat(1,Ex2.V2.T3,loaded);
                    case '4'
                        loaded = loadbagmsgs(msgs,Fname);
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

time = 10;

%https://www.mathworks.com/matlabcentral/answers/224877-how-to-extract-rows-based-on-column-values-in-a-matrix

%T1s

% Extract each set, then true and false, then count
dists = [1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6];
errors = zeros(length(dists), 1);
%true = zeros(1,8);
plot1.P.true = [];


for k = 1:length(dists)
    
    evalind = Ex2.P.T1(:,1) == dists(k);
    eval = Ex2.P.T1(evalind,:);
    
    trueind = eval(:,2) == 5;
    true = eval(trueind,:);
    % counts trues
    Tcount = size(true,1);
    [A, outind] = rmoutliers(true(:,5));
    true_out = true(~outind,:);
    % calculate error of trues
    SE = (dists(k)-true_out(:,5)).^2;
    RMSE(k,1) = sqrt(mean(SE));
    % calculate detections over 10 seconds
    
    plot1.P.true = cat(1,plot1.P.true,true); % save errors
    falseind = eval(:,2) ~= 5; 
    false = eval(falseind,:);
    % count falses
    % error(k) = 

end

plot(dists,RMSE)

false = Ex2.P.T1(:,2) ~= 5
Ex2.P.T1(false,:)



    

%% Data collection
% Take total time divided by number none zero tag detections
% how to do detection rate? number of detections over time? time is always
% 10 seconds

% need tag percentage over 10 seconds

% need measured distance vs actual distance arrays - these should be
% included in structure


%% Plotting

close all

% error bars? will need error vectors, how to measure the error? is it the
% variance over the 10 seconds? what is RMS? idk

% y = est dist, x = actual dist

% y = est angle, x = actual angle at 2, 4, 6

% y = tag %, x = actual dist

% y = tag %, x = actual angle at 2, 4 ,6

% y = measured dist, x = actual angle, for 2, 4, 6 error bars and O's at
% actual distance




% Map as Background
% Information copied from the map.yaml file
% NOTE: These numbers will change on a case-by-case basis!
resolution = 0.05;
origin = [-10.000000, -10.000000, 0.000000];
 
% Read the image - assumes the image file is in your home directory, change path as necessary
ifile = '../maps/map.pgm';   % Image file name
I=imread(ifile);
 
% Span of image in meters
dx = size(I,2)*resolution;
dy = size(I,1)*resolution;
 
% Set the size scaling
xWorldLimits = [0 dx]+origin(1);
yWorldLimits = [0 dy]+origin(2);
% Reference to world coordinates (meters)
RI = imref2d(size(I),xWorldLimits,yWorldLimits);
  
% Plot Map
figure;
imshow(flipud(I),RI)
set(gca,'YDir','normal')
 
% Optionally, put a maker at the origin
hold on;
plot(0,0,'r*')

% Odom plot
plot(ts_odom.Data(:,1),ts_odom.Data(:,2));
xlabel('X position')
ylabel('Y position')
title('Turtle Position') 

% AMCL Pose plot
plot(ts_amcl.Data(:,1),ts_amcl.Data(:,2),"--");

% Goal Pose plot
plot(ts_goal.Data(:,1),ts_goal.Data(:,2),"o");
legend('Origin', 'Odom', 'AMCL Pose', 'Goal Pose');

% Save figure
saveas(gcf, '../images/rviz_goals.png');

%% Trial code

%% This is skipping lines becasue of the index variable
% for i=1:numfile
%     [Fpath,Fname,Fext]=fileparts(filein(i).name);
%     if strcmp('.bag',Fext)
%         relfilename = strcat(Prefix,filein(i).name);
%         Bag = rosbag(relfilename);
%         bag_select = select(Bag,'Topic','/tag_detections');
%         msgs = readMessages(bag_select);
%         if contains(Fname,'P')
%             if contains(Fname,'_1_')
%                 index = size(Ex2.P.T1,1);
%                 for ii = 1:length(msgs)
%                     % Loop through detections
%                     for jj = 1:length(msgs{ii}.Detections)
%                         %if i <= numfile %not sure why I had this in here,
%                         %may not need it
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             DAdbl = str2double(Dist_ang(2));
%                             field1 = double(msgs{ii}.Detections(jj).Id);
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             field3 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Y;
%                             field4 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Z;
%                             field5 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.X;
%                             field6 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Y;
%                             field7 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Z;
%                             field8 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.W;
% 
%                             Ex2(1).P(1).T1(index,1:9) = [DAdbl,field1,field2,field3,field4,field5,field6,field7,field8];
%                             
%                             quats = Ex2.P.T1(index,5:8);
%                             eulangs = quat2eul(quats);
%                             Xdeg = eulangs(:,3)*180/pi;
%                             Ydeg = eulangs(:,2)*180/pi;
%                             Zdeg = eulangs(:,1)*180/pi;
%                             Ex2.P.T1(index,9:11) = [Xdeg,Ydeg,Zdeg];
%                             
%                             index = index + 1;
%                         %end
%                     end
%                 end
%                     
%             elseif contains(Fname,'_2_')
%                 index = length(Ex2.P.T2);
%                 for ii = 1:length(msgs)
%                     % Loop through detections
%                     for jj = 1:length(msgs{ii}.Detections)
%                         if i <= numfile
%                             
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             DAdbl = str2double(Dist_ang(2));
%                             field1 = double(msgs{ii}.Detections(jj).Id);
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             field3 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Y;
%                             field4 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Z;
%                             field5 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.X;
%                             field6 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Y;
%                             field7 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Z;
%                             field8 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.W;
% 
%                             Ex2(1).P(1).T2(index,1:9) = [DAdbl,field1,field2,field3,field4,field5,field6,field7,field8];
%                             
%                             quats = Ex2.P.T2(index,5:8);
%                             eulangs = quat2eul(quats);
%                             Xdeg = eulangs(:,3)*180/pi;
%                             Ydeg = eulangs(:,2)*180/pi;
%                             Zdeg = eulangs(:,1)*180/pi;
%                             Ex2.P.T2(index,9:11) = [Xdeg,Ydeg,Zdeg];
%                             
%                             index = index + 1;
%                         end
%                     end
%                 end
%                     
%             elseif contains(Fname,'_3_')
%                 index = length(Ex2.P.T3);
%                 for ii = 1:length(msgs)
%                     % Loop through detections
%                     for jj = 1:length(msgs{ii}.Detections)
%                         if i <= numfile
%                             
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             DAdbl = str2double(Dist_ang(2));
%                             field1 = double(msgs{ii}.Detections(jj).Id);
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             field3 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Y;
%                             field4 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Z;
%                             field5 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.X;
%                             field6 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Y;
%                             field7 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Z;
%                             field8 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.W;
% 
%                             Ex2(1).P(1).T3(index,1:9) = [DAdbl,field1,field2,field3,field4,field5,field6,field7,field8];
%                             
%                             quats = Ex2.P.T3(index,5:8);
%                             eulangs = quat2eul(quats);
%                             Xdeg = eulangs(:,3)*180/pi;
%                             Ydeg = eulangs(:,2)*180/pi;
%                             Zdeg = eulangs(:,1)*180/pi;
%                             Ex2.P.T3(index,9:11) = [Xdeg,Ydeg,Zdeg];
%                             
%                             index = index + 1;
%                         end
%                     end
%                 end
%                     
%             elseif contains(Fname,'_4_')
%                 index = length(Ex2.P.T4);
%                 for ii = 1:length(msgs)
%                     % Loop through detections
%                     for jj = 1:length(msgs{ii}.Detections)
%                         if i <= numfile
%                             
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             DAdbl = str2double(Dist_ang(2));
%                             field1 = double(msgs{ii}.Detections(jj).Id);
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             field3 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Y;
%                             field4 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Z;
%                             field5 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.X;
%                             field6 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Y;
%                             field7 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Z;
%                             field8 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.W;
% 
%                             Ex2(1).P(1).T4(index,1:9) = [DAdbl,field1,field2,field3,field4,field5,field6,field7,field8];
%                             
%                             quats = Ex2.P.T4(index,5:8);
%                             eulangs = quat2eul(quats);
%                             Xdeg = eulangs(:,3)*180/pi;
%                             Ydeg = eulangs(:,2)*180/pi;
%                             Zdeg = eulangs(:,1)*180/pi;
%                             Ex2.P.T4(index,9:11) = [Xdeg,Ydeg,Zdeg];
%                             
%                             index = index + 1;
%                         end
%                     end
%                 end
%             end
%                        
%         elseif contains(Fname,'V1')
%             if contains(Fname,'_1_')
%                 index = length(Ex2.V1.T1);
%                 for ii = 1:length(msgs)
%                     % Loop through detections
%                     for jj = 1:length(msgs{ii}.Detections)
%                         if i <= numfile
%                             
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             DAdbl = str2double(Dist_ang(2));
%                             field1 = double(msgs{ii}.Detections(jj).Id);
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             field3 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Y;
%                             field4 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Z;
%                             field5 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.X;
%                             field6 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Y;
%                             field7 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Z;
%                             field8 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.W;
% 
%                             Ex2(1).V1(1).T1(index,1:9) = [DAdbl,field1,field2,field3,field4,field5,field6,field7,field8];
%                                                         
%                             quats = Ex2.V1.T1(index,5:8);
%                             eulangs = quat2eul(quats);
%                             Xdeg = eulangs(:,3)*180/pi;
%                             Ydeg = eulangs(:,2)*180/pi;
%                             Zdeg = eulangs(:,1)*180/pi;
%                             Ex2.V1.T1(index,9:11) = [Xdeg,Ydeg,Zdeg];
%                             
%                             index = index + 1;
%                         end
%                     end
%                 end
% 
%             elseif contains(Fname,'_2_')
%                 index = length(Ex2.V1.T2);
%                 for ii = 1:length(msgs)
%                     % Loop through detections
%                     for jj = 1:length(msgs{ii}.Detections)
%                         if i <= numfile
%                             
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             DAdbl = str2double(Dist_ang(2));
%                             field1 = double(msgs{ii}.Detections(jj).Id);
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             field3 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Y;
%                             field4 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Z;
%                             field5 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.X;
%                             field6 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Y;
%                             field7 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Z;
%                             field8 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.W;
% 
%                             Ex2(1).V1(1).T2(index,1:9) = [DAdbl,field1,field2,field3,field4,field5,field6,field7,field8];
%                             
%                             quats = Ex2.V1.T2(index,5:8);
%                             eulangs = quat2eul(quats);
%                             Xdeg = eulangs(:,3)*180/pi;
%                             Ydeg = eulangs(:,2)*180/pi;
%                             Zdeg = eulangs(:,1)*180/pi;
%                             Ex2.V1.T2(index,9:11) = [Xdeg,Ydeg,Zdeg];
%                             
%                             index = index + 1;
%                         end
%                     end
%                 end
% 
%             elseif contains(Fname,'_3_')
%                 index = length(Ex2.V1.T3);
%                 for ii = 1:length(msgs)
%                     % Loop through detections
%                     for jj = 1:length(msgs{ii}.Detections)
%                         if i <= numfile
%                             
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             DAdbl = str2double(Dist_ang(2));
%                             field1 = double(msgs{ii}.Detections(jj).Id);
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             field3 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Y;
%                             field4 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Z;
%                             field5 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.X;
%                             field6 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Y;
%                             field7 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Z;
%                             field8 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.W;
% 
%                             Ex2(1).V1(1).T3(index,1:9) = [DAdbl,field1,field2,field3,field4,field5,field6,field7,field8];
%                             
%                             quats = Ex2.V1.T3(index,5:8);
%                             eulangs = quat2eul(quats);
%                             Xdeg = eulangs(:,3)*180/pi;
%                             Ydeg = eulangs(:,2)*180/pi;
%                             Zdeg = eulangs(:,1)*180/pi;
%                             Ex2.V1.T3(index,9:11) = [Xdeg,Ydeg,Zdeg];
%                             
%                             index = index + 1;
%                         end
%                     end
%                 end
% 
%             elseif contains(Fname,'_4_')
%                 index = length(Ex2.V1.T4);
%                 for ii = 1:length(msgs)
%                     % Loop through detections
%                     for jj = 1:length(msgs{ii}.Detections)
%                         if i <= numfile
%                             
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             DAdbl = str2double(Dist_ang(2));
%                             field1 = double(msgs{ii}.Detections(jj).Id);
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             field3 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Y;
%                             field4 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Z;
%                             field5 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.X;
%                             field6 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Y;
%                             field7 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Z;
%                             field8 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.W;
% 
%                             Ex2(1).V1(1).T4(index,1:9) = [DAdbl,field1,field2,field3,field4,field5,field6,field7,field8];
%                             
%                             quats = Ex2.V1.T4(index,5:8);
%                             eulangs = quat2eul(quats);
%                             Xdeg = eulangs(:,3)*180/pi;
%                             Ydeg = eulangs(:,2)*180/pi;
%                             Zdeg = eulangs(:,1)*180/pi;
%                             Ex2.V1.T4(index,9:11) = [Xdeg,Ydeg,Zdeg];
%                             
%                             index = index + 1;
%                         end
%                     end
%                 end
%             end
%             
%         elseif contains(Fname,'T')
%             if contains(Fname,'_1_')
%                 index = length(Ex2.T.T1);
%                 for ii = 1:length(msgs)
%                     % Loop through detections
%                     for jj = 1:length(msgs{ii}.Detections)
%                         if i <= numfile
%                             
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             DAdbl = str2double(Dist_ang(2));
%                             field1 = double(msgs{ii}.Detections(jj).Id);
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             field3 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Y;
%                             field4 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Z;
%                             field5 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.X;
%                             field6 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Y;
%                             field7 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Z;
%                             field8 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.W;
% 
%                             Ex2(1).T(1).T1(index,1:9) = [DAdbl,field1,field2,field3,field4,field5,field6,field7,field8];
%                             
%                             quats = Ex2.T.T1(index,5:8);
%                             eulangs = quat2eul(quats);
%                             Xdeg = eulangs(:,3)*180/pi;
%                             Ydeg = eulangs(:,2)*180/pi;
%                             Zdeg = eulangs(:,1)*180/pi;
%                             Ex2.T.T1(index,9:11) = [Xdeg,Ydeg,Zdeg];
%                             
%                             index = index + 1;
%                         end
%                     end
%                 end
% 
%             elseif contains(Fname,'_2_')
%                 index = length(Ex2.T.T2);
%                 for ii = 1:length(msgs)
%                     % Loop through detections
%                     for jj = 1:length(msgs{ii}.Detections)
%                         if i <= numfile
%                             
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             DAdbl = str2double(Dist_ang(2));
%                             field1 = double(msgs{ii}.Detections(jj).Id);
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             field3 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Y;
%                             field4 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Z;
%                             field5 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.X;
%                             field6 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Y;
%                             field7 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Z;
%                             field8 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.W;
% 
%                             Ex2(1).T(1).T2(index,1:9) = [DAdbl,field1,field2,field3,field4,field5,field6,field7,field8];
%                             
%                             quats = Ex2.T.T2(index,5:8);
%                             eulangs = quat2eul(quats);
%                             Xdeg = eulangs(:,3)*180/pi;
%                             Ydeg = eulangs(:,2)*180/pi;
%                             Zdeg = eulangs(:,1)*180/pi;
%                             Ex2.T.T2(index,9:11) = [Xdeg,Ydeg,Zdeg];
%                             
%                             index = index + 1;
%                         end
%                     end
%                 end
% 
%             elseif contains(Fname,'_3_')
%                 index = length(Ex2.T.T3);
%                 for ii = 1:length(msgs)
%                     % Loop through detections
%                     for jj = 1:length(msgs{ii}.Detections)
%                         if i <= numfile
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             DAdbl = str2double(Dist_ang(2));
%                             field1 = double(msgs{ii}.Detections(jj).Id);
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             field3 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Y;
%                             field4 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Z;
%                             field5 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.X;
%                             field6 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Y;
%                             field7 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Z;
%                             field8 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.W;
% 
%                             Ex2(1).T(1).T3(index,1:9) = [DAdbl,field1,field2,field3,field4,field5,field6,field7,field8];
%                             
%                             quats = Ex2.T.T3(index,5:8);
%                             eulangs = quat2eul(quats);
%                             Xdeg = eulangs(:,3)*180/pi;
%                             Ydeg = eulangs(:,2)*180/pi;
%                             Zdeg = eulangs(:,1)*180/pi;
%                             Ex2.T.T3(index,9:11) = [Xdeg,Ydeg,Zdeg];
%                             
%                             index = index + 1;
%                         end
%                     end
%                 end
% 
%             elseif contains(Fname,'_4_')
%                 index = length(Ex2.T.T4);
%                 for ii = 1:length(msgs)
%                     % Loop through detections
%                     for jj = 1:length(msgs{ii}.Detections)
%                         if i <= numfile
%                             
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             DAdbl = str2double(Dist_ang(2));
%                             field1 = double(msgs{ii}.Detections(jj).Id);
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             field3 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Y;
%                             field4 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Z;
%                             field5 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.X;
%                             field6 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Y;
%                             field7 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Z;
%                             field8 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.W;
% 
%                             Ex2(1).T(1).T4(index,1:9) = [DAdbl,field1,field2,field3,field4,field5,field6,field7,field8];
%                             
%                             quats = Ex2.T.T4(index,5:8);
%                             eulangs = quat2eul(quats);
%                             Xdeg = eulangs(:,3)*180/pi;
%                             Ydeg = eulangs(:,2)*180/pi;
%                             Zdeg = eulangs(:,1)*180/pi;
%                             Ex2.T.T4(index,9:11) = [Xdeg,Ydeg,Zdeg];
%                             
%                             index = index + 1;
%                         end
%                     end
%                 end
%             end           
%         end
%     end
% end


%% Bag loading and message reading

% Prefix = 'Ex2/bags/';
% % Prefix = 'BagTests/';
% filein = dir(Prefix);
% % relfilename = strcat(Prefix,filein(5).name);
% numfile=length(filein);
% index = 1;
% for i=1:numfile
%     [Fpath,Fname,Fext]=fileparts(filein(i).name);
%     if strcmp('.bag',Fext)
%         relfilename = strcat(Prefix,filein(i).name);
%         Bag = rosbag(relfilename);
%         bag_select = select(Bag,'Topic','/tag_detections');
%         msgs = readMessages(bag_select);
%         if contains(Fname,'P')
%             for ii = 1:length(msgs)
%                 % Loop through detections
%                 for jj = 1:length(msgs{ii}.Detections)
%                     if contains(Fname,'_1_')
%                         if i <= numfile
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             field1 = msgs{ii}.Detections(jj).Id;
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             Ex2(1).P(1).T1(index,:) = [Dist_ang(2),field1,field2];
%                             index = index + 1;
%                         end
%                     
%                     elseif contains(Fname,'_2_')
%                         if i <= numfile
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             field1 = msgs{ii}.Detections(jj).Id;
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             Ex2(1).P(1).T2(index,:) = [Dist_ang(2),field1,field2];
%                             index = index + 1;
%                         end                        
%                     
%                     elseif contains(Fname,'_3_')
%                         if i <= numfile
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             field1 = msgs{ii}.Detections(jj).Id;
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             Ex2(1).P(1).T3(index,:) = [Dist_ang(2),field1,field2];
%                             index = index + 1;
%                         end                        
%                     
%                     elseif contains(Fname,'_4_')
%                         if i <= numfile
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             field1 = msgs{ii}.Detections(jj).Id;
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             Ex2(1).P(1).T4(index,:) = [Dist_ang(2),field1,field2];
%                             index = index + 1;
%                         end                        
%                     end
%                 end
%             end
%         
%         elseif contains(Fname,'V1')
%             for ii = 1:length(msgs)
%                 % Loop through detections
%                 for jj = 1:length(msgs{ii}.Detections)
%                     if contains(Fname,'_1_')
%                         if i <= numfile
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             field1 = msgs{ii}.Detections(jj).Id;
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             Ex2(1).V(1).T1(index,:) = [Dist_ang(2),field1,field2];
%                             index = index + 1;
%                         end
%                     
%                     elseif contains(Fname,'_2_')
%                         if i <= numfile
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             field1 = msgs{ii}.Detections(jj).Id;
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             Ex2(1).V(1).T2(index,:) = [Dist_ang(2),field1,field2];
%                             index = index + 1;
%                         end                        
%                     
%                     elseif contains(Fname,'_3_')
%                         if i <= numfile
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             field1 = msgs{ii}.Detections(jj).Id;
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             Ex2(1).V(1).T3(index,:) = [Dist_ang(2),field1,field2];
%                             index = index + 1;
%                         end                        
%                     
%                     elseif contains(Fname,'_4_')
%                         if i <= numfile
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             field1 = msgs{ii}.Detections(jj).Id;
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             Ex2(1).V(1).T4(index,:) = [Dist_ang(2),field1,field2];
%                             index = index + 1;
%                         end                        
%                     end
%                 end
%             end
%         
%         elseif contains(Fname,'T')
%             for ii = 1:length(msgs)
%                 % Loop through detections
%                 for jj = 1:length(msgs{ii}.Detections)
%                     if contains(Fname,'_1_')
%                         if i <= numfile
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             field1 = msgs{ii}.Detections(jj).Id;
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             Ex2(1).T(1).T1(index,:) = [Dist_ang(2),field1,field2];
%                             index = index + 1;
%                         end
%                     
%                     elseif contains(Fname,'_2_')
%                         if i <= numfile
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             field1 = msgs{ii}.Detections(jj).Id;
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             Ex2(1).T(1).T2(index,:) = [Dist_ang(2),field1,field2];
%                             index = index + 1;
%                         end                        
%                     
%                     elseif contains(Fname,'_3_')
%                         if i <= numfile
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             field1 = msgs{ii}.Detections(jj).Id;
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             Ex2(1).T(1).T3(index,:) = [Dist_ang(2),field1,field2];
%                             index = index + 1;
%                         end                        
%                     
%                     elseif contains(Fname,'_4_')
%                         if i <= numfile
%                             Dist_ang = regexp(Fname,'\w*_\w*_._','split');
%                             field1 = msgs{ii}.Detections(jj).Id;
%                             field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
%                             Ex2(1).T(1).T4(index,:) = [Dist_ang(2),field1,field2];
%                             index = index + 1;
%                         end                        
%                     end
%                 end
%             end
%         end
%     end
% end

%%
% msgs = readMessages(bag_select);
% % Loop through messages
% for ii = 1:length(msgs)
%     % Loop through detections
%     for jj = 1:length(msgs{ii}.Detections)
%         fprintf('msg [%d], detection [%d], Id [%d], X=%.3f\n', ...
%             ii,jj,msgs{ii}.Detections(jj).Id, ...
%             msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X);
%     end
% end
