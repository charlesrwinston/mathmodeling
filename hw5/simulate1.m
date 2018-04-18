function [average_profits] = simulate1()

average_profits = zeros(7, 1);

for delivery_day=1:7
    sum = 0;

    for i=1:5000
        sum = sum + strategy1(1, delivery_day, 0);
    end

    average_profit = sum/5000;
    average_profits(delivery_day) = average_profit;
end
end