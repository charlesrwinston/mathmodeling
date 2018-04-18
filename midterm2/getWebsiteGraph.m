function [U, G] = getWebsiteGraph(n)

[U, G] = surfer('https://www.fivethirtyeight.com/', n, 1);

end
