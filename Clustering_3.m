%The optimal range of R: 0.105<R<0.205
%choose R=0.15

%read the final feature values of all samples
features=xlsread('feature2.csv');
features=[(1:14)',features(2:15,:)];
%the first column is the ID of the test sample, from 1 to 14

%plot figure
plot3(features(:,2),features(:,3),features(:,4),'b*')
%axis([0, 1, 0, 1, 0, 1])
xlabel('Y1')
ylabel('Y2')
zlabel('Y3')
grid on

%circular area method
%Use the Sphere Overlap Method to classify
c1=features(1,2:4);
c2=features(2,2:4);
c3=features(3,2:4);
c4=features(4,2:4);
c5=features(5,2:4);
c6=features(6,2:4);
c7=features(7,2:4);
c8=features(8,2:4);
c9=features(9,2:4);
c10=features(10,2:4);
c11=features(11,2:4);
c12=features(12,2:4);
c13=features(13,2:4);
c14=features(14,2:4);

r=0.15;%the radius
disp(['r = ',num2str(r)])

cluster=1;
clusters=zeros(14,1);

%let test1 to be cluster1
disp(['Test1 ','is belong to cluster',num2str(cluster)])
clusters(1,1)=cluster;
cluster=cluster+1;

%classify the samples below
for i=2:14
    coor=features(i,2:4);
    for j=1:(i-1)
        if((norm(coor-features(j,2:4))<2*r && norm(coor-features(j,2:4))>0))
            clusters(i,1)=clusters(j,1);
        end
    end
    if clusters(i,1)~=0
        disp(['Test',num2str(features(i,1)),' is belong to cluster',num2str(clusters(i,1))])
    elseif clusters(i,1)==0
        clusters(i,1)=cluster;
        cluster=cluster+1;
        disp(['Test',num2str(features(i,1)),' is belong to cluster',num2str(clusters(i,1))])
    end
end

