function [w, iterations,error,od,count]=DeltaTraining(Data, Target, eta, epochs)
[rd, cd]=size(Data);
[rt, ct]=size(Target);
if rt ~= rt
    error('num Data points not equal to num Target');
else
 w=rand(1,cd+1);
 iterations=1;
 count=0;
while  iterations < epochs 
for i=1:rd-1,
 temp=sum(w .* [1,Data(i,:)]);
    if temp < 0
         out(i) = -1;
     else
         out(i)=+1;
    end 
 out=[out out(i)];
 end
 od=out';
 new_data=[Data od];
 diff0=[];
 diff1=[];
 diff2=[];
 for i=1:rd
   diff0(i)= (Target(i)-od(i))*1;
   diff1(i)=(Target(i)-od(i)).*Data(i,1);
   diff2(i)=(Target(i)-od(i)).*Data(i,2);
   end
add_val0=sum(diff0*eta);
add_val1=sum(diff1*eta);
add_val2=sum(diff2*eta);
w(1,1)=w(1,1)+add_val0;
w(1,2)=w(1,2)+add_val1;
w(1,3)=w(1,3)+add_val2;
error(iterations)=(sum(diff0.*diff0))/rd;
iterations=iterations+1;
end
end
 % for i=1:rd
% total error for perceptron
% e=wrong/rd;