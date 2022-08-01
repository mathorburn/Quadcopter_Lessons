function projectileShooting(f,phi0,theta0,v0,tmax)
figure
z0=[0;0;0];  ztarget=[42;5;0];
%time=linspace(0,tmax,70);

drawStart(z0,ztarget)
drawPath(f,z0,v0,theta0,phi0,tmax)
xlabel(" x-axis ")
ylabel(" y-axis ")
zlabel(" z-axis ")

end
function drawStart(z0,ztarget)
[X,Y,Z] = sphere(10);
r = 1.1;
surf(r*X+z0(1),r*Y+z0(2),r*Z+z0(3),"FaceColor",[0 1 0],"EdgeColor","none")
hold on
[X,Y,Z] = cylinder(3,20);
surf(ztarget(1)+X,ztarget(2)+Y,ztarget(3)+Z*2,'edgecolor','none','facecolor','red')
axis equal
axis([0,50,-25,25,0,40])
grid on
set(gca,"Clipping","off")

end

function drawPath(f,z0,v0,theta,phi,tmax) %,CN)
[time,P]=f(phi,theta,z0,v0,tmax);

x=P(1,:); y=P(2,:); z=P(3,:);

lightangle(0,90)
[X,Y,Z] = sphere(10); % A sphere to plot

for tf=1:length(time)
    ax = gca;
    if(z(tf)<0 || x(tf) > ax.XLim(2) || y(tf) > ax.YLim(2) )
        
        break % Break if it hits an axis limit
    end
    hold on;
    surf(X+x(tf),Y+y(tf),Z+z(tf),"FaceColor",[0.8 0.4 0.4],"EdgeColor","none")
    surf(X+x(tf),Y+y(tf),Z*0,"FaceColor","black","EdgeColor","none")
    hold off
    pause(0.001);
end
end
