****Yougov polimetrix

tab	aw1_q5
tab	aw1_q6
tab	aw1_q14a
tab	aw1_q14b
tab	aw1_q14c
tab	aw1_q14d
tab	aw1_q14e
tab	aw1_q14f
tab	aw1_q14g
tab	aw1_q14h
tab	aw1_q14i
tab	aw1_q14j
tab	aw1_q14k
tab	aw1_q14l
tab	aw1_q14m
tab	aw1_q14n
tab	aw1_q14o
tab	aw1_q15
tab	aw1_q17
tab	aw1_q18
tab	aw1_q20e
tab	aw1_q24a
tab	aw1_q29
tab	aw1_q43
tab	aw1_q44
tab	aw1_q45
tab	aw1_q49
tab	aw1_q50
tab	aw1_q56a
tab	aw1_q56b
tab	aw1_q61
tab	aw1_q62
tab	aw1_q62a


gen	flag_aw1_q5	=	1	if	aw1_q5	==	98
gen	flag_aw1_q6	=	1	if	aw1_q6	==	6
gen	flag_aw1_q14a	=	1	if	aw1_q14a	==	8
gen	flag_aw1_q14b	=	1	if	aw1_q14b	==	8
gen	flag_aw1_q14c	=	1	if	aw1_q14c	==	8
gen	flag_aw1_q14d	=	1	if	aw1_q14d	==	8
gen	flag_aw1_q14e	=	1	if	aw1_q14e	==	8
gen	flag_aw1_q14f	=	1	if	aw1_q14f	==	8
gen	flag_aw1_q14g	=	1	if	aw1_q14g	==	8
gen	flag_aw1_q14h	=	1	if	aw1_q14h	==	8
gen	flag_aw1_q14i	=	1	if	aw1_q14i	==	8
gen	flag_aw1_q14j	=	1	if	aw1_q14j	==	8
gen	flag_aw1_q14k	=	1	if	aw1_q14k	==	8
gen	flag_aw1_q14l	=	1	if	aw1_q14l	==	8
gen	flag_aw1_q14m	=	1	if	aw1_q14m	==	8
gen	flag_aw1_q14n	=	1	if	aw1_q14n	==	8
gen	flag_aw1_q14o	=	1	if	aw1_q14o	==	8
gen	flag_aw1_q17	=	1	if	aw1_q17	==	98
gen	flag_aw1_q18	=	1	if	aw1_q18	==	98
gen	flag_aw1_q20e	=	1	if	aw1_q20e	==	98
gen	flag_aw1_q24a	=	1	if	aw1_q24a	==	98
gen	flag_aw1_q29	=	1	if	aw1_q29	==	98
gen	flag_aw1_q43	=	1	if	aw1_q43	==	98
gen	flag_aw1_q44	=	1	if	aw1_q44	==	98
gen	flag_aw1_q45	=	1	if	aw1_q45	==	98
gen	flag_aw1_q49	=	1	if	aw1_q49	==	98
gen	flag_aw1_q50	=	1	if	aw1_q50	==	98
gen	flag_aw1_q56_merged	=	1	if	aw1_q56_merged	==	8
gen	flag_aw1_q61	=	1	if	aw1_q61	==	8

recode flag_aw1_q5	flag_aw1_q6	flag_aw1_q14a	flag_aw1_q14b	flag_aw1_q14c	flag_aw1_q14d	flag_aw1_q14e	flag_aw1_q14f	flag_aw1_q14g	flag_aw1_q14h	flag_aw1_q14i	flag_aw1_q14j	flag_aw1_q14k	flag_aw1_q14l	flag_aw1_q14m	flag_aw1_q14n	flag_aw1_q14o	flag_aw1_q17	flag_aw1_q18	flag_aw1_q20e	flag_aw1_q24a	flag_aw1_q29	flag_aw1_q43	flag_aw1_q44	flag_aw1_q45	flag_aw1_q49	flag_aw1_q50	flag_aw1_q56_merged	flag_aw1_q61 (.=0)

