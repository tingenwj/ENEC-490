%Lecture 5

%Day rows by Hour columns

data=xlsread('pjmhourlybid_2014.xlsx');

vector=mat2vec(data);

gobbled_data=data_goblin(vector);

processed_data=pre_processor(gobbled_data);

figure(1)
plot(vector);xlabel('Hours'); ylabel('Price $/MMBtu')

figure(2)
plot(gobbled_data);xlabel('Hours'); ylabel('Price $/MMBtu')

figure(3)
plot(processed_data);xlabel('Hours'); ylabel('Price $/MMBtu')

%Question 3 under Pre-Processing
%365 days in year, 8760 hours
%Problem variable at (7322,1.395E05) which is day 305.083 so 60 days before end
%of year which will land on Nov 1 at 2am

%Data Transformation
%Question 2

figure(4)

subplot(2,1,1);
hist(processed_data);xlabel('Hours'); ylabel('Price $/MMBtu')

subplot(2,1,2);
qqplot(processed_data);xlabel('Hours'); ylabel('Price $/MMBtu')

normaled=log(processed_data);

figure(5)

subplot(2,1,1);
hist(normaled);xlabel('Hours'); ylabel('Price $/MMBtu')

subplot(2,1,2);
qqplot(normaled);xlabel('Hours'); ylabel('Price $/MMBtu')

Bad=find(isnan(processed_data));
%Element number of NaN in dataset

%Question 3

min_pdata=min(processed_data);

max_pdata=max(processed_data);

std_pdata=nanstd(processed_data);
%This is 15719

mean_pdata=nanmean(processed_data);
%This is 89312

%Therefore, data point 139500 is 3.19 std dev's away from mean using
%(139500-89312)/15719 for entire year. Should do month since demand varies
%by season.

%Question 4

monthly_mean=mean(processed_data(7322:8042));
%This is 86262

monthly_std=std(processed_data(7322:8042));
%This is 10484

%Now, data point 139500 is 5.08 std dev's away from mean using 
%(139500-86262)/10484

%Data Mining
%Question 1

N=numel(processed_data);
daily_peak=max(reshape((processed_data),24,N/24));

%Question 2
tempdata=xlsread('tempdata.xlsx');

%Question 3
figure(6)
scatter(tempdata,daily_peak);xlabel('Daily Electrictiy Peak Price $/MMBtu');ylabel('Temperature in F')
%Graph has a parabola shape, concave up -> peak prices are lower in warmer
%months than cooler