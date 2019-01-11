# Telecom-Churn-Prediction-Capstone-Project-
Predicting the churn of a telecom company using Logistic Regression Algorithm
## Problem Statement
- Senior management at Mobicom is concerned that the market environment of rising churn rates and declining ARPU(Average Revenue Per User).
- Some proactive retention programs like enhancing marketing programs to increase minutes of usage (MOU), rate plan migration, and a         bundling strategy among others are carried out to retain the customers.
- According to the 2014, Acquisition and Retention Study Report from Nokia, mobile operators  who lead in loyalty outperform their           competition in network and service quality, as well as in customer care.
- The study results also show that churn continues to keep operators worried with 40% of customers globally planning to switch provider in   the next 12 months. Cost and billing plays a key role across markets when deciding to stay with an operator, but is specifically           important for emerging markets where 49% of customers consider it to be the most important factor when deciding to stay with an operator,   with network and service quality following at 25%. When it comes to data usage, the number of subscribers experiencing problems is high. - Among the problems they report are slow download speeds (20%), data throttling (17%) and applications that don’t work (16%).
  Recommendations from family and friends have gained in importance in the decision to switch operators is another key findings from the     report.
- Usage based promotions to increase minutes of usage (MOU) for both voice and data. It is an accepted fact that low usage and high churn     go hand in hand. Rate Plan Migration is a strategy to move customers from non-optimal plans to optimal plans as it has been observed that   subscribers on non-optimal rate plans have significantly higher odds of churn relative to subscribers on optimal rate plans.

At Mobicom, you are a business analyst and have been urgently called into a meeting with the marketing head and retention manager. The agenda of this meeting is to discuss the results of Industry survey reports that have been just released. In response to these reports, senior management at Mobicom is concerned that the market environment of rising churn rates and declining ARPU will hit them even harder as churn rate at Mobicom is relatively high. Currently they have been focussing on retaining their customers on a reactive basis when the subscriber calls in to close the account. But this alone does not seem to be enough and the management team is keen to take more initiatives on this front. One of these is to roll out targeted proactive retention programs, which include usage enhancing marketing programs to increase minutes of usage (MOU), rate plan migration, and a bundling strategy among others.  To be able to effectively drive these retention strategies, a few key questions of interest require urgent attention and you been given the task of showcasing data based insights and recommendations relating to subscriber churn.

## Churn Market Survey Report

Mobile operators who lead in loyalty outperform their competition in network and service quality, as well as in customer care, according to the 2014 Acquisition and Retention Study Report from Nokia. While retention drivers vary by market maturity, delivering excellent quality keeps customers happy and loyal. The study results also show that churn continues to keep operators on their toes with 40% of customers globally planning to switch provider in the next 12 months. Cost and billing plays a key role across markets when deciding to stay with an operator, but is specifically important for emerging markets where 49% of customers consider it to be the most important factor when deciding to stay with an operator, with network and service quality following at 25%. When it comes to data usage, the number of subscribers experiencing problems is high.  Among the problems they report are slow download speeds (20%), data throttling (17%) and applications that don’t work (16%). Another key finding of the 2014 Acquisition and Retention Study Report is that recommendations from family and friends have gained in importance in the decision to switch operators. Subscribers who have switched operators in recent months reported two key information sources in their decision: the Internet and recommendation of family and friends.

Another report by Ovum forecasts a falling ARPU, which will continue to decline across all markets.

Proactive Retention Strategies

Usage based promotions to increase minutes of usage (MOU) for both voice and data. It is an accepted fact that low usage and high churn go hand in hand.

Rate Plan Migration is a strategy to move customers from non-optimal plans to optimal plans as it has been observed that subscribers on non-optimal rate plans have significantly higher odds of churn relative to subscribers on optimal rate plans.

Offer bundling and churn have been found to be negatively correlated. A family bundle is an option that is being considered especially in the light of one of the observations from the survey that referrals from family and friends are a deciding factor for switching carrier.

## Definitions:

Bundling A bundling strategy involves offering several products/services for sale as one combined

product (e.g., package deal), using demand for the dominant product to sell a secondary offer. This combined product is offered at a discount price so that it is cheaper to buy the bundle than products separately. 

Optimal rate plan A post-paid wireless rate plan typically includes a fixed number of voice minutes that a customer can use per month. Usage exceeding the monthly allowance is called overage and is charged at a premium per-minute rate. Unless customers have a good understanding of their historical usage patterns and have the ability to predict their future wireless needs accurately, selecting an optimal rate plan to subscribe can be a challenging task. Conceptually, non-optimal rate plan subscribers could have saved money by switching to other more suitable plans to minimize overage. Specifically, customer’s rate plan suitability is determined based on their actual voice usage, the monthly rate of their selected plans, and the associated overage charges. Given that rate plan is not available on the data file, a proxy for non-optimal rate plan could be higher overage revenue as a percentage of total revenue.  

Artificial churn/spinners or serial churners “Artificial” churn may be encouraged by so called “spinners”, who disconnect and reconnect to the same network by taking advantage of offers available.

### Top Line Questions of Interest to Senior Management:

1) What are the top five factors driving likelihood of churn at Mobicom?

2) Validation of survey findings. a) Whether “cost and billing” and “network and service quality” are important factors influencing        churn behaviour.  b) Are data usage connectivity issues turning out to be costly? In other words, is it leading to churn?

3) Would you recommend rate plan migration as a proactive retention strategy?

4) What would be your recommendation on how to use this churn model for prioritisation of customers for a proactive retention campaigns    in the future?
 
