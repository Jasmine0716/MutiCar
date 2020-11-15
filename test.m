parameter_list = struct('device_count', 10, ...,
'car_count',3);

car_list = struct('device_count', 0, ...,
'move_speed', 5, ...,
'storage_capacity', 100, ...,
'compute_freq', 8, ...,
'trans', 2.5, ...,
'epsilon', 0.00001, ...,
'iteration', 100, ...,
'distance', [], ...,
'omega', 0.0001)

device_list = struct('num', 0, 'inputsize', 0, 'computation', 0, 'storage', 0, 'prior', -1); % �豸�б�
device_count = parameter_list.device_count;
car_count = parameter_list.car_count;

%test for InitialDivision
for i = 1:device_count
    pause(0.0001);
    device_list(1, i).num = i; % �豸���
    device_list(1, i).inputsize = randi(20) + 10; % �������ݴ�С
    device_list(1, i).computation =randi(20) + 80; % ���㸺��     !!!!
    device_list(1, i).storage = randi(15) + 5; % �洢��С
end

division_list = InitialDivision(device_list, parameter_list);
for i = 1: car_count
    fprintf('\ncar %d: ',i)
    for j = 1: device_count
        if division_list(i, j)==1
            fprintf('device %d-computation %d      ', j, device_list(1, j).computation)
        end
    end
end
fprintf('\n')