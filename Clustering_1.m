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

r=0;%the radius
n=14;%the samples that not be classified

while(n>0)
    r=r+0.001;  %0.01 can be changed by your need
    
    n=14;%update n
    for i=1:14
        coor=features(i,2:4);%coordinate of one test sample
        t1 = (norm(coor-c1)<2*r && norm(coor-c1)>0);
        t2 = (norm(coor-c2)<2*r && norm(coor-c2)>0);
        t3 = (norm(coor-c3)<2*r && norm(coor-c3)>0);
        t4 = (norm(coor-c4)<2*r && norm(coor-c4)>0);
        t5 = (norm(coor-c5)<2*r && norm(coor-c5)>0);
        t6 = (norm(coor-c6)<2*r && norm(coor-c6)>0);
        t7 = (norm(coor-c7)<2*r && norm(coor-c7)>0);
        t8 = (norm(coor-c8)<2*r && norm(coor-c8)>0);
        t9 = (norm(coor-c9)<2*r && norm(coor-c9)>0);
        t10 = (norm(coor-c10)<2*r && norm(coor-c10)>0);
        t11 = (norm(coor-c11)<2*r && norm(coor-c11)>0);
        t12 = (norm(coor-c12)<2*r && norm(coor-c12)>0);
        t13 = (norm(coor-c13)<2*r && norm(coor-c13)>0);
        t14 = (norm(coor-c14)<2*r && norm(coor-c14)>0);
        if( t1 || t2 || t3 || t4 || t5 || t6 || t7 || t8 || t9 || t10 || t11 || t12 || t13 || t14 )
            n=n-1;
        end
    end
end
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

