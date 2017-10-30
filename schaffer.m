function [f] = schaffer(x,y)

f = -0.5 - ((sin(sqrt((x-1)^2 + (y-1)^2))^2 - 0.5)/(1 + 0.001((x-1)^2 + (y-1)^2))^2)

end

