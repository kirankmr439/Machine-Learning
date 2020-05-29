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
 epochs=100;
[w, iterations,error,od,count]=DeltaTraining(Data, Target, eta, epochs);
plot(error)
title('Error Function E')
hold on;
xlabel('iterations');
ylabel('error');


