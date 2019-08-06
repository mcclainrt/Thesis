% Initial script to code things out, possibly split loading into a function
% or a separate script?
% The basics came from ME4823 HW
% Had to load custom ROS message. https://www.mathworks.com/help/releases/R2017b/robotics/ug/ros-custom-message-support.html
% Package for messages is at https://www.mathworks.com/help/robotics/ug/create-custom-messages-from-ros-package.html

clear all
close all

%% Load file

% load all files in directory and name them accordingly. 
% File name convention: Experiment#_TagandLight_test#_distance/angle
% Example: Experiment 3 with vinyl tag using single light for test 1 at 6m
% Ex3_V1_1_6

%% Structure set-up

Ex2.P = struct('T1',0,'T2',0,'T3',0,'T4',0);
Ex2.T = struct('T1',0,'T2',0,'T3',0,'T4',0);
Ex2.V1 = struct('T1',0,'T2',0,'T3',0,'T4',0);

%% Loop restructuring
Prefix = 'Ex2/bags/';
filein = dir(Prefix);
numfile=length(filein);

for i=1:numfile
    [Fpath,Fname,Fext]=fileparts(filein(i).name);
    if strcmp('.bag',Fext)
        relfilename = strcat(Prefix,filein(i).name);
        Bag = rosbag(relfilename);
        bag_select = select(Bag,'Topic','/tag_detections');
        msgs = readMessages(bag_select);
        if contains(Fname,'P')
            if contains(Fname,'_1_')
                index = length(Ex2.P.T1);
                for ii = 1:length(msgs)
                    % Loop through detections
                    for jj = 1:length(msgs{ii}.Detections)
                        if i <= numfile
                            index = index + 1;
                            Dist_ang = regexp(Fname,'\w*_\w*_._','split');
                            DAdbl = str2double(Dist_ang(2));
                            field1 = double(msgs{ii}.Detections(jj).Id);
                            field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
                            field4 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Y;
                            field5 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Z;
                            field6 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.X;
                            field7 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Y;
                            field8 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Z;
                            field9 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.W;

                            Ex2(1).P(1).T1(index,1:9) = [DAdbl,field1,field2,field4,field5,field6,field7,field8,field9];
                        end
                    end
                end
                    
            elseif contains(Fname,'_2_')
                index = length(Ex2.P.T2);
                for ii = 1:length(msgs)
                    % Loop through detections
                    for jj = 1:length(msgs{ii}.Detections)
                        if i <= numfile
                            index = index + 1;
                            Dist_ang = regexp(Fname,'\w*_\w*_._','split');
                            DAdbl = str2double(Dist_ang(2));
                            field1 = double(msgs{ii}.Detections(jj).Id);
                            field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
                            Ex2(1).P(1).T2(index,1:3) = [DAdbl,field1,field2];
                        end
                    end
                end
                    
            elseif contains(Fname,'_3_')
                index = length(Ex2.P.T3);
                for ii = 1:length(msgs)
                    % Loop through detections
                    for jj = 1:length(msgs{ii}.Detections)
                        if i <= numfile
                            index = index + 1;
                            Dist_ang = regexp(Fname,'\w*_\w*_._','split');
                            DAdbl = str2double(Dist_ang(2));
                            field1 = double(msgs{ii}.Detections(jj).Id);
                            field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
                            Ex2(1).P(1).T3(index,1:3) = [DAdbl,field1,field2];
                        end
                    end
                end
                    
            elseif contains(Fname,'_4_')
                index = length(Ex2.P.T4);
                for ii = 1:length(msgs)
                    % Loop through detections
                    for jj = 1:length(msgs{ii}.Detections)
                        if i <= numfile
                            index = index + 1;
                            Dist_ang = regexp(Fname,'\w*_\w*_._','split');
                            DAdbl = str2double(Dist_ang(2));
                            field1 = double(msgs{ii}.Detections(jj).Id);
                            field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
                            Ex2(1).P(1).T4(index,1:3) = [DAdbl,field1,field2];
                        end
                    end
                end
            end
                       
        elseif contains(Fname,'V1')
            if contains(Fname,'_1_')
                index = length(Ex2.V1.T1);
                for ii = 1:length(msgs)
                    % Loop through detections
                    for jj = 1:length(msgs{ii}.Detections)
                        if i <= numfile
                            index = index + 1;
                            Dist_ang = regexp(Fname,'\w*_\w*_._','split');
                            DAdbl = str2double(Dist_ang(2));
                            field1 = double(msgs{ii}.Detections(jj).Id);
                            field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
                            Ex2(1).V1(1).T1(index,1:3) = [DAdbl,field1,field2];
                        end
                    end
                end

            elseif contains(Fname,'_2_')
                index = length(Ex2.V1.T2);
                for ii = 1:length(msgs)
                    % Loop through detections
                    for jj = 1:length(msgs{ii}.Detections)
                        if i <= numfile
                            index = index + 1;
                            Dist_ang = regexp(Fname,'\w*_\w*_._','split');
                            DAdbl = str2double(Dist_ang(2));
                            field1 = double(msgs{ii}.Detections(jj).Id);
                            field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
                            Ex2(1).V1(1).T2(index,1:3) = [DAdbl,field1,field2];
                        end
                    end
                end

            elseif contains(Fname,'_3_')
                index = length(Ex2.V1.T3);
                for ii = 1:length(msgs)
                    % Loop through detections
                    for jj = 1:length(msgs{ii}.Detections)
                        if i <= numfile
                            index = index + 1;
                            Dist_ang = regexp(Fname,'\w*_\w*_._','split');
                            DAdbl = str2double(Dist_ang(2));
                            field1 = double(msgs{ii}.Detections(jj).Id);
                            field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
                            Ex2(1).V1(1).T3(index,1:3) = [DAdbl,field1,field2];
                        end
                    end
                end

            elseif contains(Fname,'_4_')
                index = length(Ex2.V1.T4);
                for ii = 1:length(msgs)
                    % Loop through detections
                    for jj = 1:length(msgs{ii}.Detections)
                        if i <= numfile
                            index = index + 1;
                            Dist_ang = regexp(Fname,'\w*_\w*_._','split');
                            DAdbl = str2double(Dist_ang(2));
                            field1 = double(msgs{ii}.Detections(jj).Id);
                            field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
                            Ex2(1).V1(1).T4(index,1:3) = [DAdbl,field1,field2];
                        end
                    end
                end
            end
            
        elseif contains(Fname,'T')
            if contains(Fname,'_1_')
                index = length(Ex2.T.T1);
                for ii = 1:length(msgs)
                    % Loop through detections
                    for jj = 1:length(msgs{ii}.Detections)
                        if i <= numfile
                            index = index + 1;
                            Dist_ang = regexp(Fname,'\w*_\w*_._','split');
                            DAdbl = str2double(Dist_ang(2));
                            field1 = double(msgs{ii}.Detections(jj).Id);
                            field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
                            Ex2(1).T(1).T1(index,1:3) = [DAdbl,field1,field2];
                        end
                    end
                end

            elseif contains(Fname,'_2_')
                index = length(Ex2.T.T2);
                for ii = 1:length(msgs)
                    % Loop through detections
                    for jj = 1:length(msgs{ii}.Detections)
                        if i <= numfile
                            index = index + 1;
                            Dist_ang = regexp(Fname,'\w*_\w*_._','split');
                            DAdbl = str2double(Dist_ang(2));
                            field1 = double(msgs{ii}.Detections(jj).Id);
                            field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
                            Ex2(1).T(1).T2(index,1:3) = [DAdbl,field1,field2];
                        end
                    end
                end

            elseif contains(Fname,'_3_')
                index = length(Ex2.T.T3);
                for ii = 1:length(msgs)
                    % Loop through detections
                    for jj = 1:length(msgs{ii}.Detections)
                        if i <= numfile
                            index = index + 1;
                            Dist_ang = regexp(Fname,'\w*_\w*_._','split');
                            DAdbl = str2double(Dist_ang(2));
                            field1 = double(msgs{ii}.Detections(jj).Id);
                            field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
                            Ex2(1).T(1).T3(index,1:3) = [DAdbl,field1,field2];
                        end
                    end
                end

            elseif contains(Fname,'_4_')
                index = length(Ex2.T.T4);
                for ii = 1:length(msgs)
                    % Loop through detections
                    for jj = 1:length(msgs{ii}.Detections)
                        if i <= numfile
                            index = index + 1;
                            Dist_ang = regexp(Fname,'\w*_\w*_._','split');
                            DAdbl = str2double(Dist_ang(2));
                            field1 = double(msgs{ii}.Detections(jj).Id);
                            field2 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
                            Ex2(1).T(1).T4(index,1:3) = [DAdbl,field1,field2];
                        end
                    end
                end
            end           
        end
    end
end

%% Fix lengths in first column

for ind=1:length(Ex2.P.T1)
    if Ex2.P.T1(ind,1) > 1
        Ex2.P.T1(ind,1) = Ex2.P.T1(ind,1)/10;
    end
    
end
Ex2.P.T1(1,:)=[]; % repeat for others in a loop?
for ind=1:length(Ex2.V1.T1)
    if Ex2.V1.T1(ind,1) > 1
        Ex2.V1.T1(ind,1) = Ex2.V1.T1(ind,1)/10;
    end
end
Ex2.V1.T1(1,:)=[];
for ind=1:length(Ex2.T.T1)
    if Ex2.T.T1(ind,1) > 1
        Ex2.T.T1(ind,1) = Ex2.T.T1(ind,1)/10;
    end
end
Ex2.T.T1(1,:)=[];
%% Haven't done anything below this

% Normalize time from timeseries
timeN=ts_odom.time-ts_odom.time(1);

% Convert quaternions to Euler and then to degrees
quats=ts_odom.Data(:,5:8);
eulangs=quat2eul(quats);
head_deg=eulangs(:,1)*180/pi;

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
