-- Wish: compute the graded Betti numbers of a free resolution without minimalizing it
-- This is my "scratch" area for experimentation.  It is checked in because I use it on several 
-- machines
restart
N = 9
D = 3
N = 7
D = 3
R = ZZ/101[vars(0..N-1), MonomialSize=>8]
F = random(R^1, R^{-D})
J = ideal fromDual F
gbTrace=1
time C = res(J, Strategy=>0)

J = ideal J_*
time C = res(J, Strategy=>1)

J = ideal J_*
time C = res(J, Strategy=>2) -- very bad!

J = ideal J_*
time C = res(J, Strategy=>3) -- 

betti C


-- Let's recall what the options are in Strategy 2!
skeletonSort: & 63
reductionSort: 2^6 + (63)
do_by_level: FLAGS_LEVEL (1 << 13)

gbTrace=3
time res(J, SortStrategy=>0, Strategy=>0)
J = ideal J_*;
res(J, StopBeforeComputation=>true, SortStrategy=>3, Strategy=>0)
time C = res(J, SortStrategy=>2^16, Strategy=>0)
time res(J, SortStrategy=>2^16+2^17, Strategy=>0)
time time C = res(J, SortStrategy=>2^16 + 2^17 + 2^18, Strategy=>0)
time res J;

debug Core
rawResolution

restart
R = ZZ/101[vars(0..17)]
m1 = genericMatrix(R,a,3,3)
m2 = genericMatrix(R,j,3,3)
J = ideal(m1*m2-m2*m1)
time res J
J = ideal J_*;
time res(J, SortStrategy=>2^16 + 2^17 + 2^18, Strategy=>0)

-- simple example
R = ZZ/101[a..e]
J = ideal(a^2-b*c, a*c^2-b*d^2, a^2*e^5-b^3*c*d^3)

gens gb J
C = res J
