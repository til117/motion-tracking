
% This function plots particles, measurements and estimations

function graphics(S,properties,Index,VERBOSE,params,i,x,y)

if (params.version == 0) || (params.version == 1) % For Particle Filter

    [a,~] = size(properties);

    if Index ~= 0
        corners = properties(Index).BoundingBox;
    else
        corners = [0 0 0 0];
    end

    hold on
    plot(S.X(1,:),S.X(2,:),'b.'); % Plot particles
    hold off
    drawnow

    if VERBOSE > 1
        meanx = sum(S.X(1,:)) / size(S.X(1,:),2);
        meany = sum(S.X(2,:)) / size(S.X(2,:),2);

        hold on
        plot(meanx, meany, 'rx','LineWidth',2.0); % Plot mean of particles
        hold off
    end

    if VERBOSE > 2 % Plot rectangle of measurement region
        hold on
        rectangle('Position',[corners(1) corners(2) corners(3) corners(4)],'EdgeColor','g');
        hold off
        drawnow
    end

    if VERBOSE > 3

        if a < params.ppl
            tmp = a;
        else
            tmp = params.ppl;
        end

        for k = 1:tmp % Plots several rectangles of measurements
            corners2 = properties(k).BoundingBox;
            hold on
            if k == Index
                rectangle('Position',[corners2(1) corners2(2) corners2(3) corners2(4)],'EdgeColor','g');
            else
                rectangle('Position',[corners2(1) corners2(2) corners2(3) corners2(4)],'EdgeColor','y');
            end
            hold off
            drawnow
        end
    end
    
elseif params.version == 2
    
    if Index ~= 0
        corners = properties(Index).BoundingBox;
    else
        corners = [0 0 0 0];
    end
    
    kx = x - corners(1);
    ky = y - corners(2);
    
    if VERBOSE > 4 % Plots estimated region rectangle and centroid
        hold on
        rectangle('Position',[(S.U(i,1)-kx) (S.U(i,2)-ky) ...
            corners(3) corners(4)],'EdgeColor','b','LineWidth',1.5);
        %viscircles([(S.U(i,1)) (S.U(i,2))],10);
        hold on
        plot(S.U(i,1),S.U(i,2), 'bx','LineWidth',1.5);
        drawnow;
    end
    
    if VERBOSE > 5 % Plots measured region rectange and centroid
        hold on
        rectangle('Position',[corners(1) corners(2) corners(3) corners(4)],'EdgeColor','r');
        hold on
        plot(x,y, 'rx');
    elseif (VERBOSE < 5) || (VERBOSE > 6)
        disp('Please enter correct VERBOSE for chosen Filter Version!');
    end
    
    
else
    disp('Please enter correct Filter Version!');
    
end

end
