% Initial script to code things out, possibly split loading into a function
% or a separate script?
% This basics came from ME4823 HW

clear all
close all

%% Load file

% load all files in directory and name them accordingly. 
% File name convention: Experiment#_TagandLight_test#_distance/angle
% Example: Experiment 3 with vinyl tag using single light for test 1 at 6m
% Ex3_V1_1_6

% Had to load customros message. https://www.mathworks.com/help/releases/R2017b/robotics/ug/ros-custom-message-support.html
% PAckage for messages is at 

Prefix = 'Ex2/bags/';
filein = dir(Prefix);
relfilename = strcat(Prefix,filein(5).name)
numfile=size(filein);
%could automate to count number of .bag extensions?
% Fpath=[];
% Fname=[];
% Fext=[];

% for i=1:numfile
%     [Fpath,Fname,Fext]=fileparts(filein(i).name);
%     if strcmp('.bag',Fext)
%         Bag = rosbag(filein(i).name);
%     end
%     %filein(i) = rosbag(filein(i).name); % how to pull in multiple files and parse their names?
% end

Bag = rosbag('Ex2_P_1_1.bag');
%% Parse data
% Will need to separate tag_detections and tf topics with the time series

% Parse bag file for topic - tag_detections
bag_select = select(Bag,'Topic','/tag_detections');

% Create a time series object
ts_bag = timeseries(bag_select,'Detections.Id');

% This doesn't work. It says the property doesn't exist. but if I read the
% messages like delow I can access the data. I feel it has something to do
% with using the custom message.
 
% Tried to use the read messages cell array to pull the data but still
% getting errors, all of the data is in the variable but I think I am doing
% it wrong.

msgs = readMessages(bag_select);
[r_msg,c_msg] = size(msgs);
Test1 = zeros(r_msg,6);
for i=1:r_msg
    Test1(i) = [msgs{i}.Detections.Id, msgs{i}.Detections.Pose.Pose.Pose.Position.X,...
        msgs{i}.Detections.Pose.Pose.Pose.Position.Y,msgs{i}.Detections.Pose.Pose.Pose.Orientation.W,...
        msgs{i}.Detections.Pose.Pose.Pose.Orientation.X,msgs{i}.Detections.Pose.Pose.Pose.Orientation.Y,...
        msgs{i}.Detections.Pose.Pose.Pose.Orientation.Z];
end

% 'Detections.Pose.Pose.Position.X','Detections.Pose.Pose.Position.Y',...
%     'Detections.Pose.Pose.Orientation.W','Detections.Pose.Pose.Orientation.X',...
%     'Detections.Pose.Pose.Orientation.Y','Detections.Pose.Pose.Orientation.Z');

%% Haven't done anything below this


% Select by topic
amcl_select = select(bag,'Topic','/amcl_pose');
 
% Create time series object
ts_amcl = timeseries(amcl_select,'Pose.Pose.Position.X','Pose.Pose.Position.Y',...
    'Pose.Pose.Orientation.W','Pose.Pose.Orientation.X',...
    'Pose.Pose.Orientation.Y','Pose.Pose.Orientation.Z');

% Select by topic
goal_select = select(bag,'Topic','/move_base/goal');
 
% Create time series object
ts_goal = timeseries(goal_select,'Goal.TargetPose.Pose.Position.X','Goal.TargetPose.Pose.Position.Y',...
    'Goal.TargetPose.Pose.Orientation.W','Goal.TargetPose.Pose.Orientation.X',...
    'Goal.TargetPose.Pose.Orientation.Y','Goal.TargetPose.Pose.Orientation.Z');


% Normalize time from timeseries
timeN=ts_odom.time-ts_odom.time(1);

% Convert quaternions to Euler and then to degrees
quats=ts_odom.Data(:,5:8);
eulangs=quat2eul(quats);
head_deg=eulangs(:,1)*180/pi;

%% Data collection
% Take total time divided by number none zero tag detections
%% Plotting


close all

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
