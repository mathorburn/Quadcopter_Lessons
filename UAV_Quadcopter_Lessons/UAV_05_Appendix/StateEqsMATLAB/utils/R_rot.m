function R=R_rot(psi,phi,thta)
RXY=@(psi)[cos(psi)     -sin(psi)   0        ;  sin(psi)  cos(psi)   0        ;   0           0         1         ];
RYZ=@(phi) [1           0           0        ;  0         cos(phi)   -sin(phi);   0           sin(phi)  cos(phi)  ];
RZX=@(thta) [cos(thta)  0           sin(thta);  0         1          0        ;   -sin(thta)  0         cos(thta) ];
R=RXY(psi)*RYZ(phi)*RZX(thta);
end