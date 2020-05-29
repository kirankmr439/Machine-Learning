x1=randi([-10,10],1,100);
x2=randi([-20,20],1,100);
Data=[x1;x2]';
class=[];
[rd, cd]=size(Data);
i=1;
 while i<=100
      if Data(i , 1 ) + 2*Data(i , 2 ) - 2 > 0
         class(i)=1;
     else
         class(i)=-1;
     end
     class=[class class(i)];
     i=i+1
 end
 
 Target=class';
 eta=0.05;
 %error=0.2;
 epochs=20;
[w, iterations,error,od,count,eta,time_elapsed]=DeltaTraining_second_deacy(Data, Target, eta, epochs);
plot(eta,time_elapsed)
title('Graph between eta and time_elapsed');
xlabel('eta');
ylabel('time_elapsed');
figure;
plot(error)
title('Error function when using decaying learning rate');
xlabel('iterations');
ylabel('error');
figure;
plot(eta);
hold on;


