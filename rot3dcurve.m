x = [-10:0.1:10];
y = [-10:0.1:10];
[xx,yy]=meshgrid(x,y);

z = sin(0.1*xx)+cos(0.1*yy);
subplot(1,2,1); mesh(xx,yy,z);
xlabel('x'); ylabel('y'); zlabel('z'); axis square;

rx = 0;
ry = 0;
rz = pi;

rotX = [1 0       0
        0 cos(rx) -sin(rx)
        0 sin(rx) cos(rx)];
    
rotY = [cos(ry)  0 sin(ry)
        0        1 0
        -sin(ry) 0 cos(ry)];
    
rotZ = [cos(rz) -sin(rz) 0
        sin(rz) cos(rz)  0
        0       0        1];

rot = rotZ*rotY*rotX;

for i = 1:size(z,1)
    for j = 1:size(z,2)
        
        res = rot*[xx(i,j);yy(i,j); z(i,j)];
        newX(i,j) = res(1);
        newY(i,j) = res(2);
        newZ(i,j) = res(3);
    end
end
subplot(1,2,2); mesh(newX,newY,newZ);
xlabel('x'); ylabel('y'); zlabel('z'); axis square;

