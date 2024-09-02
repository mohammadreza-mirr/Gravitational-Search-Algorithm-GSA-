function [ object ] = ForceCalculated(nPop,nVar,kbest,P,G,object )

[~,index]=sort([object.Mass],'descend');
bestindex=index(1:kbest);

for i=1:nPop
    for j=bestindex
        if i~=j
           
            Rij=norm(object(i).Position-object(j).Position,2);
         
            E= (rand(1,nVar).*(object(j).Mass))./((Rij^P)+eps)...
               .*(object(j).Position - object(i).Position);
           
            object(i).Force=object(i).Force+E;
        end
    end
    
    object(i).Force=object(i).Force * G;
end

