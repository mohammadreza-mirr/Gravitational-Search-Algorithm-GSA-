function [ object ] = MassCalculated( nPop,object )



Best=min([object.Cost]);
Worst=max([object.Cost]);


for i=1:nPop
object(i).q=(object(i).Cost - Worst)./(Best - Worst);
end
S=sum([object.q]);
for j=1:nPop
    
    object(j).Mass=((object(j).q )./ S);
    
end


end

