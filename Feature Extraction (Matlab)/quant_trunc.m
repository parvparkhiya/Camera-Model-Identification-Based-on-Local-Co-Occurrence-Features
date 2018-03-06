%% quant_trunc: function description
function E = quant_trunc(E,q,T)
	E=round(E/q);

	mask=ones(size(E))-(E>T);
	E=(mask.*E)+T*(E>T);
	
	mask=ones(size(E))-(E<(-T));
	E=(mask.*E)-T*(E<(-T));

end
