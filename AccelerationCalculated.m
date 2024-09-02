function [ object ] = AccelerationCalculated( nPop,object )

for i=1:nPop
    
   object(i).Acceleration=object(i).Force;
    
end

end

