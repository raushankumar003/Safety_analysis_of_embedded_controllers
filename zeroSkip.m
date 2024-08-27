function Bounds = zeroSkip(Ad, Bd, K, p, r)


deadlineMiss = 1;
upperBound = 0;

fprintf("Zero Skip Safety Check\n");
while upperBound<1
    n = deadlineMiss;
    miss = 1;
    C = {};
    AM = [Ad zeros(p, n*p) Bd; eye(n*p) zeros(n*p, p+r); zeros(r, (n+1)*p+r)];
    while miss<=n
        AH = [Ad zeros(p, n*p) Bd; eye(n*p) zeros(n*p, p+r); zeros(r, miss*p) K zeros(r, (n-miss)*p) zeros(r)];
        sequence = AH;
        counter = 1;
        while counter<=miss
            sequence = sequence*AM;
            counter = counter + 1;
        end
        miss = miss + 1;
        C{end+1} = sequence;
    end
    fprintf("#Deadline Misses: %d\n", deadlineMiss);
    Bounds = jsr_lift_semidefinite(C, 20);
    lowerBound = Bounds(1);
    upperBound = Bounds(2);
    fprintf("LowerBound: %f, UpperBound: %f\n\n", lowerBound, upperBound);
    C{end+1} = sequence*AM;
    deadlineMiss = deadlineMiss + 1;
end