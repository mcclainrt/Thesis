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
% load('Ex2struct')
time = 10;

%https://www.mathworks.com/matlabcentral/answers/224877-how-to-extract-rows-based-on-column-values-in-a-matrix

%T1s

% Extract each set, then true and false, then count
dists = [1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6];
% errors = zeros(length(dists), 1);
% %true = zeros(1,8);
% plot1.P.true = [];
% 
% 
% for k = 1:length(dists)
%     
%     % Pull set of data out for each distance
%     evalind = Ex2.P.T1(:,1) == dists(k);
%     eval = Ex2.P.T1(evalind,:);
%     
%     % Pull the correct tag ids
%     trueind = eval(:,2) == 5;
%     true = eval(trueind,:);
%     others = eval(~trueind,:);
%     % counts trues
%     Tcount = size(true,1);
%     Ocount = size(others,1);
%     % Remove outliers
%     [A, outind] = rmoutliers(true(:,5));
%     true_out = true(~outind,:);
%     % calculate error of trues
%     SE = (dists(k)-true_out(:,5)).^2;
%     RMSE(k,1) = sqrt(mean(SE));
%     % calculate detections over 10 seconds
%     
%     % Percentage of True Positive hits and False Poitive hits over 10 sec
%     rate = 10; % the topic publishing rate, need to record some and average
%     T_hits = Tcount/(rate*10);
%     F_hits = Ocount/(rate*10);
%     
%     IDrate(k,1:3) = [dists(k), T_hits, F_hits];
%     
%     plot1.P.true = cat(1,plot1.P.true,true); % save errors
%     falseind = eval(:,2) ~= 5; 
%     false = eval(falseind,:);
%     % count falses
%     % error(k) = 
%     
%     errval(k) = std(true(:,6));
%     errval_out(k) = std(true_out(:,6));
% 
% end
angs1 = [10 20 30 35 40 45 50 55 60 65 70 75];
angs2 = [10 20 30 35 40 45 50 55 60 65 70 75];
angs3 = [10 20 30 35 40 45];
Structure = Ex2.P;
tagID = 5;
time = 10;
for k = 1:length(angs3)
    
    % Pull set of data out for each distance
    evalind = Structure.T4(:,1) == angs3(k);
    eval = Structure.T4(evalind,:);
    
    % Pull the correct tag ids
    trueind = eval(:,2) == tagID;
    true = eval(trueind,:);
    others = eval(~trueind,:);
    % counts trues
    Tcount = size(true,1);
    Ocount = size(others,1);
    % Remove outliers
    [A, outind] = rmoutliers(true(:,5));
    true_out = true(~outind,:);
    
    % Error bars
    errval(k,:) = std(true(:,6));
    errval_out(k,:) = std(true_out(:,6));

    
    % Percentage of True Positive hits and False Poitive hits over 10 sec
    rate = 10; % the topic publishing rate, need to record some and average
    T_hits = Tcount/(rate*time);
    F_hits = Ocount/(rate*time);
    
    IDrate(k,1:2) = [T_hits, F_hits];

end
Results.T4 = [angs3', errval, errval_out, IDrate];

Ex2.Results.P = structparse(Ex2.P,5);
errorbar(Ex2.Results.P.T1(:,1),Ex2.Results.P.T1(:,1),Ex2.Results.P.T1(:,2))
errorbar(Ex2.Results.P.T1(:,1),Ex2.Results.P.T1(:,1),Ex2.Results.P.T1(:,3))

figure
plot(Ex2.Results.P.T1(:,1),Ex2.Results.P.T1(:,4),Ex2.Results.P.T1(:,1),Ex2.Results.P.T1(:,5))

% false = Ex2.P.T1(:,2) ~= 5;
% Ex2.P.T1(false,:)
Struct1 = Ex2;
names = fieldnames(Struct1.Results);
Tests = [{'T1'} {'T2'} {'T3'} {'T4'}];

for h = 1:length(Tests)
    for k = 1:length(names)
        vals = getfield(Struct1.Results,names{k},Tests{h});
        errorbar(vals(:,1),vals(:,1),vals(:,2))
    end
end


    

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

%%

directory = 'Ex3/';

structout.P = struct('Test1',[],'Test2',[],'Test3',[],'Test4',[]);

structout.T = struct('Test1',[],'Test2',[],'Test3',[],'Test4',[]);

structout.V1 = struct('Test1',[],'Test2',[],'Test3',[],'Test4',[]);

structout.V2 = struct('Test1',[],'Test2',[],'Test3',[],'Test4',[]);

structout = struct;

Prefix = directory;
filein = dir(Prefix);
numfile=length(filein);

for i=1:numfile
    [Fpath,Fname,Fext]=fileparts(filein(i).name);
    if strcmp('.bag',Fext)
        relfilename = strcat(Prefix,filein(i).name);
        Bag = rosbag(relfilename);
        bag_select = select(Bag,'Topic','/tag_detections');
        msgs = readMessages(bag_select);
        Namecell = strsplit(Fname,'_');
        loaded = loadbagmsgs(msgs,Fname);
        if ~isfield(structout,[Namecell{2}])
            structout.(Namecell{2})=struct;
        end
        if ~isfield(structout.Namecell{2},['Test' Namecell{3}])
            structout.(Namecell{2}).(['Test' Namecell{3}]) = [];
        end
        structout.(Namecell{2}).(['Test' Namecell{3}]) = [structout.(Namecell{2}).(['Test' Namecell{3}]),loaded]; % is it worth it to take "cat" out?
    end
end

%% Trial code

stuct1 = struct('A',1,'B',0);
stuct2 = struct('C',1,'D',0);
name = [fieldnames(stuct1); fieldnames(stuct2)]
nargin

%%
clear all
Data = struct;
imports = input('Which arrays would you like to import?\n (You can enter 0-7, an array [] or 999 for all)\n');
if (999>imports(1) && (imports(1)>0))
    for k = 1:numel(imports)
        dirs{k,:} = ['Ex' num2str(imports(k))];
    end
elseif imports == 999
    imports = 1:7;
    for k = 1:numel(imports)
        dirs{k,:} = ['Ex' num2str(imports(k))];
    end
elseif imports == 0
end

for m = 1:numel(dirs)
    if ~isfield(Data,dirs{m})
        Data.(dirs{m})=struct;
    end
    Data.(dirs{m}) = bagloading(char(strcat(dirs{m},'/')));
end


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
