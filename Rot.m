function rotMat = Rot()

theta = zeros(1, 3);

loopCount = 0;
rotFlag = 'Y';

for counter = 1: 3
    if loopCount > 0
        rotFlag = input('Are there more rotations (Enter Y for yes, N for no): ', 's');
    end
    if strcmp(rotFlag, 'Y')
        axis = input( 'Rotation about axis (Enter X, Y, or Z): ', 's' );
        theta = input( 'Angle of rotation (in degrees): ');
    end
    if loopCount > 0  && strcmp(rotFlag, 'Y')
        frame = input('Rotation about frame (Enter F for fixed, M for moving): ', 's');
    end
    
    switch(axis)
        case 'X'
            theta(1) = theta * pi/180;
        case 'Y'
            theta(2) = theta * pi/180;
        case 'Z'
            theta(3) = theta * pi/180;
    end
    
    loopCount =  loopCount + 1;
end


Rot_x = [ 1         0            0           ;
          0   cos(theta(1))   -sin(theta(1)) ;
          0   sin(theta(1))    cos(theta(1))];

Rot_y = [ cos(theta(2))   0     sin(theta(2)) ;
               0          1          0        ;
          -sin(theta(2))  0     cos(theta(2))];

Rot_z = [ cos(theta(3))  -sin(theta(3))    0 ;
          sin(theta(3))   cos(theta(3))    0 ;
              0                0           1];

rotMat = Rot_x * Rot_y * Rot_z;


end

