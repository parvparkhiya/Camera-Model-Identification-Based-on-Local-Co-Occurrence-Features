function [E] = Calculate_E(I, CFA, interpolation_flag)
% CFA Pattern is 2x2 matrix where Red has value 1 Green has value 2 and Blue has value 3

	I_CFA = zeros(size(I,1),size(I,2),size(I,3));
	I_CFA(:,:,:) = -1;

	for i = 1 : size(I,1)
		for j = 1:size(I,2)
		    if (mod(i,2)==1 && mod(j,2) ==1)
		        I_CFA(i,j,CFA(1,1)) = I(i,j,CFA(1,1));
	            
		    elseif (mod(i,2)==1 && mod(j,2)==0)
		        I_CFA(i,j,CFA(1,2)) = I(i,j,CFA(1,2));
		    
	        elseif(mod(i,2)==0 && mod(j,2) ==1)
		        I_CFA(i,j,CFA(2,1)) = I(i,j,CFA(2,1));
		    
	        else
		        I_CFA(i,j,CFA(2,2)) = I(i,j,CFA(2,2));
		    end
		            
		end
    end
    
    %Interpolation
	I_R = I_CFA(:,:,1);
	I_G = I_CFA(:,:,2);
	I_B = I_CFA(:,:,3);
	Vq=[];
   %% RED CHANNEL 
    % [X,Y] = meshgrid(1:2:size(I,2),2:2:size(I,1));
    % Val_R=zeros(size(X));
    % for i=1:size(X,1)
    %     for j=1:size(X,2)
    %         Val_R(i,j)=I_R(Y(i,j),X(i,j));
    %     end
    % end
    % [Xq,Yq] = meshgrid(1:1:size(I,2),1:1:size(I,1));
    % if(interpolation_flag ==0 ) %nearest neighbour interpolation
    %     Vq_R = interp2(X,Y,Val_R,Xq,Yq,'nearest');
    % end
    % if(interpolation_flag==1) %% bilinear interpolation
    %     Vq_R = interp2(X,Y,Val_R,Xq,Yq);
    % end
    
    [X,Y,Val_R] = find(I_R.*(I_R~= -1));
    [Xq,Yq]=find(I_R==-1);

    if(interpolation_flag ==0 )% nearest neighbor interpolation    
        F=scatteredInterpolant([Y,X],Val_R,'nearest');
    end
    if(interpolation_flag==1) %% bilinear interpolation
        F=scatteredInterpolant([Y,X],Val_R);
    end
    Vq_R_t=F([Yq,Xq]);
    Vq_R=I_R;

    for i=1:size(Vq_R_t,1)
        Vq_R(Xq(i),Yq(i))=Vq_R_t(i);
    end


    %% GREEN CHANNEL


	[X,Y,Val_G] = find(I_G.*(I_G~= -1));
	[Xq,Yq]=find(I_G==-1);

    if(interpolation_flag ==0 )% nearest neighbor interpolation    
        F=scatteredInterpolant([Y,X],Val_G,'nearest');
    end
    if(interpolation_flag==1) %% bilinear interpolation
        F=scatteredInterpolant([Y,X],Val_G);
    end
    Vq_G_t=F([Yq,Xq]);
	Vq_G=I_G;

	for i=1:size(Vq_G_t,1)
		Vq_G(Xq(i),Yq(i))=Vq_G_t(i);
	end


    %% BLUE CHANNEL

    % [X,Y] = meshgrid(2:2:size(I,2),1:2:size(I,1));
    % Val_B=zeros(size(X));
    % for i=1:size(X,1)
    %     for j=1:size(X,2)
    %         Val_B(i,j)=I_B(Y(i,j),X(i,j));
    %     end
    % end
    % [Xq,Yq] = meshgrid(1:1:size(I,2),1:1:size(I,1));
    % if(interpolation_flag ==0 )% nearest neighbour interpolation
    %     Vq_B = interp2(X,Y,Val_B,Xq,Yq,'nearest');
    % end
    % if(interpolation_flag==1) %% bilinear interpolation
    %     Vq_B = interp2(X,Y,Val_B,Xq,Yq);
    % end


    [X,Y,Val_B] = find(I_B.*(I_B~= -1));
    [Xq,Yq]=find(I_B==-1);

    if(interpolation_flag ==0 )% nearest neighbor interpolation    
        F=scatteredInterpolant([Y,X],Val_B,'nearest');
    end
    if(interpolation_flag==1) %% bilinear interpolation
        F=scatteredInterpolant([Y,X],Val_B);
    end
    Vq_B_t=F([Yq,Xq]);
    Vq_B=I_B;

    for i=1:size(Vq_B_t,1)
        Vq_B(Xq(i),Yq(i))=Vq_B_t(i);
    end

    % subplot(1,2,1);
    % imshow(I(:,:,1)/255);
    % subplot(1,2,2);
    % imshow(Vq_R/255);

    %%
    E = zeros(size(I));
    E(:,:,1) = I(:,:,1)- Vq_R(:,:);
    E(:,:,2) = I(:,:,2)- Vq_G(:,:);
    E(:,:,3) = I(:,:,3)- Vq_B(:,:);
end
