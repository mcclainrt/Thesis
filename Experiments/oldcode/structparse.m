function [Filtered] = structparse(Structure, tagID, EXname, tagtype)

% May be able to make this dynamic with structure names?

time = 10;
rate = 2.452; % the topic publishing rate, need to record some and average
TestsAvail = fieldnames(Structure);

%https://www.mathworks.com/matlabcentral/answers/224877-how-to-extract-rows-based-on-column-values-in-a-matrix

%T1s

% Extract each set, then true and false, then count
dists = [1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6];
angs1 = [10 20 30 35 40 45 50 55 60 65 70 75];
angs2 = [10 20 30 35 40 45 50 55 60];
angs3 = [10 20 30 35 40 45];

Filtered = struct();

for v = 1:numel(TestsAvail)
    if ~isfield(Filtered,[TestsAvail{v}])
        Filtered.(TestsAvail{v}) = [];
    end
    
    Filtered.(TestsAvail{v}) = Structure.(TestsAvail{v})(Structure.(TestsAvail{v})(:,2) == tagID,:);
%     for k = 1:length(dists)
%         % Pull set of data out for each distance
%         evalind = Structure.(TestsAvail{v})(:,1) == dists(k) & Structure.(TestsAvail{v})(:,2) == tagID;
%         Filtered.(TestsAvail{v}) = [Filtered.(TestsAvail{v});Structure.(TestsAvail{v})(evalind,:)];
        
        
%         % Pull the correct tag ids
%         trueind = eval(:,2) == tagID;
%         true = eval(trueind,:);
%         others = eval(~trueind,:);
%         % counts trues
%         Tcount = size(true,1);
%         Ocount = size(others,1);
%         % Remove outliers
%         [~, outind] = rmoutliers(true(:,6));
%         true_out = true(~outind,:);
% 
%         % Error bars
%         errval(k,:) = std(true(:,6));
%         errval_out(k,:) = std(true_out(:,6));
% 
% 
%         % Percentage of True Positive hits and False Poitive hits over 10 sec
%         T_hits = Tcount/(rate*time);
%         F_hits = Ocount/(rate*time);
% 
%         IDrate(k,1:2) = [T_hits, F_hits];

%     end
%     Results.Test1 = [dists', errval, errval_out, IDrate];
end
% 
% for k = 1:length(angs1)
%     if ~contains(TestsAvail,'Test2')
%         fprintf('No Test 2 available in %s %s \n', EXname, tagtype)
%         return
%     end
%     % Pull set of data out for each distance
%     evalind = Structure.Test2(:,1) == angs1(k);
%     eval = Structure.Test2(evalind,:);
%     
%     % Pull the correct tag ids
%     trueind = eval(:,2) == tagID;
%     true = eval(trueind,:);
%     others = eval(~trueind,:);
%     % counts trues
%     Tcount = size(true,1);
%     Ocount = size(others,1);
%     % Remove outliers
%     [~, outind] = rmoutliers(true(:,7));
%     true_out = true(~outind,:);
%     
%     % mean vals
%     meanval_nO2(k,:) = mean(180-abs(true_out(:,7)));    
%     
%     % Error bars - I need to figure out how to actually ge the angle from
%     % this or just look at tag detection rate at the different angles vice
%     % accuracy
%     errval2(k,:) = std(180-abs(true(:,7)));
%     errval_out2(k,:) = std(180-abs(true_out(:,7)));
% 
%     
%     % Percentage of True Positive hits and False Poitive hits over 10 sec
%     T_hits = Tcount/(rate*time);
%     F_hits = Ocount/(rate*time);
%     
%     IDrate2(k,1:2) = [T_hits, F_hits];
% 
% end
% Results.Test2 = [angs1', errval2, errval_out2, meanval_nO2, IDrate2];
% 
% for k = 1:length(angs2)
%     if ~contains(TestsAvail,'Test3')
%         fprintf('No Test 3 available in %s %s \n', EXname, tagtype)
%         return
%     end
%     % Pull set of data out for each distance
%     evalind = Structure.Test3(:,1) == angs2(k);
%     eval = Structure.Test3(evalind,:);
%     
%     % Pull the correct tag ids
%     trueind = eval(:,2) == tagID;
%     true = eval(trueind,:);
%     others = eval(~trueind,:);
%     % counts trues
%     Tcount = size(true,1);
%     Ocount = size(others,1);
%     % Remove outliers
%     [~, outind] = rmoutliers(true(:,7));
%     true_out = true(~outind,:);
%     
%     % mean vals
%     meanval_nO3(k,:) = mean(180-abs(true_out(:,7)));
%     
%     % Error bars
%     errval3(k,:) = std(180-abs(true(:,7)));
%     errval_out3(k,:) = std(180-abs(true_out(:,7)));
% 
%     
%     % Percentage of True Positive hits and False Poitive hits over 10 sec
%     T_hits = Tcount/(rate*time);
%     F_hits = Ocount/(rate*time);
%     
%     IDrate3(k,1:2) = [T_hits, F_hits];
% 
% end
% Results.Test3 = [angs2', errval3, errval_out3, meanval_nO3, IDrate3];
% 
% for k = 1:length(angs3)
%     if ~contains(TestsAvail,'Test4')
%         fprintf('No Test 4 available in %s %s \n', EXname, tagtype)
%         return
%     end
%     % Pull set of data out for each distance
%     evalind = Structure.Test4(:,1) == angs3(k);
%     eval = Structure.Test4(evalind,:);
%     
%     % Pull the correct tag ids
%     trueind = eval(:,2) == tagID;
%     true = eval(trueind,:);
%     others = eval(~trueind,:);
%     % counts trues
%     Tcount = size(true,1);
%     Ocount = size(others,1);
%     % Remove outliers
%     [~, outind] = rmoutliers(true(:,7));
%     true_out = true(~outind,:);
%     
%     % mean vals
%     meanval_nO4(k,:) = mean(180-abs(true_out(:,7)));
%     
%     % Error bars
%     errval4(k,:) = std(180-abs(true(:,7)));
%     errval_out4(k,:) = std(180-abs(true_out(:,7)));
% 
%     
%     % Percentage of True Positive hits and False Poitive hits over 10 sec
%     T_hits = Tcount/(rate*time);
%     F_hits = Ocount/(rate*time);
%     
%     IDrate4(k,1:2) = [T_hits, F_hits];
% 
% end
% Results.Test4 = [angs3', errval4, errval_out4, meanval_nO4, IDrate4];