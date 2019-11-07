exps = fieldnames(testData);
for k = 1:numel(exps)
    tags = fieldnames(testData.(exps{k}));
    for m = 1:numel(tags)
        if contains(tags{m},'Date')
            break
        end
        testData.(exps{k}).Filtered.(tags{m}) = tagfilter(testData.(exps{k}).(tags{m}));
        testData.(exps{k}).Results.(tags{m}) = resultcalcs(testData.(exps{k}).Filtered.(tags{m}),10);
        testData.(exps{k}).Smoothed.(tags{m}) = outlier_removal(testData.(exps{k}).Filtered.(tags{m}));
    end
end

fprintf('Results: \n Knowndist, STD_w/outliers, mean val w/ouliers, STD without, meanval without, Tag Count \n')



%         if contains(tags{m},'V1') | contains(tags{m},'V2')
%             %tagID = 7;
%         elseif contains(tags{m},'Date')
%             break
%         else
%             %tagID = 5;
%         end