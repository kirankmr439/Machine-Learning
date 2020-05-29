%Machine Learning assignment 1
%Implementing id3 algorithm on iris data after naive discretization or cacc
%discretization

%Team name : balisetty_dogiparthi_sudhana

%Team members : 
%Balisetty Veerendra Kumar Pardhu
%Dogiparthi Kiran Kumar
%Sudhana Prudhvi

clc;
fileID=fopen('iris.txt');
formatSpec='%f,%f,%f,%f,%d';
sizeA=[5 Inf];
A=fscanf(fileID,formatSpec,sizeA);
fclose(fileID);
data=A';
[ discdata,discvalues,discscheme ] = cacc(data);

n=input('Choose 1 for round and 2 for CACC');
switch n
    case 1
        iris=round(data);
        
    case 2
        iris=discdata;
    otherwise 
        disp('Try again')
end




nbins = 15;
accuracies = [];

 for runs = 1:10

    
 discretized_iris = [];

 for x = 1:size(iris, 2) - 1
    
    M = iris(:, x);
    binEdges = linspace(min(M),max(M),nbins+1);    
    discretized_iris = [discretized_iris discretize(M, binEdges)];
    
  end

discretized_iris =  iris;


random_setosa_data = discretized_iris(randperm( 50), :);
other_data = discretized_iris(51:150, :);
random_other_data = other_data(randperm(100),:);


training_examples = [random_setosa_data(1:25,:);random_other_data(1:50, :)];
testing_examples = [random_setosa_data(26:50, :);random_other_data(51:100, :)];


attributes = [1 2 3 4];

tree =ID3(training_examples, 5, attributes);

accuracy = Testing(testing_examples, tree);

accuracies = [accuracies accuracy]; 


end
accuracies;
maxi=max(accuracies)
mini=min(accuracies)
avge=mean(accuracies)
x=1:10;

indexmin = find(min(accuracies) == accuracies);
xmin = x(indexmin);
ymin = accuracies(indexmin);

indexmax = find(max(accuracies) == accuracies);
xmax = x(indexmax);
ymax = accuracies(indexmax);

strmin = ['Minimum = ',num2str(min(ymin))];

strmax= ['Maximum = ',num2str(max(ymax))];

stravg=['Average',num2str(avge)];

str = sprintf('Accuracy Graph When Bins = %d', nbins);

plot(accuracies),xlabel('Observations No'),ylabel('Accuracy'),title(str)

text(xmin,ymin,strmin,'HorizontalAlignment','left')
text(xmax,ymax,strmax,'HorizontalAlignment','right')
text(2,avge,stravg,'HorizontalAlignment','center');

