function [w, iterations,od]=gradient_descent(data, Target, eta, epochs)
[rd, cd]=size(data);
[rt, ct]=size(Target);
if rt ~= rt
    error('num Data points not equal to num Target');
else
[rd, cd]=size(data);
 w=rand(1,cd+1);
 iterations=0;
while  iterations < epochs 
 iterations=iterations+1;
 for i=1:rd
     a=w(1,1)*(0.6180 + (0.6180*0.6180));
     b=w(1,2)*(data(i,1)+(data(i,1)*data(i,1)));
     c=w(1,3)*(data(i,2)+(data(i,2)*data(i,2)));
     d=w(1,4)*(data(i,3)+(data(i,3)*data(i,3)));
     e=w(1,5)*(data(i,4)+(data(i,4)*data(i,4)));
     temp(i)=round(a+b+c+d+e);
     class(i)=mod(temp(i),3)+1;
         
 end
 od=class';
 diff0=[];
 diff1=[];
 diff2=[];
 for i=1:rd
   diff0(i)= (Target(i)-od(i))*(0.6180 + (0.6180*0.6180));
   diff1(i)=(Target(i)-od(i))*(data(i,1)+(data(i,1)*data(i,1)));
   diff2(i)=(Target(i)-od(i))*(data(i,2)+(data(i,2)*data(i,2)));
   diff3(i)=(Target(i)-od(i))*(data(i,3)+(data(i,3)*data(i,3)));
   diff4(i)=(Target(i)-od(i))*(data(i,4)+(data(i,4)*data(i,4)));
    end
add_val0=sum(diff0*eta);
add_val1=sum(diff1*eta);
add_val2=sum(diff2*eta);
add_val3=sum(diff3*eta);
add_val4=sum(diff4*eta);
w(1,1)=w(1,1)+add_val0;
w(1,2)=w(1,2)+add_val1;
w(1,3)=w(1,3)+add_val2;
w(1,4)=w(1,4)+add_val2;
w(1,5)=w(1,5)+add_val2;
end
end
   
 
 
