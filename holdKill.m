function Bounds = holdKill(Ad, Bd, K, p, r)

fprintf("Hold Kill Safety Check\n");
AH = [Ad Bd;K zeros(r)];
AM = [Ad Bd; zeros(r, p) eye(r)];
deadlineMiss = 1;
upperBound = 0;
sequence = AH*AM;
C = {sequence};
while upperBound<1
    fprintf("#Deadline Misses: %d\n", deadlineMiss);
    Bounds = jsr_lift_semidefinite(C, 20);
    lowerBound = Bounds(1);
    upperBound = Bounds(2);
    fprintf("LowerBound: %f, UpperBound: %f\n\n", lowerBound, upperBound);
    C{end+1} = sequence*AM;
    deadlineMiss = deadlineMiss + 1;
end