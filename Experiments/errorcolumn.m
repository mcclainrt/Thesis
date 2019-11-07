close all

EXPname = fieldnames(Data);

for k = 1:numel(EXPname)
    if contains(EXPname{k},'Ex1') | contains(EXPname{k},'Ex4') | contains(EXPname{k},'Ex7')
        continue
    else
        AFMname = fieldnames(Data.(EXPname{k}).Filtered);
        for m = 1:numel(AFMname)

            Testname = fieldnames(Data.(EXPname{k}).Filtered.(AFMname{m}));
            for n = 1:numel(Testname)
                Tagname = fieldnames(Data.(EXPname{k}).Filtered.(AFMname{m}).(Testname{n}));
                for o = 1:numel(Tagname)
                    
                    try
                        adjDist = Data.(EXPname{k}).Filtered.(AFMname{m}).(Testname{n}).(Tagname{o})(:,1) - Data.(EXPname{k}).Filtered.(AFMname{m}).(Testname{n}).(Tagname{o})(:,6);
                        Data.(EXPname{k}).Filtered.(AFMname{m}).(Testname{n}).(Tagname{o})(:,10) = adjDist;
                    catch
                        warning(['Error - DID NOT COMPUTE', EXPname{k}, AFMname{m}, Testname{n}, Tagname{o}]);
                        continue
                    end
                end
            end
        end  
    end
end

for k = 1:numel(EXPname)
    if contains(EXPname{k},'Ex1') | contains(EXPname{k},'Ex4') | contains(EXPname{k},'Ex7')
        continue
    else
        AFMname = fieldnames(Data.(EXPname{k}).Smoothed);
        for m = 1:numel(AFMname)

            Testname = fieldnames(Data.(EXPname{k}).Smoothed.(AFMname{m}));
            for n = 1:numel(Testname)
                Tagname = fieldnames(Data.(EXPname{k}).Smoothed.(AFMname{m}).(Testname{n}));
                for o = 1:numel(Tagname)
                    
                    try
                        adjDist = Data.(EXPname{k}).Smoothed.(AFMname{m}).(Testname{n}).(Tagname{o})(:,1) - Data.(EXPname{k}).Smoothed.(AFMname{m}).(Testname{n}).(Tagname{o})(:,6);
                        Data.(EXPname{k}).Smoothed.(AFMname{m}).(Testname{n}).(Tagname{o})(:,10) = adjDist;
                    catch
                        warning(['Error - DID NOT COMPUTE SMOOTHED', EXPname{k}, AFMname{m}, Testname{n}, Tagname{o}]);
                        continue
                    end
                end
            end
        end  
    end
end
%%
for k = 1:numel(EXPname)
    if contains(EXPname{k},'Ex1') | contains(EXPname{k},'Ex4') | contains(EXPname{k},'Ex7')
        continue
    else
        AFMname = fieldnames(Data.(EXPname{k}).Results);
        for m = 1:numel(AFMname)

            Testname = {'Test1'};
            for n = 1:numel(Testname)
                Tagname = fieldnames(Data.(EXPname{k}).Results.(AFMname{m}).(Testname{n}));
                for o = 1:numel(Tagname)
                    
                    try
                        adjDist = Data.(EXPname{k}).Results.(AFMname{m}).(Testname{n}).(Tagname{o})(:,1) - Data.(EXPname{k}).Results.(AFMname{m}).(Testname{n}).(Tagname{o})(:,3);
                        Data.(EXPname{k}).Results.(AFMname{m}).(Testname{n}).(Tagname{o})(:,14) = adjDist;
                        adjDistS = Data.(EXPname{k}).Results.(AFMname{m}).(Testname{n}).(Tagname{o})(:,1) - Data.(EXPname{k}).Results.(AFMname{m}).(Testname{n}).(Tagname{o})(:,5);
                        Data.(EXPname{k}).Results.(AFMname{m}).(Testname{n}).(Tagname{o})(:,15) = adjDistS;
                    catch
                        warning(['Error - DID NOT COMPUTE error', EXPname{k}, AFMname{m}, Testname{n}, Tagname{o}]);
                        continue
                    end
                end
            end
        end  
    end
end