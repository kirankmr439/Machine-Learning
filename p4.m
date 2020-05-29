x1=randi([-10,10],1,100);
x2=randi([-20,20],1,100);
Data=[x1;x2]';
class=[];
[rd, cd]=size(Data);
 for i=1:rd
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
 eta=0.05;
 %error=0.2;
 epochs=20;
 tic;
 [w, iterations,error,od,count1]=DeltaTraining_Increment(Data, Target, eta, epochs);
 fprintf('The number times the weights updated in Delta_training_Incremental =%i \n',count1);
 toc;
 tic
 [w, iterations,error,od,count2]=DeltaTraining(Data, Target, eta, epochs);
 fprintf('The number times the weights updated in Delta_training_batch =%i \n',count2);
 toc;



