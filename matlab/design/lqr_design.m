J = [1 0 0; 0 2 0; 0 0 3];  

A = [zeros(3) eye(3); zeros(3) zeros(3)];
B = [zeros(3); inv(J)];

Q = diag([50 50 50 5 5 5]);   % penalize attitude error more than rate error
R = diag([1e3 1e3 1e3]);            % moderate control effort penalty

K = lqr(A,B,Q,R);
disp(K)