function [average_profits1, average_profits2] = p2simulate1()

p_array = [0.996, 0.997];
average_profits1 = [];
average_profits2 = [];

for p = p_array
    sum1 = 0;
    sum2 = 0;
    
    for i=1:5000
        sum1 = sum1 + p2strategy1(1, p, 0);
        sum2 = sum2 + p2strategy2(1, p, 0);
    end

    average_profit1 = sum1/5000;
    average_profits1 = [average_profits1, average_profit1];
    
    average_profit2 = sum2/5000;
    average_profits2 = [average_profits2, average_profit2];
end
end