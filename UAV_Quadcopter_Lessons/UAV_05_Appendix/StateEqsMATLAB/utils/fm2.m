function [t,x]=fm2(phi,theta,z0,v0,tmax)
params=sys_params;   g=params.gravity;
t=linspace(0,tmax,70);
xa=z0(1); ya=z0(2); za=z0(3);

vx0=v0*cos(theta).*cos(phi);
vy0=v0*cos(theta).*sin(phi);
vz0=v0*sin(theta);

x=[xa+vx0*t; ya+vy0*t; za+vz0*t+0.5*g*t.^2];
end