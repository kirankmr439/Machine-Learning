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
     i=i+1;
 end
 
 Target=class';
 eta=0.05;

%% iterations = 5
iterations_5 = 5 ;
[w,iterations,error,od_5,count] = DeltaTraining(Data, Target, eta, iterations_5);
plot_2D(Data, od_5, 'g', 'r')
title('With 5 Iterations')
legend('class = 1', 'class = -1')


%% iterations = 10
iterations_10 = 10 ;
[w,iterations,error,od_10,count] = DeltaTraining(Data, Target, eta, iterations_10);
figure;
plot_2D(Data, od_10, 'g', 'r')
title('With 10 Iterations')
legend('class = 1', 'class = -1')


%% iterations = 50
iterations_50 = 50 ;
[w,iterations,error,od_50,count] = DeltaTraining(Data, Target, eta, iterations_50);
figure
plot_2D(Data, od_50, 'g', 'r')
title('With 50 Iterations')
legend('class = 1', 'class = -1')


%% iterations = 100
iterations_100 = 100 ;
[w,iterations,error,od_100,count] = DeltaTraining(Data, Target, eta, iterations_100);
figure
plot_2D(Data, od_100, 'g', 'r')
title('With 100 Iterations')
legend('class = 1', 'class = -1')