gen test1=flag_aw1_q5+	flag_aw1_q6+	flag_aw1_q14a+	flag_aw1_q14b+	flag_aw1_q14c+	flag_aw1_q14d+	flag_aw1_q14e+	flag_aw1_q14f+	flag_aw1_q14g+	flag_aw1_q14h+	flag_aw1_q14i+	flag_aw1_q14j+	flag_aw1_q14k+	flag_aw1_q14l+	flag_aw1_q14m+	flag_aw1_q14n+	flag_aw1_q14o+	flag_aw1_q17+	flag_aw1_q18+	flag_aw1_q20e+	flag_aw1_q24a+	flag_aw1_q29+	flag_aw1_q43+	flag_aw1_q44+	flag_aw1_q45+	flag_aw1_q49+ 	flag_aw1_q50+	flag_aw1_q56_merged+	flag_aw1_q61

replace test1=. if aw1_q59==.

***Analysis:
***The variable holds, but the effects are less strong in terms of reducing the std errors; it tends to give similar results with the weights
***provided by the company;
***There is a lower incidence of DKs in the sample; this may be because DK was not as often offered as an option

use "C:\Users\Deuta\Desktop\Turnout BC QC yougovpolymetrix_DK.dta", clear
logit voted age age_sq edu age_edu
logit voted age age_sq edu age_edu [iw=1+ test1]
logit voted age age_sq edu age_edu [iw=1+ test1*test1]
logit voted_jan06  age age_sq edu age_edu [iw=1+ test1*test1]
logit voted_jan06  age age_sq edu age_edu [iw=1+ test1]
logit voted_jan06  age age_sq edu age_edu
tab test1
tab test2
logit voted_jan06  age age_sq edu age_edu
logit voted_jan06  age age_sq edu age_edu [iw=test2]
logit voted_jan06  age age_sq edu age_edu [iw=1+test2]
logit voted_jan06  age age_sq edu age_edu
logit voted_jan06  age age_sq edu age_edu if bc==1
logit voted_jan06  age age_sq edu age_edu if bc==1 [iw=test2]
logit voted_jan06  age age_sq edu age_edu if bc==1 [iw=1+test2]
logit voted_jan06  age age_sq edu age_edu if bc==1
logit voted_jan06  age age_sq edu age_edu if bc==0
logit voted_jan06  age age_sq edu age_edu if bc==0 [iw=1+test2]
logit voted_jan06  age age_sq edu age_edu if bc==0 [iw= aw1_weights]
logit voted_jan06  age age_sq edu age_edu if bc==0 [iw=1+test2]
tab voted_jan06
tab voted_jan06 [iw= aw1_weights]
tab voted_jan06 [iw= test2]
tab voted_jan06 [iw= 1+test2]
tab voted_jan06
tab voted_jan06 [iw= test1]
tab voted_jan06 [iw= 1+test1]
tab voted_jan06 [iw= test2*test2]
tab voted_jan06 [iw= test2*4]
tab voted_jan06 [iw= test2*5]
logit voted_jan06  age age_sq edu age_edu if bc==0 [iw=1+test2^5]
logit voted_jan06  age age_sq edu age_edu if bc==0 [iw= aw1_weights]
logit voted_jan06  age age_sq edu age_edu if bc==1 [iw= aw1_weights]
logit voted_jan06  age age_sq edu age_edu if bc==1 [iw=1+test2^5]
logit voted_jan06  age age_sq edu age_edu if bc==1 [iw=1+test2]


***Works with the DK as weights
probit voted_jan06  age age_sq edu age_edu
probit voted_jan06  age age_sq edu age_edu [iw=(1+test1)/0.7864]
probit voted_jan06  age age_sq edu age_edu [iw=aw1_weights]
probit voted_jan06  age age_sq edu age_edu [iw=aw2_weights]
***DK variable significnatly correlated with interest


