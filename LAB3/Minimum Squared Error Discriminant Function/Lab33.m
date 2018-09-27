disp('Enter data:');
train = input('');
ft = length(train(1,:));
nData = length(train(:,1));

syms('E');
for i=1:nData
    if(ft==1)
        vec = train(i,:);
        x = vec(1);
        d = vec(2);
        E = E + getE(x,d);
    elseif(ft==2)
        vec = train(i,:);
        x1 = vec(1);
        x2 = vec(2);
        d = vec(3);
        E = E + getE(x1,x2,d);
    elseif(ft==3)
        vec = train(i,:);
        x1 = vec(1);
        x2 = vec(2);
        x3 = vec(3);
        d = vec(4);
        E = E + getE(x1,x2,x3,d);
    end
    
end
E = E-sym('E');


syms('w0');
syms('w1');
syms('w2');
syms('w3');
syms('x1');
syms('x2');
syms('x3');

% Differentiate 
if(ft==1)
    D1 = diff(E,w0);
    D2 = diff(E,w1);
    eqns = [D1,D2];
    Solv = solve(eqns,w0,w1);
    
    nD = Solv.w0 + Solv.w1*x1
    
elseif(ft==2)
    D1 = diff(E,w0);
    D2 = diff(E,w1);
    D3 = diff(E,w2);
    eqns = [D1,D2,D3];
    Solv = solve(eqns,w0,w1,w2);
    
    nD = Solv.w0 + Solv.w1*x1 + Solv.w2*x2
    
elseif(ft==3)
    D1 = diff(E,w0);
    D2 = diff(E,w1);
    D3 = diff(E,w2);
    D4 = diff(E,w3);
    
    eqns = [D1,D2,D3,D4];
    Solv = solve(eqns,w0,w1,w2,w3);

    nD = Solv.w0 + Solv.w1*x1 + Solv.w2*x2+ Solv.w3*x3
end

function E = getE(x1,x2,x3,d)
    if(nargin==2)
        d = x2;
        syms('w0');
        syms('w1');
        E = (w0+w1*x1-d)^2;
        
    elseif(nargin==3)
        d = x3;
        syms('w0');
        syms('w1');
        syms('w2');
        E = (w0+w1*x1+w2*x2-d)^2;
    elseif(nargin==4)
        syms('w0');
        syms('w1');
        syms('w2');
        syms('w3');
        E = (w0+w1*x1+w2*x2+w3*x3-d)^2;
    end
end