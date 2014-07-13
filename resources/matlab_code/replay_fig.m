close all;
clear all;
clc;
MaxValue = 256;

dir = './results/'
origin = [dir,'original/replay_original_1000.csv'];%origin
optv1 = [dir,'optv1/replay_optv1_1000.csv'];%gf-mult two
optv2 = [dir,'optv2/replay_optv2_10000.csv'];%gf-mult rnd or cst
optv3 = [dir,'optv3/replay_optv3_gf1_1000.csv'];%gf-mult one
optv4_1 = [dir,'optv4/replay_optv4_gf1_1000.csv'];%flip-gfm one
optv4_2 = [dir,'optv4/replay_optv4_gf2_10000.csv']%flip-gfm two
M_live=csvread(optv2);

S = 1:100;
B_S = dec2bin(S);
s_1=S(1):1:S(length(S));
bs1=dec2bin(s_1,16);

S1 = S-1;
M_tmp = M_live(S,2);
%M_tmp = 1./M_live(C,2);
scatter(S1,M_tmp,20,'*','b');

set (gcf,'Position',[400,100,1000,400]);
ylim([0 256]);
xlabel('Decimal Value of Input Message Block');
ylabel('Tags Range Size');


%{
set(gca,'XTick',s_1,'XTickLabel',bs1);
h = gca;
rotateticklabel(gca,'x',40);
%}
%bar(S,[M1(S+1,2)/MaxValue M2(S+1,2)/MaxValue M3(S+1,2)/MaxValue]);
%{
hold on
bar(S,M2(S+1,2)/MaxValue);
hold on
bar(S,M3(S+1,2)/MaxValue);
legend('Only shift','Two rounds shuffle then shift','Xor the nonce')
set(gca,'XTick',s_1,'XTickLabel',bs1);
h = gca;
rotateticklabel(gca,'x',10);
%}

%{
%find all pattern value in column 1 as x, store in C
top = 0.37 
bot = 0.372
A = [0,17,34,51,68, 85, 102, 119, 136, 153, 170, 187,204, 221, 238, 255];
X = 0:255;
%Both no-pattern
B = setdiff(X,A);
D = B;
C = [];
for i=D
    for j=B
       C = [C i*256+j+1];
       k = i*256+j+1;
       if M_live(k,2)/MaxValue >top && M_live(k,2)/MaxValue < bot
           least1 = [least1 k-1];
       end
    end
end
M_tmp = M_live(C,2)/MaxValue;
%M_tmp = 1./M_live(C,2);
scatter(C,M_tmp,20,'o','b');


%Both pattern
hold on
C=[];
B = A;
for i=A
    for j=B
       C = [C i*256+j+1];
       k = i*256+j+1;
       if M_live(k,2)/MaxValue >top && M_live(k,2)/MaxValue < bot
           least2 = [least2 k-1];
       end
    end
end
M_tmp = M_live(C,2)/MaxValue;
%M_tmp = 1./M_live(C,2);
scatter(C,M_tmp,20,'fill','r');

%pattern and no-pattern
hold on
C=[];
B = setdiff(X,A);
for i=A
    for j=B
       C = [C i*256+j+1];
       k = i*256+j+1;
       if M_live(k,2)/MaxValue >top && M_live(k,2)/MaxValue < bot
           least3 = [least3 k-1];
       end
    end
end

for i=B
    for j=A
       C = [C i*256+j+1];
       k = i*256+j+1;
       if M_live(k,2)/MaxValue >top && M_live(k,2)/MaxValue < bot
           least3 = [least3 k-1];
       end
    end
end

for i=X
    for j=X
       k = i*256+j+1;
       if M_live(k,2)/MaxValue >top && M_live(k,2)/MaxValue < bot
           least = [least k-1];
       end
    end
end
M_tmp = M_live(C,2)/MaxValue;
%M_tmp= 1./M_live(C,2);
%draw the figure
scatter(C,M_tmp,20,'v','g');
legend('Both no-pattern','Both pattern', 'Pattern and no-pattern')



least = least';
str1 = dec2bin(least1,16);
str2 = dec2bin(least2,16);
str3 = dec2bin(least3,16);
tmp_int = M_live(256,2)
%tmp_int = M_live(11606,2)
%tmp_int = M_live(21846,2)


set (gcf,'Position',[400,100,1000,400]);


%bar(S,[M1(S+1,2)/MaxValue M2(S+1,2)/MaxValue M3(S+1,2)/MaxValue]);
%{
hold on
bar(S,M2(S+1,2)/MaxValue);
hold on
bar(S,M3(S+1,2)/MaxValue);
legend('Only shift','Two rounds shuffle then shift','Xor the nonce')
set(gca,'XTick',s_1,'XTickLabel',bs1);
h = gca;
rotateticklabel(gca,'x',10);
%}

ylim([0 1]);
xlabel('Decimal Value of Input Message Block');
ylabel('No. of Distinct Tags/ Max No. of Distinct Tags');

%below is useless code

%plot(C,M1,'*');
%scatter(C,M_tmp,5,'fill','g');

%plot(M(:,1),M(:,2)/MaxValue);
%scatter(M(:,1),M(:,2)/MaxValue,5,'fill');
%text(x,y,'\leftarrow0101010111101110');
%}

