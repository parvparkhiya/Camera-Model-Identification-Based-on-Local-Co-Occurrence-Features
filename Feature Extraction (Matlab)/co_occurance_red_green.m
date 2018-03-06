%% co_occurance_1: finding co_occurance matrix for red-green channel channel given E error matrix for all channels and T threshold used after quantization
%% works for any kind of CFA pattern for non repeating color but the repeating color has to be at the positions of (1,1) and (2,2) in CFA pattern.
%% Red has value 1 Green has value 2 and Blue has value 3
function Co_Mat = co_occurance_red_green(E,T,CFA,repeating_color,non_repeating_color)
	D=(2*T)+1;
	Co_Mat=zeros(D,D,D);
	count=0;
    R = CFA == non_repeating_color;
    C = CFA == repeating_color;
    rc = repeating_color;
    nrc = non_repeating_color;
    
	for i=1:floor(size(E,1)/2)
		for j=1:floor(size(E,2)/2)
			count=count+1;
			p=2*(i-1)+1;
			q=2*(j-1)+1;
           
            if(R(1,1) == nrc)
                Co_Mat(E(p,q+1,nrc)+T+1,E(p+1,q+1,nrc)+T+1,E(p,q+1,rc)+T+1)=Co_Mat(E(p,q+1,nrc)+T+1,E(p+1,q+1,nrc)+T+1,E(p,q+1,rc)+T+1)+1;
                Co_Mat(E(p+1,q,nrc)+T+1,E(p+1,q+1,nrc)+T+1,E(p,q+1,rc)+T+1)=Co_Mat(E(p+1,q,nrc)+T+1,E(p+1,q+1,nrc)+T+1,E(p,q+1,rc)+T+1)+1;
            elseif (R(1,2) == nrc)
                Co_Mat(E(p,q,nrc)+T+1,E(p+1,q,nrc)+T+1,E(p,q+1,rc)+T+1)=Co_Mat(E(p,q,nrc)+T+1,E(p+1,q,nrc)+T+1,E(p,q+1,rc)+T+1)+1;
                Co_Mat(E(p+1,q+1,nrc)+T+1,E(p+1,q,nrc)+T+1,E(p,q+1,rc)+T+1)=Co_Mat(E(p+1,q+1,nrc)+T+1,E(p+1,q,nrc)+T+1,E(p,q+1,rc)+T+1)+1;
            elseif (R(2,1) == nrc)
                Co_Mat(E(p,q,nrc)+T+1,E(p,q+1,nrc)+T+1,E(p,q+1,rc)+T+1)=Co_Mat(E(p,q,nrc)+T+1,E(p,q+1,nrc)+T+1,E(p,q+1,rc)+T+1)+1;
                Co_Mat(E(p+1,q+1,nrc)+T+1,E(p,q+1,nrc)+T+1,E(p,q+1,rc)+T+1)=Co_Mat(E(p+1,q+1,nrc)+T+1,E(p,q+1,nrc)+T+1,E(p,q+1,rc)+T+1)+1;
            elseif (R(2,2) == nrc)
                Co_Mat(E(p,q,nrc)+T+1,E(p,q+1,nrc)+T+1,E(p,q+1,rc)+T+1)=Co_Mat(E(p,q,nrc)+T+1,E(p,q+1,nrc)+T+1,E(p,q+1,rc)+T+1)+1;
                Co_Mat(E(p+1,q,nrc)+T+1,E(p,q,nrc)+T+1,E(p,q+1,rc)+T+1)=Co_Mat(E(p+1,q,nrc)+T+1,E(p,q,nrc)+T+1,E(p,q+1,rc)+T+1)+1;
            end
            
		end
	end
	Co_Mat=Co_Mat/count;
end