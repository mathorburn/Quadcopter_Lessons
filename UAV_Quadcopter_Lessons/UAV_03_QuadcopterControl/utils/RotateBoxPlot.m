function rotateBoxPlot(phi, theta, psi)

% These from: https://www.mathworks.com/help/matlab/visualize/multifaceted-patches.html
vertices = [-1.0 -0.5 -0.25; -1.0 0.5 -0.25; 1.0 0.5 -0.25; 1.0 -0.5 -0.25; -1.0 -0.5 0.25; -1.0 0.5 0.25; 1.0 0.5 0.25; 1.0 -0.5 0.25; 
    -2,0,0; 0, 0.01, 0.01  ;0,-0.01,-0.01    ; 2, 0, 0;
    0,-2,0; 0.01 ,0 ,0.01  ;-0.01 ,0, -0.01  ; 0, 2, 0;
    0,0,-2; 0.01, 0.01, 0  ;-0.01, -0.01, 0  ; 0, 0, 2];
faces = [1 2 3 4; 2 6 7 3; 4 3 7 8; 1 5 8 4; 1 2 6 5; 5 6 7 8; 9 10 11 12 ;13 14 15 16; 17 18 19 20];


figure

p = patch("Vertices",vertices,"Faces",faces,'facecolor',[0.5,0.5,0.5]);
rotate(p,[1 0 0],phi)
rotate(p,[0 1 0],theta)
rotate(p,[0 0 1],psi)
   
            
axis equal
hold off
axis([-1 1 -1 1 -1 1]*2.5)
xlabel(' x ')
ylabel(' -y ')
zlabel(' -z ')
grid on
view(20,30)

end