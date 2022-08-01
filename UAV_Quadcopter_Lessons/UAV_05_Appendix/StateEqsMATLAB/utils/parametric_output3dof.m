function parametric_output3dof(t,XYZ)
figure
tiledlayout(2,1)
nexttile
plot(t,XYZ(:,1:3));grid on;
title('Position'); legend('x','y','z');

nexttile
plot(t,XYZ(:,4:6));grid on;
title('Velocity'); legend('vx','vy','vz');


end