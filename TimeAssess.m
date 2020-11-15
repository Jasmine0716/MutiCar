function accomplish_time = TimeAssess(division_list, parameter_list, device_list, car_list)
%根据划分情况得到总体的完成时间情况

device_count = parameter_list.device_count;
car_count = parameter_list.car_count;
node_distance = parameter_list.node_distance;
accomplish_time = zeros(1, car_count);
car_device_list = struct([]);

for i = 1: car_count
    car_list(1, i).device_count = sum(division_list(i, :));
    car_device_list = device_list(1,find(division_list(i, :)==1));
    car_list(1, i).distance = node_distance( find(division_list(i, :)==1), find(division_list(i, :)==1));
    [ ~, ~, ~, time, ~, ~] = PSTopLayer(car_device_list, car_list(1, i));
    accomplish_time(1, i) = time;
end