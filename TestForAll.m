parameter_list = struct('car_count', 3, ...,
    'device_count', 10, ...,
    'ratio_boundary', 0.1,...,
    'node_distance',[]);

device_list = struct('num', 0, 'inputsize', 0, 'computation', 0, 'storage', 0, 'prior', -1);

car_list = struct('device_count', 0, ...,
'move_speed', 0, ...,
'storage_capacity', 0, ...,
'compute_freq', 0, ...,
'trans', 0, ...,
'epsilon', 0.00001, ...,
'iteration', 100, ...,
'distance', [], ...,
'omega', 0.0001); 

device_count = parameter_list.device_count;
car_count = parameter_list.car_count;

for i = 1: device_count
    pause(0.0001);
    device_list(1, i).num = i; 
    device_list(1, i).inputsize = randi(20) + 10; 
    device_list(1, i).computation = randi(20) + 80; 
    device_list(1, i).storage = randi(15) + 5; 
end

for i = 1: car_count
    pause(0.0001);
    car_list(1, i).move_speed = 5;
    car_list(1, i).storage_capacity = 100;
    car_list(1, i).compute_freq = 8;
    car_list(1, i).trans = 2.5;
    car_list(1, i).epsilon = 0.00001;
    car_list(1, i).iteration = 100;
    car_list(1, i).omega = 0.0001;
end

max_distance = 20;
min_distance = 5;
node_distance = zeros(device_count, device_count); 
for i = 1:device_count
    for j = 1:device_count
        pause(0.0001);
        d = randi(max_distance - min_distance) + min_distance;
        node_distance(i, j) = d;
        node_distance(j, i) = d;
        node_distance(i, i) = 0;
    end
end
parameter_list.node_distance = node_distance;

 [division_list, accomplish_time] = OverallAdjustment(parameter_list, device_list, car_list)