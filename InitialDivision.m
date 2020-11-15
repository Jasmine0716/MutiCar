function division_list= InitialDivision( parameter_list, device_list)
% 以每个小车的计算任务尽量均衡为准则，对于结点进行划分

car_count = parameter_list.car_count;
device_count = parameter_list.device_count;
division_list = zeros( car_count, device_count); %aij=1代表j结点属于第i个小车的任务

computation_list = zeros(1, car_count);
average_computation = 0;
difference = zeros(1, car_count);

for i = 1:device_count
    average_computation = (average_computation*car_count+device_list(1, i).computation)/car_count;
    if i<=car_count
        division_list(i, i) = 1;
        computation_list(1, i) = computation_list(1, i) + device_list(1, i).computation;
    else
        for j = 1:car_count
            temp_computation_list = computation_list;
            temp_computation_list(1, j) = temp_computation_list(1, j) + device_list(1, i).computation;
            difference(1, j) = sum(abs(temp_computation_list - average_computation));
        end
        [least_difference, best_choice] = min(difference);
        division_list(best_choice, i) = 1;
        computation_list(1, best_choice) = computation_list(1, best_choice) + device_list(1, i).computation;
    end
end
average_computation
computation_list