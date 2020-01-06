function [Results] = resultcalcs(Structure, baselineTAGID, EXP, Tagname)

% Calculates the results structure.

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
    
end