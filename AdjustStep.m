function [update_division_list, update_accomplish_time] = AdjustStep(division_list, accomplish_time, parameter_list, device_list, car_list)
%对于划分进行一次优化更新

car_count = parameter_list.car_count;

[~, last_car] = max(accomplish_time);
device_idx = find(division_list(last_car, :)==1);
device_num = sum(division_list(last_car, :));
time = zeros(car_count, device_num);
least_time = max(accomplish_time);

update_division_list=[];
update_accomplish_time = 0;

for i = 1: device_num
    device = device_idx(1, i);
    for j = 1: car_count
        if j ~= last_car
            temp_division_list = division_list;
            temp_division_list(last_car, device) = 0;
            temp_division_list(j, device) = 1;
            temp_accomplish_time = TimeAssess(temp_division_list, parameter_list, device_list, car_list)
            time(j, i) = max(temp_accomplish_time);
            if time(j, i)<least_time
                least_time = time(j, i);
                update_accomplish_time = temp_accomplish_time;
            end
        else
            time(last_car, i) = max(accomplish_time);
        end
    end
end

[insert_car, changed_device] = find(time == least_time);
changed_device = device_idx(changed_device);
update_division_list = division_list;
update_division_list(last_car, changed_device) = 0;
update_division_list(insert_car, changed_device) = 1;