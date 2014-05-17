---
layout: post
title: "Motivating Students"
description: "Charts shown to students"
tags: [R, ggplot2]
comments: true
share: true
---

Figure shown to students in a particular class to show the effect of slacking after the mid-semester grades are received.

<img src="http://4.bp.blogspot.com/-yUzsDf-cRbQ/UWndb8_IXDI/AAAAAAAACNo/Fbn6qrt32as/s1600/Exam1-4panels-Right-Final+Grade.png" alt="">

Background information: A course has multiple components - Exams, projects, quizzes, assignments, etc. The objective of this set of plots was two fold - (a) To show students that their mid-term grade is not the same as the grade on the exam and that it included several other components, and (b) To show students that their mid-term grades could change based on how well/poorly they performed during the rest of the semester. The left column of plots show a histogram (upper) and a dot plot (bottom) of student scores on Exam 1 of the course. The color denotes the grade they received at mid-term. The color in the right column of plots shows the final grades of the same students. Student positions in all four plots were fixed based on their Exam 1 score.  One marked change in transition of colors from the left column to the right shows the brown "B" bleeding into the red/pink "A", suggesting that many students who received an A in the mid-term grade ended up receiving a B at the end of the semester due to their lackluster performance subsequently. The third objective of this figure, in hindsight, is to show how ggplot automatically picks the sequence of levels for its legend. Yes, B+ should appear above B in the legend and other corrections of that sort need to be made manually. To that extent, ggplot isn't the panacea for all problems.
