% Ben Ryan

% Roads - from X, Y with distance of Z
road(a, b, 10).
road(b, c, 5).
road(b, d, 5).
road(f, e, 15).
road(e, d, 10).
road(d, g, 5).
road(g, h, 10).
road(g, i, 15). 

% Routes
% conc/3 used to build the route list 
conc([],L,L).
conc([X|L1],L2,[X|L3]):-
	conc(L1,L2,L3).

route(X, Y, Route) :- 
	road(X, Y, _), conc([X], [Y], Route).

route(X, Y, Route) :-
	road(X, Z, _),
	route(Z, Y, NewRoute),
	conc([X], NewRoute ,Route).

% Part C - Distance
distance(X, Y, Dist) :-
	road(X, Y, Dist).

distance(X, Y, Dist) :-
	road(X, Z, Dist1),
	distance(Z, Y, Dist2),
	Dist is Dist1 + Dist2.