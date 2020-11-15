function  [division_list, accomplish_time] = OverallAdjustment( parameter_list, device_list, car_list)
%通过不断优化，为多个结点多小车问题找到近似最优解

division_list = InitialDivision(parameter_list, device_list);
accomplish_time = TimeAssess(division_list, parameter_list, device_list, car_list);
time = max(accomplish_time);
improved_time = 0;

ratio_boundary = parameter_list.ratio_boundary;
 while (abs(improved_time - time)/time)>=ratio_boundary
     [division_list, accomplish_time] = AdjustStep(division_list, accomplish_time, parameter_list, device_list, car_list);
 end