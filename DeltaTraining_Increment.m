function [w, iterations,error,od,count]=DeltaTraining_Increment(Data, Target, eta, epochs)
[rd, cd]=size(Data);
[rt, ct]=size(Target);
if rt ~= rt
    error('num Data points not equal to num Target');
else
 w=rand(1,cd+1);
 iterations=0;
 count=0;
while  iterations < epochs 
 iterations=iterations+1;
 for i=1:rd
 temp=sum(w .* [1,Data(i,:)]);
    if temp < 0
         od(i) = -1;
     else
         od(i)=+1;
    end 
 diff0(i)= (Target(i)-od(i))*1;
 add_val0=diff0(i)*eta;
 diff1(i)=(Target(i)-od(i)).*Data(i,1);
 add_val1=diff1(i)*eta;
 diff2(i)=(Target(i)-od(i)).*Data(i,2);
 add_val2=diff2(i)*eta;
 w(1,1)=w(1,1)+add_val0;
 w(1,2)=w(1,2)+add_val1;
 w(1,3)=w(1,3)+add_val2;
 count=count+1;
 e(i)=(sum(diff0.*diff0))/rd;
 e=[e e(i)];
end
error(iterations)=sum(e);
end
end
 % for i=1:rd
% total error for perceptron
% e=wrong/rd;