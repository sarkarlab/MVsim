function [xy_true] = read_time_series(option, assoc_time, dissoc_time, filename)
if nargin == 0 
    option = 3;
end
switch option
    case 1
        if nargin == 1, assoc_time=150; dissoc_time=150; end
        if nargin < 4, filename = "Fig3c.txt"; end
        concentrations = [[2000*10^-9;0;0], [1000*10^-9;0;0],[250*10^-9;0;0],[62.5*10^-9;0;0],[15.6*10^-9;0;0],[3.9*10^-9;0;0],[250*10^-9;0;0],[0.98*10^-9;0;0]];
    case 2
        if nargin == 1, assoc_time=250; dissoc_time=250; end
        if nargin < 4, filename = "Fig3f.txt"; end
        concentrations = [[0.1*10^-9;0;0],[1*10^-9;0;0],[10*10^-9;0;0],[100*10^-9;0;0]];
    case 3
        if nargin == 1, assoc_time=125; dissoc_time=125; end
        if nargin < 4, filename = "Fig3i.txt"; end
        % 1nM bivalent and <concentrations> monovalent
        concentrations = [[1e-9;250*10^-9;0],[1e-9;50*10^-9;0],[1e-9;2.5*10^-9;0]];
end

Fig_data = readmatrix(filename);

xy_true = struct("RU",[],"s",[],"concentrations",[]);


for i = 1:(size(Fig_data,2)/2)
    x = Fig_data(:,2*i-1);
    y = Fig_data(:,2*i);
    y = [0;y(x>0)];
   
    x = [0;x(x>0)];
    filtered_y = my_filter(x,y,assoc_time);
    
    xy_true(i).RU = filtered_y(~isnan(filtered_y));
    xy_true(i).s = x(~isnan(filtered_y));
    xy_true(i).concentrations = concentrations(:,i);
end
%plot(y_true);
%hold on
%plot(medfilt1(y_true,100))

end

function y = my_filter(x,y,assoc_time)

points = x>assoc_time-1 & x<assoc_time+1;
subset = y(points);

stability_test = 1;
if stability_test
    stable = 0;
    for i = 2:length(subset)-1
        if abs(subset(i)-subset(i+1))>0.1
            subset(i)=subset(i-1);
            stable = stable + abs(subset(i)-subset(i+1));
        elseif stable > 0.1
            subset(i)=subset(i-2);
        end
        stable = stable*0.8;  
    end
    y(points) = subset;
end


points = x>0 & x<2;
subset = y(points);

if stability_test
    artefact = 0;
    for i = 0:floor(length(subset)/10)-1
        if mean(diff(subset(10*i+1:10*(i+1)))) <-0.05 && mean(subset)<max(y)/2
            artefact = 1;
        end
    end
    if artefact ==1
        subset = mean(subset(end-5,end))*((1:length(subset))/length(subset));
    end
    y(points) = subset;
end

end
