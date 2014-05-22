---
layout: post
title: "Medicare Provider Charge Data - How Are Things in Spokane?"
description: "Medicare charge data"
tags: [barchart, densityplot, ggplot2, histogram, R, scatterplot, Shiny, healthcare]
comments: true
share: true
---
This project came up in the past couple of days, when I came across headlines about wide variations in prices charged by hospitals for the same procedures across the country, and in some instances, within the same city. (For national coverage, see [here](http://www.healthdatamanagement.com/news/medicare-hospital-price-transparency-claims-data-released-46120-1.html), [here](http://blogs.marketwatch.com/encore/2013/05/08/medicare-spills-beans-on-hospital-billing/), and [here](http://www.healthleadersmedia.com/content/HEP-292001/CMS-Releases-Hospital-Pricing-Data). For local coverage on this issue, see [here](http://www.khq.com/story/22194016/some-hospital-bills-vastly-higher-for-similar-care), [here](http://www.krem.com/news/health/206663331.html), and [here](http://www.spokesman.com/stories/2013/may/10/hospitals-need-surgery-on-pricing/). This interest nation-wide came about because the Obama administration released this data recently (as of this post, the [source page on the Centers for Medicare and Medicaid Services](http://www.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/Medicare-Provider-Charge-Data/index.html) was last updated on 7 May, 2013). My understanding is that this is the first time something like this has been done. [The source page provides public access to the data as well as this description of the data](http://www.cms.gov/Research-Statistics-Data-and-Systems/Statistics-Trends-and-Reports/Medicare-Provider-Charge-Data/index.html).

Disclosure: I am not a health care professional, but just some one interested in playing with data and ways to represent them. I am not going to interpret findings here, but will make a remark or two about how to interpret them from the few graphs shown below.

The data provided here include hospital-specific charges for the more than 3,000 U.S. hospitals that receive Medicare Inpatient Prospective Payment System (IPPS) payments for the top 100 most frequently billed discharges, paid under Medicare based on a rate per discharge using the Medicare Severity Diagnosis Related Group (MS-DRG) for Fiscal Year (FY) 2011. These DRGs represent almost 7 million discharges or 60 percent of total Medicare IPPS discharges.
Hospitals determine what they will charge for items and services provided to patients and these charges are the amount the hospital bills for an item or service. The Total Payment amount includes the MS-DRG amount, bill total per diem, beneficiary primary payer claim payment amount, beneficiary Part A coinsurance amount, beneficiary deductible amount, beneficiary blood deducible amount and DRG outlier amount.
For these DRGs, average charges and average Medicare payments are calculated at the individual hospital level. Users will be able to make comparisons between the amount charged by individual hospitals within local markets, and nationwide, for services that might be furnished in connection with a particular inpatient stay.

What I did was to download the data and focus specifically on Spokane. Here are some graphs.

1.What is the range and distribution of cost of procedures different providers undertake? Hint: The purple bars on the left indicate that Valley Hospital handles many procedures that are generally lower cost than the few super expensive ones that Providence Sacred Heart or Deaconess (on the right) handle.

<img src="http://1.bp.blogspot.com/-GHu4OdtCdhM/UYwpTcvYoKI/AAAAAAAACR4/Tw667DcPol4/s1600/Histogram+of+Covered+Charges.png" alt="">


2.A better look at the distribution of cost or procedures at different providers can be taken from the graph below, which is also known as a kernel density graph. (Hint: Valley Hospital handles mostly low cost procedures and does not appear to have a presence in the  super expensive section.)

<img src="http://2.bp.blogspot.com/-efALnuqC92M/UYwo9diabuI/AAAAAAAACRI/mXtS_mjO0fI/s1600/KernelDensityPlot.png" alt="">


3.What is the pattern of charges imposed by different providers for different procedures? Here, we look at the basic pattern, without focusing on the individual procedures. The procedures along the vertical axis have been arranged by increasing average costs. Hint: Which colored dots appear predominantly on the left and which colored dots appear predominantly on the right? The former generally charge lesser than the latter.

<img src="http://4.bp.blogspot.com/-k4a1P2UpQas/UYwo8p4VdXI/AAAAAAAACRA/I8HK9Tny-iM/s1600/Allprocedureschargebyprovider.png" alt="">


Lot of clutter above... so the following three graphs explore three different sections - 1. Average costs of up to 25,000 (2) average costs between 25k and 50k, and (3) average costs above 50k. Please note that in each graph, there may be truncation in the dots if multiple providers charged costs in different categories (of the three mentioned above.)


<img src="http://4.bp.blogspot.com/-7VTJmaoloFM/UYwo9jewxpI/AAAAAAAACRM/ciErGNWtxww/s1600/lessthan25k.png" alt="">

<img src="http://1.bp.blogspot.com/-1TlXWIgdlrw/UYwo8mLYoRI/AAAAAAAACRQ/QAxQXqXCTQs/s1600/25to50kcovered.png" alt="">

<img src="http://2.bp.blogspot.com/-2xO35dyDguI/UYwo8h-ttAI/AAAAAAAACRE/Oiwguqkf-n0/s1600/50kplus.png" alt="">

4.Finally, what do different providers charge for different procedures? For this, I'll take you to a different site (hosted by [RStudio](www.rstudio.com) to interact with this data. (Please click on the picture below to visit that site.) [**Update: The application is embedded below**] The site will ask for the procedure and will provide charts of the costs (charges) at different providers, average total payment for that procedure to that provider, and lastly, total discharges by that provider for that procedure. Enjoy.

<iframe width="1200" height="950" src="//glimmer.rstudio.com/vivekpatil/interactivemed" frameborder="0"> </iframe>
