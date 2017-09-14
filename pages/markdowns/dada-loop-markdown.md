# What is a DADA loop?

DADA stands for Data, Analysis, Decision, Action. Its a varient of the OODA loop used by the airforce to help pilots make quick descions when facing a changing enviroment. DADA was adopeted by the CIA as their version to help train field agents on how to make quick decsions as well. People who can cycle through this loop more quickly can react with greater efficacy and speed.

# Why is this useful for Product Managers?

Product managers are often the people notified of crisis and are expected to make decisions around, priority, communicating with those affected, and trade-offs. In crisis mode to take a step back and quickly iterate through a DADA loop can help product managers keep their calm and make data driven solutions even in the face of critical issues.

# Random Score Crisis

My team and I route leads to sales. We have millions of potential customers in our database of varying quality. In an effort to ensure that lead fed reps work the highest value leads we score them using models. Recently, wewanted to start routing some randomly scored leads for a few reason. Firstly, to establish a baseline of the value the scoring generated over just randomly assinging leads. Secondly, to identify leads that traditionally are not considered valuable (based on available research) but my offer value to sales.

At the same time we had also identified and were in the process of resolving another issue that had caused our score qualified leads to no longer send as much volume. A day after turning on the new random test group there was a huge spike in leads assinged via this method. This "data" is what started our DADA loop.

## Loop One
* Data: 
 - Unusually high spike in assignments. 
* Analysis:
 - This could be due to a catch affect in leads that weren't assigned before but are now able to be assigned
* Decision:
 - We should look that data to see if this spike is close in size to the diff in what we sent before and after the issue
* Action:
 - I looked the spike, and the time before and after the issue

## Loop Two
* Data:
 - The spike is multiples larger than assignment diff from the issue.
* Analysis:
 - Its likely something else that caused this spike
* Descion:
 - Identify the next likely culprit
* Action:
- Look at the test we launched the same day.

## Loop Three
* Data:
 - The random group is many multiples in size larger than the other two groups and the other two groups also aren't similar sizes either.
 Analysis:
 - There is soemthing wrong with how the test was set up.
 Decsion:
 - Identify why we sent so many more random than the other two groups.
 Action:
 - Look at test group score compisitions.

## Loop Four
* Data:
 - The percentiles distribtuions for each score wasn't uniform. (more detail below)
* Analysis:
 - The data we trained our models on differes from the data we use during production. The legacy model's distribution was also far from true.
* Decsion:
 - Turn off random test group. Recalculate distribtuions, and change assingment thresholds to match reality.
* Action:
 - Turn off test group. Created issues and prioritized their resolution.

Detail as promised. To be able to compare between models we decided to use percentiles instead of raw scores since they raw scores weren't always comparable, could be probablities, expected value, the legacy model was regression. So we scored everything and then bucketed scores into one thousands buckets to provide score granulairty down to 1/10th of a percent.

We then had thresholds to not assign anything below a percentile bucket. When you have a uniform distribution (random group) and two highly right-skewed diststributions. The unifor distribtuion will have many multiple more accounts above your threshold than in the other two groups. This discovery led to both the root cause and the resolution, and what could we expect if it wasn't fixed, many many more random assignments.

By this point news is trickling up to us that many reps were complaning of their books being filled with accounts of "questionable" value. When we expected random to only compose a small portion of books we expected to hear this but not that their books had recieved many thouands of them.

The impact  of this was likely a day or two confusion and distraction for a large p of our sales team globally. Identifying a resolution quickly helped mitigate this impact. We also decided to "manuallY" un-assing many of these randomly assigned accounts.

# The Value of DADA loops

Here are some of the major benefits I see from using DADA loops.

##Reduces Stress and Anxiety During Crisis
Instead of panic, just think "what data do I have", "what result can that data give me", "what should I do based on the data?", "What action can I take? What action can I take to get more data?"

## Data Driven Resolutions

## Easy to define status