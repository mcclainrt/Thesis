function [Results] = resultcalcs(Structure, baselineTAGID, EXP, Tagname)

% May be able to make this dynamic with structure names?
% 
% time = 10;
% rate = 2.452; % the topic publishing rate, need to record some and average

TestsAvail = fieldnames(Structure);

if EXP == 'Ex5' | 'Ex6'
    dists = [1 1.5 2 2.5 3 3.5 4 4.5 5];
else
    dists = [1 1.5 2 2.5 3 3.5 4 4.5 5 5.5 6];
end

angs1 = [10 20 30 35 40 45 50 55 60 65 70 75];
angs2 = [10 20 30 35 40 45 50 55 60];
angs3 = [10 20 30 35 40 45];

Results = struct();

for v = 1:numel(TestsAvail)
    if ~isfield(Results,[TestsAvail{v}])
        Results.(TestsAvail{v}) = [];
    end
%     switch TestsAvail{v}
%         case 'Test1'
%             reqdKnown = dists;
%         case 'Test2'
%             reqdKnown = angs1;
%         case 'Test3'
%             reqdKnown = angs2;
%         case 'Test4'
%             reqdKnown = angs3;
%     end

    switch TestsAvail{v}
        case 'Test1'
            reqdKnown = dists;
        case 'Test2'
            reqdKnown = angs1;
        case 'Test3'
            reqdKnown = angs2;
        case 'Test4'
            reqdKnown = angs3;
    end
    Tagids = fieldnames(Structure.(TestsAvail{v}));
    
    for q = 1:numel(Tagids)
        knowns = unique(Structure.(TestsAvail{v}).(Tagids{q})(:,1));
        switch Tagname
            case 'P'
                reqdtag = 'Tag_5';
            case 'V1'
                reqdtag = 'Tag_7';
            case 'V2'
                reqdtag = 'Tag_7';
            case 'T'
                reqdtag = 'Tag_5';
        end
        if ismember(0,ismember(reqdKnown,knowns)) && isequal(reqdtag,Tagids{q}) && ~(isequal(EXP,'Ex1') || isequal(EXP,'Ex4') || isequal(EXP,'Ex7'))
            fprintf('Not all knowns available in %s %s %s %s.\n', EXP, Tagname, TestsAvail{v}, Tagids{q})
        end

        for k = 1:numel(knowns)
            evalind = Structure.(TestsAvail{v}).(Tagids{q})(:,1) == knowns(k);
            eval = Structure.(TestsAvail{v}).(Tagids{q})(evalind,:);
            
            
            % Remove outliers
            [~, outind] = rmoutliers(eval(:,6)); % uses 3 MADs
            eval_out = eval(~outind,:);

            % Error bars
            try
            meanval(k,:) = mean(eval(:,6));
            errval(k,:) = max(eval(:,6))-min(eval(:,6)); %std(eval_out(:,6));
            errvalpos(k,:) = max(eval(:,6))-meanval(k,:); %std(eval(:,6));
            errvalneg(k,:) = meanval(k,:)-min(eval(:,6));
            
            meanval_out(k,:) = mean(eval_out(:,6));
            errval_out(k,:) = max(eval_out(:,6))-min(eval_out(:,6)); %std(eval_out(:,6));
            errvalpos_out(k,:) = max(eval_out(:,6))-meanval_out(k,:); %std(eval(:,6));
            errvalneg_out(k,:) = meanval_out(k,:)-min(eval_out(:,6));

            catch
                warning('error in result calcs %s %s', TestsAvail{v}, Tagids{q})
            errval(k,:) = 0;
            meanval(k,:) = 0;
            errval_out(k,:) = 0;
            meanval_out(k,:) = 0;
            end
            
            % ID Percentage
            hits(k,:) = size(eval,1);
            hits_O(k,:) = size(eval_out,1);
            base(k,:) = baselineTAGID;
            IDper(k,:) = (size(eval_out,1)/baselineTAGID)*100;


            % Percentage of True Positive hits and False Poitive hits over 10 sec


            %IDrate(k,1:2) = [Tcount, F_hits];
        end
            Results.(TestsAvail{v}).(Tagids{q}) = [knowns, errval, meanval, errval_out, meanval_out, hits, hits_O, base, IDper, errvalneg, errvalpos, errvalneg_out, errvalpos_out];
            clearvars knowns errval meanval errval_out meanval_out hits hits_O base IDper errvalpos errvalneg errvalpos_out errvalneg_out
    end
    
%     switch TestsAvail{v}
%         case 'Test1'
%             for k = 1:numel(knowns)
%                 evalind = Structure.(TestsAvail{v})(:,1) == knowns(k);
%                 eval = Structure.Test1(evalind,:);
%                 
%                 % counts trues
%                 Tcount(k,:) = size(true,1);
% 
%                 % Remove outliers
%                 [~, outind] = rmoutliers(eval(:,6));
%                 eval_out = eval(~outind,:);
% 
%                 % Error bars
%                 errval(k,:) = std(eval(:,6));
%                 meanval(k,:) = mean(eval(:,6));
%                 errval_out(k,:) = std(eval_out(:,6));
%                 meanval_out(k,:) = mean(eval_out(:,6));
% 
% 
%                 % Percentage of True Positive hits and False Poitive hits over 10 sec
%                 
% 
%                 %IDrate(k,1:2) = [Tcount, F_hits];
% 
%             end
%             Results.(TestsAvail{v}) = [knowns,  errval, meanval, errval_out, meanval_out, Tcount];
%             
%             
%     
%         case 'Test2'
%             
%         case 'Test3'
%             
%         case 'Test4'
%     end
end
            
%     evalind = Structure.Test1(:,1) == dists(k);
%     eval = Structure.Test1(evalind,:);
%     
%     Results.(TestsAvail{v}) = Structure.(TestsAvail{v})(Structure.(TestsAvail{v})(:,2) == tagID,:);
% end
% 
% for k = 1:length(dists)
%     if ~contains(TestsAvail,'Test1')
%         fprintf('No Test 1 available in %s %s \n', EXname, tagtype)
%         return
%     end
%     % Pull set of data out for each distance
%     evalind = Structure.Test1(:,1) == dists(k);
%     eval = Structure.Test1(evalind,:);
%     
%     % Pull the correct tag ids
%     trueind = eval(:,2) == tagID;
%     true = eval(trueind,:);
%     others = eval(~trueind,:);
%     % counts trues
%     Tcount = size(true,1);
%     Ocount = size(others,1);
%     % Remove outliers
%     [~, outind] = rmoutliers(true(:,6));
%     true_out = true(~outind,:);
%     
%     % Error bars
%     errval(k,:) = std(true(:,6));
%     errval_out(k,:) = std(true_out(:,6));
% 
%     
%     % Percentage of True Positive hits and False Poitive hits over 10 sec
%     T_hits = Tcount/(rate*time);
%     F_hits = Ocount/(rate*time);
%     
%     IDrate(k,1:2) = [T_hits, F_hits];
% 
% end
% Results.Test1 = [dists', errval, errval_out, IDrate];
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