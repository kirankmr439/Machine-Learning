function [w, iterations,error,od,eta]=DeltaTraining_second_adaptive(Data, Target, eta, epochs)
[rd, cd]=size(Data);
[rt, ct]=size(Target);
if rt ~= rt
    error('num Data points not equal to num Target');
else
 w=rand(1,cd+1);
 iterations=1;
 threshold=0.50;
 while  iterations <= epochs 
   %t_start(iterations)=tic;
   if iterations==1
   eta=eta;
   else
   eta(iterations)=power(eta(iterations-1),1);
   end
   out=[];
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
 for i=1:rd-1
   diff0(i)= (Target(i)-od(i))*1;
   diff1(i)=(Target(i)-od(i)).*Data(i,1);
   diff2(i)=(Target(i)-od(i)).*Data(i,2);
 end
%count=count+1;
error(iterations)=(sum(diff0.*diff0))/rd;
if iterations >1 && (error(iterations)-error(iterations-1) >threshold)
eta(iterations)=eta(iterations)*0.81;
elseif  iterations >1 && (error(iterations) < error(iterations-1))
eta(iterations)=eta(iterations)*1.08;
end
add_val0=sum(diff0*eta(iterations));
add_val1=sum(diff1*eta(iterations));
add_val2=sum(diff2*eta(iterations));
w(1,1)=w(1,1)+add_val0;
w(1,2)=w(1,2)+add_val1;
w(1,3)=w(1,3)+add_val2;
%time_elapsed(iterations)=toc( t_start(iterations));
%time_elapsed=[time_elapsed time_elapsed(iterations)];
iterations=iterations+1;
end
end
 % for i=1:rd
% total error for perceptron
% e=wrong/rd;