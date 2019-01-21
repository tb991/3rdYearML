% generate "all" points between two points
function out = linify(twoPoints)
[m, c] = convertPath(twoPoints); % expecting all points between these values
hold on;
% plot(1,2,'rx');
% plot(3,10,'bx');
% axis equal;
% s = -10:10;
% y = 4*s + -2;
% plot(s, y,'g-')
count = 1;
for i = twoPoints(1,1):0.01:twoPoints(2,1)
    if (m ~= Inf && c ~= Inf && m ~= -Inf && c~= -Inf)
        y(count) = m*i + c;
        x = i;
        %plot(x, y(count), 'rx');
        out(count,:) = [x,y(count)];
        count = count + 1;
    else
        disp('Infinity detected!');
        disp(twoPoints);
        %out = [666, 666];
        for j=twoPoints(1,2):0.01:twoPoints(2,2)
            y = j;
            x = twoPoints(1,1);
            out(count,:) = [x,y];
            count = count + 1;
        end
%         if count==1
%            y(count) = twoPoints(2,2); 
%         else
%             y(count) = y(count-1) + 0.01;
%         end
%         x = twoPoints(1,1);
%         out(count,:) = [x,y(count)];
%         count = count + 1;
    end
end