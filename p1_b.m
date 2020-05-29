rx = randi([-10, 10], 100, 2);
for i = 1:100
    if rx(i , 1 ) + 2*rx(i , 2 ) - 2 > 0
        class_train(i) = 1;
    else
        class_train(i) = -1;
    end
end
class_q1 = class_train';
eta = 0.001;
%% iterations = 5
iterations_5 = 5 ;
[w, out_q1_5, e] = DeltaRule_Training_Batch(rx, class_q1, eta, iterations_5);
figure
plot_2D(rx, out_q1_5, 'g', 'r')
title('With 5 Iterations')
legend('class = 1', 'class = -1')


%% iterations = 10
iterations_10 = 10 ;
[w, out_q1_10, e] = DeltaRule_Training_Batch(rx, class_q1, eta, iterations_10);
plot_2D(rx, out_q1_10, 'g', 'r')
title('With 10 Iterations')
legend('class = 1', 'class = -1')


%% iterations = 50
iterations_50 = 50 ;
[w, out_q1_50, e] = DeltaRule_Training_Batch(rx, class_q1, eta, iterations_50);
figure
plot_2D(rx, out_q1_50, 'g', 'r')
title('With 50 Iterations')
legend('class = 1', 'class = -1')


%% iterations = 100
iterations_100 = 100 ;
[w, out_q1_100, e] = DeltaRule_Training_Batch(rx, class_q1, eta, iterations_100);
figure
plot_2D(rx, out_q1_100, 'g', 'r')
title('With 100 Iterations')
legend('class = 1', 'class = -1')
