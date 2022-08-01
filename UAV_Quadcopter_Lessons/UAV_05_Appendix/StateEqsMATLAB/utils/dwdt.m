function wdot=dwdt(t,w,mxyz,fxyz,kd,ff,kp,kv,zdesired)
params=sys_params;
m=params.mass; g=params.gravity;

Ixyz=[5.82857000000000e-05	0	0;0	7.16914000000000e-05	0;0	0	0.000100000000000000];
Mc=[mxyz(1);mxyz(2);mxyz(3)];


xyz=[w(1);w(2);w(3)];       % 1st three rows of state vector are position x,y,z   (Inertial Reference Frame)
uvw=[w(4);w(5);w(6)];       % Rows 4-6 of state vector are velocity u,v,w   (Body Reference Frame)
tpp=[w(7);w(8);w(9)];       % Rows 7-9 of state vector are Euler Angles phi, theta, psi 
pqr=[w(10);w(11);w(12)];    % Rows 10-12 of state vector are Angular Velocity roll, pitch, yaw (Body Reference Frame)

phi=tpp(1);thta=tpp(2);psi=tpp(3);
R=R_rot(psi,phi,thta);


% Forces
f1=[fxyz(1);fxyz(2);fxyz(3)];  % Thrust (Body Frame)
f1=R'*f1; % Thrust (Earth Frame)

% Proportional 
f2=kp*[0; 0; zdesired-xyz(3)]; % Proportional (Earth Frame)

% Differential
vxyz=R'*uvw;
f3=-kv*[0;0;vxyz(3)]; %Differential (Earth Frame)

% Feed Forward 
f4=[0;0;ff]; %Feed Forward(Body Frame)
f4=R'*f4;  %Feed Forward (Earth Frame)

% Gravity
f5=[0;0;m*g];   % Gravity (Earth Frame)

% Drag
f6=-kd*sqrt((uvw)'*uvw)*uvw; %Drag (Body Frame)
f6=R'*f6;  % Drag (Earth Frame)

% Total Force (Body Frame)
Fc=R*(f1+f2+f3+f4+f5+f6);

wdot(1:3,1)=(R')*uvw;
wdot(4:6,1)=-cross(pqr,uvw) + 1/m *(R')*Fc;


%wdot(7:9,1)=pqr;   % this needs to be updated
J=[1, sin(phi).*tan(thta), cos(phi).*tan(thta) ; 0 , cos(phi), -sin(phi) ; 0, sin(phi)/cos(thta), cos(phi)/cos(thta)];
wdot(7:9,1)=J*pqr;


Iw=Ixyz*pqr;   
wdot(10:12,1)=Ixyz\((R')*Mc -cross(pqr,Iw)) ;

end