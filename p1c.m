x1=randi([-10,10],1,100);
x2=randi([-20,20],1,100);
Data=[x1;x2]';
class=[];
[rd, cd]=size(Data);
 for i=1:rd-1
     for j=1:cd-1
         y=Data(i,j)+2.*Data(i,j+1)-2;
     end
     if y > 0
         class(i)=1;
     else
         class(i)=-1;
     end
     class=[class class(i)];
 end
 
 Target=class';
%% eta = 0.001
eta = 0.001;
iterations = 100 ;
[w, iterations,error_001,od,count] = DeltaTraining(Data, Target, eta, epochs)
figure
plot(error_001);
title('With Learning Rate = 0.001');
xlabel('iterations');
ylabel('error');

%% eta = 0.01
eta = 0.01;
iterations = 100 ;
[w, iterations,error_01,od,count] = DeltaTraining(Data, Target, eta, epochs)
figure
plot(error_01);
title('With Learning Rate = 0.01');
xlabel('iterations');
ylabel('error');

%% eta = 0.1
eta = 0.1;
iterations = 100 ;
[w, iterations,error_1,od,count] = DeltaTraining(Data, Target, eta, epochs)
figure
plot(error_1)
title('With Learning Rate = 0.1');
xlabel('iterations');
ylabel('error');

%% eta = 1
eta = 0.9999;
iterations = 100 ;
[w, iterations,error_999,od,count] = DeltaTraining(Data, Target, eta, epochs)
figure
plot(error_999);
xlabel('iterations');
ylabel('error');
title('With Learning Rate = 0.9999')