***Some more analyses with reported variables rather than fixed
***For some (e.g. interest in politics, vague, test4 performs better; for others care etc. test4 performs just like the aw1_weights)
gen test4=(1+test1)/1.088
sum test4
logit voted_jan06  age age_sq edu age_edu
logit voted_jan06  age age_sq edu age_edu [iw=test4 ]
logit voted_jan06  age age_sq edu age_edu  if bc==1 [iw=test4 ]
logit voted_jan06  age age_sq edu age_edu  if bc==1
logit voted_jan06  age age_sq edu age_edu  if bc==0
logit voted_jan06  age age_sq edu age_edu  if bc==0 [iw=test4]
sum  test4 if bc==1
sum  test4 if bc==0
logit voted_jan06  age age_sq edu age_edu
logit voted_jan06  age age_sq edu age_edu bc
logit voted_jan06  age age_sq edu age_edu bc [iw=test4]
probit voted_jan06  age age_sq edu age_edu bc [iw=test4]
probit voted_jan06  age age_sq edu age_edu bc
probit voted_jan06  age age_sq edu age_edu
probit voted_jan06  age age_sq edu age_edu [iw=test4]
probit voted_jan06  age age_sq edu age_edu [iw= aw2_weights]
probit voted_jan06  age age_sq edu age_edu [iw= aw1_weights]
probit voted_jan06  age age_sq edu age_edu [iw= test4]
logit voted_jan06  age age_sq edu age_edu [iw= test4]
logit voted_jan06  age age_sq edu age_edu [iw= aw1_weights ]
logit voted_jan06  age age_sq edu  [iw= aw1_weights ]
logit voted_jan06  age age_sq edu  [iw= test4 ]
logit voted_jan06  age age_sq edu aw1_q58 [iw= test4 ]
logit voted_jan06  age age_sq edu aw1_q58 [iw= aw1_weights ]
corr age_edu test4
corr age age_sq aw1_q58 age_edu test4
logit voted_jan06  age age_sq edu
logit voted_jan06  age age_sq edu [iw=test4]
logit voted_jan06  age age_sq edu [iw=aw1_weights ]
probit voted_jan06  age age_sq edu
probit voted_jan06  age age_sq edu [iw=test4]
probit voted_jan06  age age_sq edu [iw=aw1_weights ]
probit voted_jan06  age age_sq edu age_edu
probit voted_jan06  age age_sq edu age_edu [iw=test4]
probit voted_jan06  age age_sq edu age_edu [iw=aw1_weights ]
probit voted_jan06 aw2_q1a age age_sq edu age_edu [iw=aw1_weights ] if aw2_q1a<11
probit voted_jan06 aw2_q1a age age_sq edu age_edu [iw=test4 ] if aw2_q1a<11
corr  aw1_q7 test4
tab  aw1_q7
probit voted_jan06 aw2_q7 age age_sq edu age_edu [iw=test4 ] if aw2_q1a<11
probit voted_jan06 aw2_q7 age age_sq edu age_edu [iw=aw1_weights  ] if aw2_q1a<11
tab aw1_q36
probit voted_jan06 aw1_q36 age age_sq edu age_edu [iw=aw1_weights  ] if aw1_q36<8
probit voted_jan06 aw1_q36 age age_sq edu age_edu [iw=test4  ] if aw1_q36<8
probit voted_jan06 aw1_q36 age age_sq edu age_edu  if aw1_q36<8
probit voted_jan06 aw2_q7 age age_sq edu age_edu [iw=aw1_weights  ] if aw2_q1a<11
probit voted_jan06 aw1_q2 age age_sq edu age_edu [iw=aw1_weights  ] if aw1_q2<11
probit voted_jan06 aw1_q2 age age_sq edu age_edu [iw=test4  ] if aw1_q2<11
probit voted_jan06 aw1_q1 age age_sq edu age_edu [iw=test4  ] if aw1_q1<11
probit voted_jan06 aw1_q1 age age_sq edu age_edu [iw=aw1_weights  ] if aw1_q1<11
corr  aw1_q1 aw1_q2 aw1_q3 aw1_q3x  test4
corr  aw1_q1 aw1_q2 aw1_q3 aw1_q3x  test4 if  aw1_q1<11
corr  aw1_q1 aw1_q2 aw1_q3 aw1_q3x  test4 if  aw1_q2<11
corr  aw1_q1 aw1_q2 aw1_q3 aw1_q3x  test4 if  aw1_q3<11
corr  aw1_q1 aw1_q2 aw1_q3 aw1_q3x  test4 if  aw1_q3x<11
pwcorr  aw1_q1 aw1_q2 aw1_q3 aw1_q3x  test4, sig
tab  aw1_q1
corr  aw2_q1a aw2_q1b aw2_q1c aw2_q1d  test4 if   aw2_q1a<11
corr  aw2_q1a aw2_q1b aw2_q1c aw2_q1d  test4 if   aw2_q1b<11
corr  aw2_q1a aw2_q1b aw2_q1c aw2_q1d  test4 if   aw2_q1c<11
corr  aw2_q1a aw2_q1b aw2_q1c aw2_q1d  test4 if   aw2_q1d<11
probit voted_jan06 aw2_q1a  age age_sq edu age_edu [iw=aw1_weights  ] if aw2_q1a <11
probit voted_jan06 aw2_q1a  age age_sq edu age_edu [iw=test4  ] if aw2_q1a <11
probit voted_jan06 aw2_q1b  age age_sq edu age_edu [iw=test4  ] if aw2_q1b <11
probit voted_jan06 aw2_q1b  age age_sq edu age_edu [iw=aw1_weights  ] if aw2_q1b <11
probit voted_jan06 aw2_q1b  age age_sq edu age_edu [iw=aw2_weights  ] if aw2_q1b <11
probit voted_jan06 aw2_q1a  age age_sq edu age_edu [iw=aw2_weights  ] if aw2_q1a <11
probit voted_jan06 aw2_q1a  age age_sq edu age_edu [iw=test4  ] if aw2_q1a <11
probit voted_jan06 aw2_q1a  age age_sq edu age_edu  if aw2_q1a <11
probit voted_jan06 aw2_q1a  age age_sq edu age_edu [iw=test4  ] if aw2_q1a <11
probit voted_jan06  aw1_q1 age age_sq edu age_edu [iw=test4  ]
probit voted_jan06  aw1_q1 age age_sq edu age_edu
probit voted_jan06  aw1_q1 age age_sq edu age_edu [iw=aw1_weights ]
probit voted_jan06  aw1_q2 age age_sq edu age_edu [iw=aw1_weights ]
probit voted_jan06  aw1_q2 age age_sq edu age_edu [iw=test4 ]
tab  aw1_q21
tab  aw1_q21, nol
probit voted_jan06   aw1_q21 age age_sq edu age_edu [iw=test4 ] if  aw1_q21<7
probit voted_jan06   aw1_q21 age age_sq edu age_edu [iw=aw1_weights  ] if  aw1_q21<7
probit voted_jan06   aw1_q21 age age_sq edu age_edu
probit voted_jan06    aw1_q22 age age_sq edu age_edu if  aw1_q22<7
probit voted_jan06    aw1_q22 age age_sq edu age_edu if  aw1_q22<7 [iw=test4]
probit voted_jan06    aw1_q22 age age_sq edu age_edu if  aw1_q22<7 [iw=aw1_w]

