% DLw plots

% Only addition would be to make each tag same color for all plots

% used export_fig to save all images, currently commented out

% Set the default text sizes for the root figure
set(0,'defaulttextfontsize',20);
set(0,'defaultaxesfontsize',12);

close all

EXPname = fieldnames(Data);

        AFMname = fieldnames(Data.Ex5.Filtered);
        
        for m = 1:numel(AFMname)
            switch AFMname{m}
                case 'P'
                    continue
                    TagType = 'Paper Tag';
                    ID = 'Tag_5';
                case 'V1'
                    TagType = 'AFM-1';
                    ID = 'Tag_7';
                case 'V2'
                    TagType = 'AFM-2';
                    ID = 'Tag_7';
                case 'T'
                    TagType = 'Tablet';
                    ID = 'Tag_5';
            end
            
            try
                figure
                hold on
                plot(Data.Ex5.Filtered.(AFMname{m}).Test1.(ID)(:,1),Data.Ex5.Filtered.(AFMname{m}).Test1.(ID)(:,6),'*','DisplayName',[TagType ' Detections Ambient'])
                plot(Data.Ex6.Filtered.(AFMname{m}).Test1.(ID)(:,1),Data.Ex6.Filtered.(AFMname{m}).Test1.(ID)(:,6),'*','DisplayName',[TagType ' Detections Backlit'])

                gcf();
                legend('Location','NW')
                Tsave = ['Measured Distance vs Known Distance with False Positives In Water Ambient vs Dark'];
                title({'Measured Distance vs Known Distance with False Positives'; 'In Water Ambient vs Dark'})
                xlabel('Known Dist (m)')
                ylabel('Measured Dist (m)')
                grid on
                hold off
                % Set the background color to white
                set(gcf,'color','w');
                fprintf('DLw_%s_Test1 = %s \n',TagType,Tsave)
                %eval(sprintf('export_fig DLw_%s_Test1 -png -r300 -painters',TagType))
                
            catch
                warning(['No Detection at Ex5/Ex6, ', AFMname{m}, ', Test1']);
                legend('Location','NW')
                continue
            end
        end


        for m = 1:numel(AFMname)
            switch AFMname{m}
                case 'P'
                    continue
                    TagType = 'Paper Tag';
                    ID = 'Tag_5';
                case 'V1'
                    TagType = 'AFM-1';
                    ID = 'Tag_7';
                case 'V2'
                    TagType = 'AFM-2';
                    ID = 'Tag_7';
                case 'T'
                    TagType = 'Tablet';
                    ID = 'Tag_5';
            end
            
            try
                figure
                hold on
                plot(Data.Ex5.Filtered.(AFMname{m}).Test2.(ID)(:,1),180-abs(Data.Ex5.Filtered.(AFMname{m}).Test2.(ID)(:,7)),'*','DisplayName',[TagType ' Detections Ambient'])
                plot(Data.Ex6.Filtered.(AFMname{m}).Test2.(ID)(:,1),180-abs(Data.Ex6.Filtered.(AFMname{m}).Test2.(ID)(:,7)),'*','DisplayName',[TagType ' Detections Backlit'])
                gcf();
                legend('Location','NW')
                Tsave = ['Measured Angle vs Known Angle with False Positives In Water Ambient vs Dark'];
                title({'Measured Angle vs Known Angle with False Positives'; 'At 2 Meters In Water Ambient vs Dark'})
                xlabel('Known Angle (deg)')
                ylabel('Measured Angle (deg)')
                grid on
                hold off
                % Set the background color to white
                set(gcf,'color','w');
                fprintf('DLw_%s_Test2 = %s \n',TagType,Tsave)
                %eval(sprintf('export_fig DLw_%s_Test2 -png -r300 -painters',TagType))
            catch
                warning(['No Detection at Ex5/Ex6, ', AFMname{m}, ', Test2']);
                legend('Location','NW')
                continue
            end
        end            

           
        for m = 1:numel(AFMname)
            switch AFMname{m}
                case 'P'
                    continue
                    TagType = 'Paper Tag';
                    ID = 'Tag_5';
                case 'V1'
                    TagType = 'AFM-1';
                    ID = 'Tag_7';
                case 'V2'
                    TagType = 'AFM-2';
                    ID = 'Tag_7';
                case 'T'
                    TagType = 'Tablet';
                    ID = 'Tag_5';
            end
            
            try
                figure
                hold on
                plot(Data.Ex5.Filtered.(AFMname{m}).Test3.(ID)(:,1),180-abs(Data.Ex5.Filtered.(AFMname{m}).Test3.(ID)(:,7)),'*','DisplayName',[TagType ' Detections Ambient'])
                plot(Data.Ex6.Filtered.(AFMname{m}).Test3.(ID)(:,1),180-abs(Data.Ex6.Filtered.(AFMname{m}).Test3.(ID)(:,7)),'*','DisplayName',[TagType ' Detections Backlit'])
                gcf();
                legend('Location','NW')
                Tsave = ['Measured Angle vs Known Angle with False Positives In Water Ambient vs Dark'];
                title({'Measured Angle vs Known Angle with False Positives'; 'At 4 Meters In Water Ambient vs Dark'})
                xlabel('Known Angle (deg)')
                ylabel('Measured Angle (deg)')
                grid on
                hold off
                % Set the background color to white
                set(gcf,'color','w');
                fprintf('DLw_%s_Test3 = %s \n',TagType,Tsave)
                %eval(sprintf('export_fig DLw_%s_Test3 -png -r300 -painters',TagType))
            catch
                warning(['No Detection at Ex5/Ex6, ', AFMname{m}, ', Test3']);
                legend('Location','NW')
                continue
            end
        
        end



        for m = 1:numel(AFMname)
            switch AFMname{m}
                case 'P'
                    continue
                    TagType = 'Paper Tag';
                    ID = 'Tag_5';
                case 'V1'
                    TagType = 'AFM-1';
                    ID = 'Tag_7';
                case 'V2'
                    TagType = 'AFM-2';
                    ID = 'Tag_7';
                case 'T'
                    TagType = 'Tablet';
                    ID = 'Tag_5';
            end
            
            try
                figure
                hold on
                plot(Data.Ex5.Filtered.(AFMname{m}).Test4.(ID)(:,1),180-abs(Data.Ex5.Filtered.(AFMname{m}).Test4.(ID)(:,7)),'*','DisplayName',[TagType ' Detections Ambient'])
                plot(Data.Ex6.Filtered.(AFMname{m}).Test4.(ID)(:,1),180-abs(Data.Ex6.Filtered.(AFMname{m}).Test4.(ID)(:,7)),'*','DisplayName',[TagType ' Detections Backlit'])
                gcf();
                legend('Location','NW')
                Tsave = ['Measured Angle vs Known Angle with False Positives In Water Ambient vs Dark'];
                title({'Measured Angle vs Known Angle with False Positives'; 'At 6 Meters In Water Ambient vs Dark'})
                xlabel('Known Angle (deg)')
                ylabel('Measured Angle (deg)')
                grid on
                hold off
                % Set the background color to white
                set(gcf,'color','w');
                fprintf('DLw_%s_Test4 = %s \n',TagType,Tsave)
                %eval(sprintf('export_fig DLw_%s_Test4 -png -r300 -painters',TagType))
            catch
                warning(['No Detection at Ex5/Ex6, ', AFMname{m}, ', Test4']);
                legend('Location','NW')
                continue
            end
        end



