function p = change_state(p , lowb , upb)


a=find(p>upb);
b=find(p<lowb);
c=[a b];

p(c)=unifrnd(lowb(c),upb(c));



end