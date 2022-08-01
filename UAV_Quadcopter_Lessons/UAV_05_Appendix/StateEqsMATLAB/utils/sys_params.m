function [ params ] = sys_params()
% Physical properties
params.gravity = 9.81;
params.mass = 0.0638;
params.arm_length = 0.086;

% Actuator limits
params.u_min = 0;
params.u_max = 1.2*params.mass*params.gravity;

end