****New analyses with reported attitudes
use "C:\Users\Deuta\Desktop\Survey missing data project\Turnout BC QC yougovpolymetrix_DK.dta", clear
tab  aw1_q21
tab  aw1_q21, nol
corr test4  aw1_q21 if  aw1_q21<8
corr test4   aw2_q14 if   aw2_q14<8
corr test4   aw2_q15 if   aw2_q15<8
tab  aw2_q14
tab  aw2_q14, nol
corr test4   aw2_q15 if   aw2_q15!=9
tab  aw2_q15, nol
probit voted aw2_q15 if   aw2_q15!=9 [iw=test4 ]
probit voted aw2_q15 if   aw2_q15!=9 [iw=aw1_weights ]
probit voted aw2_q15 if   aw2_q15!=9 [iw=aw2_weights ]
probit voted aw2_q15 if   aw2_q15!=9 & test4!=. [iw=aw2_weights ]
probit voted aw2_q15 if   aw2_q15!=9 & test4!=. [iw=aw1_weights ]
probit voted aw2_q14 if   aw2_q14!=9 & test4!=. [iw=aw1_weights ]
probit voted aw2_q14 if   aw2_q14!=9 & test4!=. [iw=aw1_weights ]
probit voted aw2_q14 if   aw2_q14!=9 [iw=test4 ]
probit voted aw2_q14 age edu age_sq age_edu if   aw2_q14!=9 [iw=test4 ]
probit voted aw2_q14 age edu age_sq age_edu if   aw2_q14!=9 & test4!=. [iw=aw1_weights ]
probit voted aw2_q14 age edu age_sq age_edu if   aw2_q14!=9 & test4!=. [iw=aw2_weights ]
probit voted aw2_q15 age edu age_sq age_edu if   aw2_q15!=9 [iw=test4 ]
probit voted aw2_q15 age edu age_sq age_edu if   aw2_q15!=9 & test4!=. [iw=aw1_weights ]
probit voted aw2_q15 age edu age_sq age_edu if   aw2_q15!=9 & test4!=. [iw=aw2_weights ]
reg test4 age
reg test4 age age_sq
reg test4 age age_sq if voted!=.
reg test4 age if voted!=.
probit voted  aw2_q1a age edu age_sq age_edu if    aw2_q1a<11 [iw=test4 ]
probit voted  aw2_q1a age edu age_sq age_edu if    aw2_q1a<11 [iw=aw1_weights  ]
probit voted  aw2_q1a age edu age_sq age_edu if    aw2_q1a<11 [iw=aw2_weights  ]
probit voted  aw2_q1a age edu  age_edu if    aw2_q1a<11 [iw=aw2_weights  ]
probit voted  aw2_q1a age edu  age_edu if    aw2_q1a<11 [iw=aw1_weights  ]
probit voted  aw2_q1a age edu age_edu if    aw2_q1a<11 [iw=test4 ]
probit voted  aw2_q1b age edu age_edu if    aw2_q1b<11 [iw=test4 ]
probit voted  aw2_q1b age edu age_edu if    aw2_q1b<11 [iw=aw1_weights  ]
probit voted  aw2_q1b age edu age_edu if    aw2_q1b<11 [iw=aw2_weights  ]
probit voted  aw2_q1c age edu age_edu if    aw2_q1c<11 [iw=aw2_weights  ]
probit voted  aw2_q1c age edu age_edu if    aw2_q1c<11 [iw=aw1_weights  ]
probit voted  aw2_q1c age edu age_edu if    aw2_q1c<11 [iw=test4  ]
corr test4  aw2_q1a aw2_q1b aw2_q1c aw2_q1d if  aw2_q1a<11
corr test4  aw2_q1a aw2_q1b aw2_q1c aw2_q1d if  aw2_q1b<11
corr test4  aw2_q1a aw2_q1b aw2_q1c aw2_q1d if  aw2_q1c<11
corr test4  aw2_q1a aw2_q1b aw2_q1c aw2_q1d if  aw2_q1d<11
corr test4  aw2_q1a aw2_q1b aw2_q1c aw2_q1d if  aw2_q1a<11 & voted!=.
corr test4  aw2_q1a aw2_q1b aw2_q1c aw2_q1d if  aw2_q1b<11 & voted!=.
corr test4  aw2_q1a aw2_q1b aw2_q1c aw2_q1d if  aw2_q1c<11 & voted!=.
corr test4  aw2_q1a aw2_q1b aw2_q1c aw2_q1d if  aw2_q1d<11 & voted!=.
tab  aw2_q28
tab  aw2_q28, nol
probit voted   aw2_q28 age edu age_edu if     aw2_q28<8 [iw=test4  ]
probit voted   aw2_q28 age edu age_edu if     aw2_q28<8 [iw=aw1_weights   ]
probit voted   aw2_q28 age edu age_edu if     aw2_q28<8 [iw=aw2_weights   ]
probit voted   aw2_q29 age edu age_edu if     aw2_q29<8 [iw=aw2_weights   ]
probit voted   aw2_q29 age edu age_edu if     aw2_q29<8 [iw=aw1_weights   ]
probit voted   aw2_q29 age edu age_edu if     aw2_q29<8 [iw=test4   ]
tab  aw2_q25
probit voted   aw2_q25 age edu age_edu if    aw2_q25 <4 [iw=test4   ]
probit voted   aw2_q25 age edu age_edu if    aw2_q25 <4 [iw=aw1_weights    ]
probit voted   aw2_q25 age edu age_edu if    aw2_q25 <4 [iw=aw2_weights    ]
corr test4  aw2_q25 if    aw2_q25 <4 & voted!=.
corr test4  aw2_q28 if    aw2_q28 <8 & voted!=.
corr test4   aw2_q32 if     aw2_q32 <8 & voted!=.
tab  aw2_q32
corr test4   aw2_q32 if     aw2_q32 <7 & voted!=.
tab  aw2_q32, nol
corr test4   aw2_q32 if     aw2_q32 <7
corr test4   aw2_q32 if     aw2_q32 <7 & voted!=.
pwcorr test4   aw2_q32 if     aw2_q32 <7 & voted!=., sig

