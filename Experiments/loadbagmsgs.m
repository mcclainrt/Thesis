function [Fields] = loadbagmsgs(msgs,Fname)
        index = 1;
        Fields = [];
        for ii = 1:length(msgs)
            % Loop through detections

            for jj = 1:length(msgs{ii}.Detections)
                Dist_ang = regexp(Fname,'\w*_\w*_._','split');
                DAdbl = str2double(Dist_ang(2));
                field2 = double(msgs{ii}.Detections(jj).Id);
                field3 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.X;
                field4 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Y;
                field5 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Position.Z;
                field6 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.X;
                field7 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Y;
                field8 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.Z;
                field9 = msgs{ii}.Detections(jj).Pose.Pose.Pose.Orientation.W;

                Fields(index,1:5) = [DAdbl,field2,field3,field4,field5];

                quats = [field9,field6,field7,field8];
                eulangs = quat2eul(quats);
                Xdeg = eulangs(:,3)*180/pi;
                Ydeg = eulangs(:,2)*180/pi;
                Zdeg = eulangs(:,1)*180/pi;
                Fields(index,6:8) = [Xdeg,Ydeg,Zdeg];

                index = index + 1;
                
            end
        end
        
        if isempty(Fields)
            fprintf('%s has no detections.\nPress a key. \n',Fname)
            pause
            Fields = zeros(1,8);
        end
          
end