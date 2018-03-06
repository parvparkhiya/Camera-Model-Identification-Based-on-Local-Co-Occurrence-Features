%% co_occurance_1: finding co_occurance matrix for red channel channel given E error matrix for all channels and T threshold used after quantization
%% works for all patterns if the color is not repeating in the CFA channel
function Co_Mat = co_occurance_red(E,T,CFA)
	D=(2*T)+1;
	Co_Mat=zeros(D,D,D);
	count=0;
    C = CFA ==1;
	for i=1:floor(size(E,1)/2)
		for j=1:floor(size(E,2)/2)
			count=count+1;
			p=2*(i-1)+1;
			q=2*(j-1)+1;
            if(C(1,1)==1)
                Co_Mat(E(p+1,q,1)+T+1,E(p,q+1,1)+T+1,E(p+1,q+1,1)+T+1)=Co_Mat(E(p+1,q,1)+T+1,E(p,q+1,1)+T+1,E(p+1,q+1,1)+T+1)+1;
            elseif(C(2,1)==1)
                Co_Mat(E(p,q,1)+T+1,E(p,q+1,1)+T+1,E(p+1,q+1,1)+T+1)=Co_Mat(E(p,q,1)+T+1,E(p,q+1,1)+T+1,E(p+1,q+1,1)+T+1)+1;
            elseif(C(1,2)==1)
                Co_Mat(E(p,q,1)+T+1,E(p+1,q,1)+T+1,E(p+1,q+1,1)+T+1)=Co_Mat(E(p,q,1)+T+1,E(p+1,q,1)+T+1,E(p+1,q+1,1)+T+1)+1;
            elseif(C(2,2)==1)
                Co_Mat(E(p,q,1)+T+1,E(p,q+1,1)+T+1,E(p+1,q,1)+T+1)=Co_Mat(E(p,q,1)+T+1,E(p,q+1,1)+T+1,E(p+1,q,1)+T+1)+1;
            end
		end
	end
	Co_Mat=Co_Mat/count;
end