****basically, test4 is corelated with attitudinal variables

****Nov15
***Unlike in the UK, survey fatigue is not a significant predictor of turnout reports, although is is slightly correlated with them; at least not when
***other IVs are in the equation
***works better as a weight, to improve std errors
use "C:\Users\Deuta\Desktop\Survey missing data project\Turnout BC QC yougovpolymetrix_DK.dta", clear
probit voted  test4
probit voted  test4 age age_sq
probit voted  test4 age age_sq edu
probit voted  test4 age age_sq edu, robust
probit voted   age age_sq edu, robust
probit voted  aw2_q1a  age age_sq edu, robust if  aw2_q1a<11
probit voted  aw2_q1a  age age_sq edu if  aw2_q1a<11, robust
probit voted test4 aw2_q1a  age age_sq edu if  aw2_q1a<11, robust
corr test4  aw2_q1a if  aw2_q1a<11
corr test4  aw2_q1b if  aw2_q1b<11
probit voted test4 aw2_q1b  age age_sq edu if  aw2_q1b<11, robust
probit voted test4 aw2_q1b  age age_sq edu if  aw2_q1b<11
probit voted test4 aw2_q1b  age age_sq edu if  aw2_q1b<11, robust
probit voted aw2_q1b  age age_sq edu if  aw2_q1b<11, robust
probit voted aw2_q1b  age age_sq edu if  aw2_q1b<11
probit voted aw2_q1b  age age_sq edu if  aw2_q1b<11 [iw=test4]
probit voted aw2_q1b  age age_sq edu if  aw2_q1b<11 [iw=aw2_weights ]
probit voted aw2_q1b  age age_sq edu if  aw2_q1b<11 [iw=aw1_weights ]
probit voted aw2_q1b  age age_sq edu if  aw2_q1b<11 [iw=test4]
corr aw2_weights  aw2_q1b  age age_sq edu if  aw2_q1b<11
corr aw2_weights test4 aw2_q1b  age age_sq edu if  aw2_q1b<11
corr aw1_weights test4 aw2_q1b  age age_sq edu if  aw2_q1b<11
corr aw2_weights  aw2_q1b  age age_sq edu if  aw2_q1b<11

