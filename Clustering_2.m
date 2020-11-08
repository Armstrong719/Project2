%the figure of relationship between N and R
x=0.001:0.001:0.5;
y=zeros(1,length(x));

for i=1:length(x)
    y(i)=cluster_number(x(i));
end

plot(x,y,'r-')
hold on
xlabel('area radius (R)')
ylabel('number of clusters (N)')
title('The relationship between area radius and number of clusters')

% plot(0.188,3,'b*')
% plot(0.459,3,'b*')
% text(0.188,3,'(0.188,3)')
% text(0.459,3,'(0.459,3)')