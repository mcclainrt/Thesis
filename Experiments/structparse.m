function [Results] = structparse(Structure, tagID)

time = 10;

%https://www.mathworks.com/matlabcentral/answers/224877-how-to-extract-rows-based-on-column-values-in-a-matrix

%T1s

% Extract each set, then true and false, then count
dists = [1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6];
angs1 = [10 20 30 35 40 45 50 55 60 65 70 75];
angs2 = [10 20 30 35 40 45 50 55 60];
angs3 = [10 20 30 35 40 45];

for k = 1:length(dists)
    
    % Pull set of data out for each distance
    evalind = Structure.T1(:,1) == dists(k);
    eval = Structure.T1(evalind,:);
    
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
Results.T1 = [dists', errval, errval_out, IDrate];

for k = 1:length(angs1)
    
    % Pull set of data out for each distance
    evalind = Structure.T2(:,1) == angs1(k);
    eval = Structure.T2(evalind,:);
    
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
    errval2(k,:) = std(true(:,6));
    errval_out2(k,:) = std(true_out(:,6));

    
    % Percentage of True Positive hits and False Poitive hits over 10 sec
    rate = 10; % the topic publishing rate, need to record some and average
    T_hits = Tcount/(rate*time);
    F_hits = Ocount/(rate*time);
    
    IDrate2(k,1:2) = [T_hits, F_hits];

end
Results.T2 = [angs1', errval2, errval_out2, IDrate2];

for k = 1:length(angs2)
    
    % Pull set of data out for each distance
    evalind = Structure.T3(:,1) == angs2(k);
    eval = Structure.T3(evalind,:);
    
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
    errval3(k,:) = std(true(:,6));
    errval_out3(k,:) = std(true_out(:,6));

    
    % Percentage of True Positive hits and False Poitive hits over 10 sec
    rate = 10; % the topic publishing rate, need to record some and average
    T_hits = Tcount/(rate*time);
    F_hits = Ocount/(rate*time);
    
    IDrate3(k,1:2) = [T_hits, F_hits];

end
Results.T3 = [angs2', errval3, errval_out3, IDrate3];

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
    errval4(k,:) = std(true(:,6));
    errval_out4(k,:) = std(true_out(:,6));

    
    % Percentage of True Positive hits and False Poitive hits over 10 sec
    rate = 10; % the topic publishing rate, need to record some and average
    T_hits = Tcount/(rate*time);
    F_hits = Ocount/(rate*time);
    
    IDrate4(k,1:2) = [T_hits, F_hits];

end
Results.T4 = [angs3', errval4, errval_out4, IDrate4];