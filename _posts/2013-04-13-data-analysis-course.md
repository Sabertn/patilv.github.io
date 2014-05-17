---
layout: post
title: "Data Analysis Course"
description: "Introduction to R"
tags: [R, ggplot2]
comments: true
share: true
---

Although my initial motive for signing up for the Coursera MOOC titled "Data Analysis" in Jan 2013 was to get a sense of how MOOCs work and how quickly they might make my day job extinct, I must admit I feel safer with my job likely to continue to exist (the MOOC model has its benefits and limitations, which I will share in a post at sometime). More importantly, this fun course taught by Jeff Leek from Johns Hopkins got me acquainted with R and its related packages. It required two papers (my submissions are attached to the hyperlinks in the rest of the sentence), the first [one on exploratory analysis](https://www.dropbox.com/s/bt4kt1u6teen4ne/Interest%20rate%20determination-figure%20at%20end.pdf) and the second involved [building a predictive model](https://www.dropbox.com/s/vgjq73crpr1uta1/Human%20Activity%20Prediction%20-Figure%20at%20end.pdf). The first two figures were created for the two papers.  Figure created for the first paper on  exploratory analysis (created using ggplot).

<figure>
<img src="http://1.bp.blogspot.com/-IOF8qgNR0Z0/UWq7E1vBQQI/AAAAAAAACPA/ijA7TQsbrfw/s1600/Figure+with+5+panels.png" alt="">
	<figcaption>Panel A shows that the distribution of interest rates (and means) is different for people who apply for a loan for different purposes. Panel B shows that the distribution of interest rates (and mean interest rate) is different for applicants from different states. Panel C shows that there is, on average, a negative relationship between FICO score and interest rate. Higher the FICO score of an applicant, lower the interest rate they paid. Panel D shows that applicants who applied for a 60 month loan generally paid a higher interest rate than those who applied for only 36 months. Panel E shows the interaction between loan length and amount of loan requested. (36 month loans are represented in red and 60 month loans are in blue). Specifically, it indicates that when the amount requested is low, there is no difference in the interest rates among applicants of 36 months or 60 months loans, but when the amount requested increased, the interest rates increased for 60 month loans but not for 36 month loans. Created using ggplot. Figure for the predictive model paper (Panel A was created using ggplot).</figcaption>
</figure>

<figure> <img src="http://2.bp.blogspot.com/-MTXeg5M5ydE/UWq6z59ivNI/AAAAAAAACO0/TcpRp0Sl6Tg/s1600/Parallel+Analysis+Results+-+Panel+A.png" alt="" height="240" width="400">
  <figcaption> Panel A shows results helpful in determining number of components to retain in the principal components analysis of training data. It compares eigenvalues generated from the training data and eigenvalues from randomly generated datasets for the same sample size and number of variables using parallel analysis. Please note that for scaling purposes, the graph shows data for the first 60 components only (and not all 561 components) and it also does not plot eigenvalues for the first two components from the training data (283.39 and 36.56). According to the results, the first 42 components from the training data have higher eigenvalues than eigenvalues from randomly generated datasets. Eigenvalues of components 43 through 561 explain less than what can be done by chance. Hence, only 42 components are retained.</figcaption>
</figure> 

<figure> <img src="http://1.bp.blogspot.com/-vb28L0_ZIYs/UWq7CWTmHUI/AAAAAAAACO8/-mFUBhNl8Ow/s1600/PanelB-Heatmap.png" alt="">
  <figcaption> Panel B is a heat map of the confusion matrix showing the predictive ability of the support vector model developed on the testing data. The overlap between predicted and actual activity values are shown in the heat map. The purple region shows higher degrees of overlap (accurate classification) and the aqua blue colored regions show regions of low to no misclassification. Different shades of aqua blue denote the overlap between the predicted activity of standing with actual activities of laying and sitting. The kappa measure of this confusion matrix was .89, suggesting that the prediction was almost perfect.</figcaption>
</figure>
