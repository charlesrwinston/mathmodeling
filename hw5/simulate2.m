function [average_profit] = simulate2()


sum = 0;

for i=1:5000
    sum = sum + strategy2(1, 0);
end

average_profit = sum/5000;

end