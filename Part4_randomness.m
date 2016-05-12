% random variables - continuous uniform distribution 
a = 0;
b = 1;
x = a + (b-a)*rand(1,100);
% random variables - normally distributed
mu = 0; % mean
sigma = 1; % std
x = mu + sigma*randn(1,100);
% random integers
a = 10;
b = 10;
x = randi([a b],1,100);

%%  generate some randomly selected panels

Ntrials = 1e6;
Nwomen = zeros(1,Ntrials);

for idx = 1:Ntrials
   
    % generate a random panel
    panel = rand(1,10);
    Nwomen(idx) = sum(panel >= 0.5);
    
end

% histogram
histogram(Nwomen,-0.5:10.5);

% how often are there less than or 2 women only?
100 * sum(Nwomen <= 2) / Ntrials