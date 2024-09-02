clc;
clear;
close all;

%% Problem Definition
CostFunction=@(x) Sphere(x);
nVar=2;
VarSize=[1 nVar];
VarMin=-10*ones(1,nVar);
VarMax=10*ones(1,nVar);
GlobalBest=inf;

%% GSA Parameters
MaxIt=1000;
nPop=30;
G0=100;
alfa=20;
P=1;
kbest=5;
VelMax=1*ones(1,nVar);
VelMin=-1*ones(1,nVar);

%% Initialization

object.Position=[];
object.Cost=[];
object.Velocity=[];
object.q=[];
object.Mass=[];
object.Force=[];
object.Acceleration=[];

object=repmat(object,nPop,1);

for i=1:nPop
    
    object(i).Position=unifrnd(VarMin,VarMax,VarSize);
    object(i).Velocity=zeros(VarSize);
    object(i).q=zeros(VarSize);
    object(i).Mass=zeros(VarSize);
    object(i).Force=zeros(VarSize);
    object(i).Acceleration=zeros(VarSize);
    
    
    object(i).Cost=CostFunction(object(i).Position);
    
    
end


BestCost=zeros(1,MaxIt);

%% GSA Main Loop

for it=1:MaxIt
    
    
    object=MassCalculated( nPop,object );
    
    G=G0*exp(-alfa*(it/MaxIt));
    object= ForceCalculated(nPop,nVar,kbest,P,G,object);
    
    object= AccelerationCalculated( nPop,object );
    
    object = NewPosition( CostFunction,nVar,nPop,object,VarMin,VarMax,VelMin,VelMax);
    
    [Global0 ,indexfit]=min([object.Cost]);
    GPos=object(indexfit).Position;
    
    BestCost(it)= Global0;
     
    if Global0 < GlobalBest
        GlobalBest=Global0;
        GPosBest=GPos;
    end
    disp([' Iteration  '  num2str(it)  ': BestCost = ' num2str( GlobalBest )])
    
end

disp(['x=' , num2str(GPosBest)]);

disp(['Min=' , num2str(GlobalBest)]);



