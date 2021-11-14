clc;
inp=input';
tar=target';
l=1:5;                                                                     % for assigning number of layers
n=5:10;                                                                     % for assigning no. of neurons in each layer
NNtrace=zeros(4,[]);                                                        % To trace the corresponding efficient group of neural net combos
F=zeros(7,1);                                                               % To store the value of fitness function, Fitness function = index to assign most efficient solutions

CrryErr=[0.001 0.002 0.003]*1e-8;

%% ANN now loopwise
for L=l(1):l(end)                                                           % Different number of layers
    F([1 2 3],:)=CrryErr;
    
    for N=n(1):n(end)                                                       % For different combos of no. of neurons in each layer
        F([1 2 3],:)=CrryErr;                                               % The first three values are already assigned with the previous values
        
        %% ANN tools applied
        for itr=4:8                                                         
            
            neurons=zeros(1,L);
            x1=randi([n(1) N],1,L);
            neurons=x1;
            net = fitnet(neurons,'trainlm');
            net= train(net,inp,tar);
            err=perform(net,inp,tar);
            F(itr)=1/err;
            NNtrace(itr,(1:L+1))=[L,neurons];
        end
        [sortedX, sortedInds] = sort(F(:),'descend'); top3 = sortedInds(1:3);                                          % to calculate top 3 fitness value
        CrryErr=[F(top3)]; NNtrack=NNtrace(top3,(1:L+1));
        NNtrace([1 2 3],:)=NNtrack;
    end
    [sortedX, sortedInds] = sort(F(:),'descend'); top3 = sortedInds(1:3);                                          % to calculate top 3 fitness value
    CrryErr=[F(top3)]; NNtrack=NNtrace(top3,(1:L+1));
    NNtrace([1 2 3],:)=NNtrack;
    
end

testneurons=NNtrace(top3,:);
y=find(testneurons~=0);
for i=1:3
    testnn=testneurons(i,(1:y+1));
    netTest = fitnet(testnn,'trainlm');
    netTest= train(netTest,inp,tar);
    errTst=perform(netTest,inp,tar);
    if(i == 1)
        a = sim(netTest,sample');
    elseif(i == 2)
        b = sim(netTest,sample');
    else
        c = sim(netTest,sample');
    end    
end