***Nov 16 at the office. Must recalculate the weights for QC only due to the survey timing. 
***Also, must see why I loose some cases for the test1 variable, see below. 

use "C:\Users\Delia\Desktop\Survey missing data project\Survey missing data project\team_Montreal_test_dk.dta"
sum  test_wave5 scaled_testw5
use "C:\Users\Delia\Desktop\Survey missing data project\Survey missing data project\Turnout BC QC yougovpolymetrix_DK.dta", clear
sum test1 test4 if bc==0
sum test1 test4 if bc==0 &  voted!=.
tab voted if bc==0
tab voted if bc==0 [iw=1+test1]
gen test_final_qc=(1+test1)*1334/1191
tab voted if bc==0 [iw=test_final_qc ]
sum test1 test_final_qc
sum test1 test_final_qc if voted!=. & voted!=.
sum test1 test_final_qc if bc==0 & voted!=.
tab voted if bc==0
tab voted if test1!=. & bc==0
tab voted if  bc==0


. tab voted if test1!=. & bc==0

      voted |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |        122       11.71       11.71
          1 |        920       88.29      100.00
------------+-----------------------------------
      Total |      1,042      100.00

. tab voted if  bc==0

      voted |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |        162       12.14       12.14
          1 |      1,172       87.86      100.00
------------+-----------------------------------
      Total |      1,334      100.00

. 



