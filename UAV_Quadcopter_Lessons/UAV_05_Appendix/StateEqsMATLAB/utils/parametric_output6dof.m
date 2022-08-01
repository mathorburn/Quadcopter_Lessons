function parametric_output6dof(t,XYZ)
figure
tiledlayout(2,1)
nexttile
plot(t,XYZ(:,1:3));grid on;
title('Position'); legend('x','y','z');

nexttile
plot(t,XYZ(:,4:6));grid on;
title('Velocity'); legend('vx','vy','vz');

figure
tiledlayout(2,1)

nexttile
plot(t,XYZ(:,7:9));grid on;
title('Euler Angles'); legend('x','y','z');

nexttile
plot(t,XYZ(:,10:12));grid on;
title('Angular Velocity'); legend('vx','vy','vz');

end