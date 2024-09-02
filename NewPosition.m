function [object ] = NewPosition( CostFunction,nVar,nPop,object,VarMin,VarMax,VelMin,VelMax)



for i=1:nPop
    
    
    object(i).Velocity = rand(1,nVar).*object(i).Velocity + object(i).Acceleration;
    object(i).Velocity = change_state( object(i).Velocity,VelMin,VelMax);
    
    object(i).Position = object(i).Position + object(i).Velocity;
    object(i).Position = change_state( object(i).Position,VarMin,VarMax);
    
    object(i).Cost=CostFunction(object(i).Position);
    
    
    
end

end