5) What would be the target segments for proactive retention campaigns? Falling ARPU forecast is also a concern and therefore, Mobicom      would like to save their high revenue customers besides managing churn. Given a budget constraint of a contact list of 20% of the        subscriber pool, which subscribers should prioritized if “revenue saves” is also a priority besides controlling churn. In other          words, controlling churn is the primary objective and revenue saves is the secondary objective.

## Summary
![telecom1](https://user-images.githubusercontent.com/44108439/51005282-3153d000-1564-11e9-96cc-07e440a6160d.png)
- The above figure represents the top five factors affecting churn in the company Mobicom.

## Top five factors affecting churn
1) FACTOR-1  tells us that uniqsubs variable in the level 7 has the first highest unit increase of 0.7512079 in churn which means some offers should be rolled out for families with 7 unique subscribers as it is said that churn rate is  increasing as the subscriber is getting influenced and recommended by family and friends to switch the operators.
2) FACTOR-2 tells us that retdays variable has second highest unit increase of 0.6722432 in churn which is the number of days since the last retention call. Retention calls are made to retain the customers over some period.
3) FACTOR-3 tells us that asl_flagN variable has third highest unit increase of 0.3918855 in churn that is account spending limit under level "N" is the monthly maximum spending limit for Mobicom and "N" specifies no account speed limit.(I think this happens mostly with non-optimal rate plan subscribers who have significantly higher odds of churn relative to subscribers on optimal rate plans.)
4) FACTOR-4 tells us that ethnic variable in the level "O" has the fourth highest unit increase of 0.3084353 in churn which means the subscribers whose ethnicity with level "O" should be provided with some offers that is for the subscribers who live in Asia region has to be provided with some offers.
5) FACTOR-5 tells us that area  variable in the level "NORTH WEST AREA" has the fifth highest unit increase of 0.2506568  in churn which means the subscribers who live in North-West region has to be provided with some offers. The company has to roll-out some special plans to this area to reduce the churn.

## Cost and Billing factor
- Variables like totmrc_Mean, rev_Range, ovrrev_Mean, totrev influence on cost and billing factor
  totmrc_Mean var is the base plan charge cost to the customer that has the beta coefficient of -0.00603758 that is causing churn to       decrease by 0.00603758/unit.
- rev_Range var is the range of revenue that represents the billing amount to the customer that has the beta coefficient,of 0.00207155     that is causing churn to increase by 0.00207155/unit.
- ovrrev_Mean var is the addition of 2 variables datovr_Mean and vceovr_Mean which is the mean average revenue that is again sum of the   data and voice, that has the beta coefficient of 0.00685211 that is causing churn to increase by 0.00685211/unit.
- totrev var is the total revenue earned from the customers that has the beta coefficient of  0.00024202 that is causing churn to         increase by 0.00024202/unit.
By above seen values its negligible amount of impact on the churn rate. Therefore, cost and billing is can be an important factor influencing churn behavior in Mobicom As the variables like rev_Range, ovrrev_Mean, totrev turns out to increase the churn. Thus it as to be considered.

## Network and Security Quality factor
- mou_Range var is the unit increase in range of number of minutes of use may be based on promotion  which is a Proactive Retention       Strategy, by which there is an increase in churn by 0.00024676 units.
- change_mou var is the unit increase in percentage change in monthly minutes of use comparing with 3 months average, there is decrease of churn by -0.00062382 units.
- drop_blk_mean var is the unit increase in mean number of dropped or blocked calls there by increasing churn by 0.00688997 units.
- drop_vce_Range var is the unit increase in range of number of dropped voice calls there by increasing churn by 0.01874519 units.
- mou_opkv_Range  var is the unit increase in range of unrounded minutes of use of off-peak voice calls,i.e., calls apart from Monday to Friday from 7.00am to 9.00pm, there is decrease in churn by -0.00116024 units.
- iwylis_vce_Mean var is the unit increase in mean number of inbound wireless to wireless voice calls, there is a decrease in churn by -0.01589697 units.
- avgqty var is the unit increase in average monthly number of calls over life of the subscriber there by increasing the churn by 0.00085275 units.
- complete_Mean var is the unit increase in mean number of completed voice and data calls thereby decreasing the churn by -0.00193047 units.
- retdays1 var is the unit increase in churn by 0.67224316 units which is quite high compared to other variables retdays means number of days since the last retention call.
- Retention calls are made to  retain the customers over some period There is a high unit for this var and also a important factor influencing the churn which can be due to service quality of the company.
- Therefore, with the increase in number of days since the customer retention call, customer's chances of churning out is quite high. - - These customers has to be paid more attention and appropriate offers have to given in order to retain the customers. And thus network and service quality is not a important factor influencing churn behavior in Mobicom

## Would you recommend rate plan migration as a proactive retention strategy?

- ovrr_Mean is the addition of datovr_mean and vceovr_Mean that is the overall mean for the revenue which considers the sum of data and voice overage revenue values that represents the overage revenue earned from the subs after billing.
- The beta coefficient for the variable ovrr_Mean is 0.00647120 which is negligible and almost 0% impact on the overage billing that is a factor for influencing the churn behavior
- Therefore, the overall rate plan migration as a proactive retention strategy might not help at Mobicom.

## What would be your recommendation on how to use this churn model for prioritisation of customers for a proactive retention campaigns in the future?

Depth                                   Cume   Cume Pct                        Mean
 of           Cume     Mean      Mean      of Total    Lift   Cume    Model
File     N      N      Resp          Resp      Resp    Index   Lift       Score
----------------------------------------------------------------------------------------
  10  1941   1941      0.38      0.38      15.8%     158    158      0.40
  20  1942   3883      0.34      0.36      30.0%     141    150      0.32
                                   Fig: Gains chart