%%
        AFMname = fieldnames(Data.Ex5.Smoothed);
        
        for m = 1:numel(AFMname)
            switch AFMname{m}
                case 'P'
                    continue
                    TagType = 'Paper Tag';
                    ID = 'Tag_5';
                case 'V1'
                    TagType = 'AFM-1';
                    ID = 'Tag_7';
                case 'V2'
                    TagType = 'AFM-2';
                    ID = 'Tag_7';
                case 'T'
                    TagType = 'Tablet';
                    ID = 'Tag_5';
            end
            
            try
                figure
                hold on
                plot(Data.Ex5.Smoothed.(AFMname{m}).Test1.(ID)(:,1),Data.Ex5.Smoothed.(AFMname{m}).Test1.(ID)(:,6),'*','DisplayName',[TagType ' Detections Ambient'])
                plot(Data.Ex6.Smoothed.(AFMname{m}).Test1.(ID)(:,1),Data.Ex6.Smoothed.(AFMname{m}).Test1.(ID)(:,6),'*','DisplayName',[TagType ' Detections Backlit'])

                gcf();
                legend('Location','NW')
                Tsave = ['Measured Distance vs Known Distance without False Positives In Water Ambient vs Dark'];
                title({'Measured Distance vs Known Distance without False Positives'; 'In Water Ambient vs Dark'})
                xlabel('Known Dist (m)')
                ylabel('Measured Dist (m)')
                grid on
                hold off
                % Set the background color to white
                set(gcf,'color','w');
                fprintf('DLw_%s_Test1S = %s \n',TagType,Tsave)
                %eval(sprintf('export_fig DLw_%s_Test1S -png -r300 -painters',TagType))
                
            catch
                warning(['No Detection at Ex5/Ex6, ', AFMname{m}, ', Test1']);
                legend('Location','NW')
                continue
            end
        end


        for m = 1:numel(AFMname)
            switch AFMname{m}
                case 'P'
                    continue
                    TagType = 'Paper Tag';
                    ID = 'Tag_5';
                case 'V1'
                    TagType = 'AFM-1';
                    ID = 'Tag_7';
                case 'V2'
                    TagType = 'AFM-2';
                    ID = 'Tag_7';
                case 'T'
                    TagType = 'Tablet';
                    ID = 'Tag_5';
            end
            
            try
                figure
                hold on
                plot(Data.Ex5.Smoothed.(AFMname{m}).Test2.(ID)(:,1),180-abs(Data.Ex5.Smoothed.(AFMname{m}).Test2.(ID)(:,7)),'*','DisplayName',[TagType ' Detections Ambient'])
                plot(Data.Ex6.Smoothed.(AFMname{m}).Test2.(ID)(:,1),180-abs(Data.Ex6.Smoothed.(AFMname{m}).Test2.(ID)(:,7)),'*','DisplayName',[TagType ' Detections Backlit'])
                gcf();
                legend('Location','NW')
                Tsave = ['Measured Angle vs Known Angle without False Positives In Water Ambient vs Dark'];
                title({'Measured Angle vs Known Angle without False Positives'; 'At 2 Meters In Water Ambient vs Dark'})
                xlabel('Known Angle (deg)')
                ylabel('Measured Angle (deg)')
                grid on
                hold off
                % Set the background color to white
                set(gcf,'color','w');
                fprintf('DLw_%s_Test2S = %s \n',TagType,Tsave)
                %eval(sprintf('export_fig DLw_%s_Test2S -png -r300 -painters',TagType))
            catch
                warning(['No Detection at Ex5/Ex6, ', AFMname{m}, ', Test2']);
                legend('Location','NW')
                continue
            end
        end            

           
        for m = 1:numel(AFMname)
            switch AFMname{m}
                case 'P'
                    continue
                    TagType = 'Paper Tag';
                    ID = 'Tag_5';
                case 'V1'
                    TagType = 'AFM-1';
                    ID = 'Tag_7';
                case 'V2'
                    TagType = 'AFM-2';
                    ID = 'Tag_7';
                case 'T'
                    TagType = 'Tablet';
                    ID = 'Tag_5';
            end
            
            try
                figure
                hold on
                plot(Data.Ex5.Smoothed.(AFMname{m}).Test3.(ID)(:,1),180-abs(Data.Ex5.Smoothed.(AFMname{m}).Test3.(ID)(:,7)),'*','DisplayName',[TagType ' Detections Ambient'])
                plot(Data.Ex6.Smoothed.(AFMname{m}).Test3.(ID)(:,1),180-abs(Data.Ex6.Smoothed.(AFMname{m}).Test3.(ID)(:,7)),'*','DisplayName',[TagType ' Detections Backlit'])
                gcf();
                legend('Location','NW')
                Tsave = ['Measured Angle vs Known Angle without False Positives In Water Ambient vs Dark'];
                title({'Measured Angle vs Known Angle without False Positives'; 'At 4 Meters In Water Ambient vs Dark'})
                xlabel('Known Angle (deg)')
                ylabel('Measured Angle (deg)')
                grid on
                hold off
                % Set the background color to white
                set(gcf,'color','w');
                fprintf('DLw_%s_Test3S = %s \n',TagType,Tsave)
                %eval(sprintf('export_fig DLw_%s_Test3S -png -r300 -painters',TagType))
            catch
                warning(['No Detection at Ex5/Ex6, ', AFMname{m}, ', Test3']);
                legend('Location','NW')
                continue
            end
        
        end



        for m = 1:numel(AFMname)
            switch AFMname{m}
                case 'P'
                    continue
                    TagType = 'Paper Tag';
                    ID = 'Tag_5';
                case 'V1'
                    TagType = 'AFM-1';
                    ID = 'Tag_7';
                case 'V2'
                    TagType = 'AFM-2';
                    ID = 'Tag_7';
                case 'T'
                    TagType = 'Tablet';
                    ID = 'Tag_5';
            end
            
            try
                figure
                hold on
                plot(Data.Ex5.Smoothed.(AFMname{m}).Test4.(ID)(:,1),180-abs(Data.Ex5.Smoothed.(AFMname{m}).Test4.(ID)(:,7)),'*','DisplayName',[TagType ' Detections Ambient'])
                plot(Data.Ex6.Smoothed.(AFMname{m}).Test4.(ID)(:,1),180-abs(Data.Ex6.Smoothed.(AFMname{m}).Test4.(ID)(:,7)),'*','DisplayName',[TagType ' Detections Backlit'])
                gcf();
                legend('Location','NW')
                Tsave = ['Measured Angle vs Known Angle without False Positives In Water Ambient vs Dark'];
                title({'Measured Angle vs Known Angle without False Positives'; 'At 6 Meters In Water Ambient vs Dark'})
                xlabel('Known Angle (deg)')
                ylabel('Measured Angle (deg)')
                grid on
                hold off
                % Set the background color to white
                set(gcf,'color','w');
                fprintf('DLw_%s_Test4S = %s \n',TagType,Tsave)
                %eval(sprintf('export_fig DLw_%s_Test4S -png -r300 -painters',TagType))
            catch
                warning(['No Detection at Ex5/Ex6, ', AFMname{m}, ', Test4']);
                legend('Location','NW')
                continue
            end
        end