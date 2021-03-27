---
title: "lm_GD_optimization"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{lm_GD_optimization}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---




```r
library(cpp)
lm_opt_GD = lm_GD_optimizer(Dep.var ~ . , mydataset, tolerance=1e-3, maxit=1000, stepsize=1e-5, verbose=T)
#> [1] "error at iteration 1 : 0.109346550560952"
#> [1] "error at iteration 2 : 0.107153209005297"
#> [1] "error at iteration 3 : 0.105003881469215"
#> [1] "error at iteration 4 : 0.102897684353988"
#> [1] "error at iteration 5 : 0.100833751806608"
#> [1] "error at iteration 6 : 0.0988112353632415"
#> [1] "error at iteration 7 : 0.0968293035998654"
#> [1] "error at iteration 8 : 0.0948871417899193"
#> [1] "error at iteration 9 : 0.0929839515688402"
#> [1] "error at iteration 10 : 0.091118950605342"
#> [1] "error at iteration 11 : 0.0892913722792961"
#> [1] "error at iteration 12 : 0.087500465366092"
#> [1] "error at iteration 13 : 0.0857454937273383"
#> [1] "error at iteration 14 : 0.0840257360077793"
#> [1] "error at iteration 15 : 0.0823404853383048"
#> [1] "error at iteration 16 : 0.080689049044929"
#> [1] "error at iteration 17 : 0.0790707483636139"
#> [1] "error at iteration 18 : 0.0774849181608301"
#> [1] "error at iteration 19 : 0.0759309066597289"
#> [1] "error at iteration 20 : 0.0744080751718179"
#> [1] "error at iteration 21 : 0.0729157978340327"
#> [1] "error at iteration 22 : 0.0714534613510873"
#> [1] "error at iteration 23 : 0.0700204647430065"
#> [1] "error at iteration 24 : 0.0686162190977295"
#> [1] "error at iteration 25 : 0.0672401473286861"
#> [1] "error at iteration 26 : 0.0658916839372452"
#> [1] "error at iteration 27 : 0.0645702747799359"
#> [1] "error at iteration 28 : 0.0632753768403467"
#> [1] "error at iteration 29 : 0.0620064580056094"
#> [1] "error at iteration 30 : 0.0607629968473735"
#> [1] "error at iteration 31 : 0.0595444824071829"
#> [1] "error at iteration 32 : 0.0583504139861648"
#> [1] "error at iteration 33 : 0.0571803009389451"
#> [1] "error at iteration 34 : 0.0560336624717039"
#> [1] "error at iteration 35 : 0.0549100274442913"
#> [1] "error at iteration 36 : 0.0538089341763182"
#> [1] "error at iteration 37 : 0.0527299302571427"
#> [1] "error at iteration 38 : 0.051672572359676"
#> [1] "error at iteration 39 : 0.0506364260579293"
#> [1] "error at iteration 40 : 0.0496210656482265"
#> [1] "error at iteration 41 : 0.048626073974011"
#> [1] "error at iteration 42 : 0.0476510422541696"
#> [1] "error at iteration 43 : 0.0466955699148075"
#> [1] "error at iteration 44 : 0.0457592644244076"
#> [1] "error at iteration 45 : 0.0448417411322928"
#> [1] "error at iteration 46 : 0.0439426231103441"
#> [1] "error at iteration 47 : 0.0430615409978907"
#> [1] "error at iteration 48 : 0.0421981328497223"
#> [1] "error at iteration 49 : 0.0413520439871533"
#> [1] "error at iteration 50 : 0.0405229268520779"
#> [1] "error at iteration 51 : 0.0397104408639595"
#> [1] "error at iteration 52 : 0.0389142522796946"
#> [1] "error at iteration 53 : 0.0381340340562883"
#> [1] "error at iteration 54 : 0.0373694657162917"
#> [1] "error at iteration 55 : 0.0366202332159444"
#> [1] "error at iteration 56 : 0.0358860288159608"
#> [1] "error at iteration 57 : 0.0351665509549193"
#> [1] "error at iteration 58 : 0.034461504125189"
#> [1] "error at iteration 59 : 0.0337705987513539"
#> [1] "error at iteration 60 : 0.0330935510710759"
#> [1] "error at iteration 61 : 0.032430083018355"
#> [1] "error at iteration 62 : 0.0317799221091319"
#> [1] "error at iteration 63 : 0.0311428013291897"
#> [1] "error at iteration 64 : 0.0305184590243086"
#> [1] "error at iteration 65 : 0.0299066387926255"
#> [1] "error at iteration 66 : 0.0293070893791598"
#> [1] "error at iteration 67 : 0.0287195645724529"
#> [1] "error at iteration 68 : 0.0281438231032878"
#> [1] "error at iteration 69 : 0.027579628545443"
#> [1] "error at iteration 70 : 0.0270267492184395"
#> [1] "error at iteration 71 : 0.0264849580922406"
#> [1] "error at iteration 72 : 0.0259540326938685"
#> [1] "error at iteration 73 : 0.0254337550158952"
#> [1] "error at iteration 74 : 0.0249239114267708"
#> [1] "error at iteration 75 : 0.0244242925829563"
#> [1] "error at iteration 76 : 0.0239346933428193"
#> [1] "error at iteration 77 : 0.0234549126822579"
#> [1] "error at iteration 78 : 0.0229847536120231"
#> [1] "error at iteration 79 : 0.0225240230966999"
#> [1] "error at iteration 80 : 0.0220725319753163"
#> [1] "error at iteration 81 : 0.0216300948835459"
#> [1] "error at iteration 82 : 0.0211965301774759"
#> [1] "error at iteration 83 : 0.0207716598589034"
#> [1] "error at iteration 84 : 0.0203553095021345"
#> [1] "error at iteration 85 : 0.0199473081822532"
#> [1] "error at iteration 86 : 0.0195474884048306"
#> [1] "error at iteration 87 : 0.0191556860370445"
#> [1] "error at iteration 88 : 0.0187717402401875"
#> [1] "error at iteration 89 : 0.018395493403526"
#> [1] "error at iteration 90 : 0.0180267910794898"
#> [1] "error at iteration 91 : 0.0176654819201616"
#> [1] "error at iteration 92 : 0.0173114176150442"
#> [1] "error at iteration 93 : 0.016964452830079"
#> [1] "error at iteration 94 : 0.0166244451478841"
#> [1] "error at iteration 95 : 0.0162912550091994"
#> [1] "error at iteration 96 : 0.0159647456555021"
#> [1] "error at iteration 97 : 0.0156447830727755"
#> [1] "error at iteration 98 : 0.0153312359364142"
#> [1] "error at iteration 99 : 0.0150239755572237"
#> [1] "error at iteration 100 : 0.0147228758285181"
#> [1] "error at iteration 101 : 0.014427813174267"
#> [1] "error at iteration 102 : 0.0141386664982948"
#> [1] "error at iteration 103 : 0.0138553171344933"
#> [1] "error at iteration 104 : 0.013577648798039"
#> [1] "error at iteration 105 : 0.0133055475375858"
#> [1] "error at iteration 106 : 0.0130389016884189"
#> [1] "error at iteration 107 : 0.0127776018265555"
#> [1] "error at iteration 108 : 0.012521540723756"
#> [1] "error at iteration 109 : 0.0122706133034498"
#> [1] "error at iteration 110 : 0.0120247165975389"
#> [1] "error at iteration 111 : 0.0117837497040725"
#> [1] "error at iteration 112 : 0.0115476137457691"
#> [1] "error at iteration 113 : 0.011316211829377"
#> [1] "error at iteration 114 : 0.0110894490058415"
#> [1] "error at iteration 115 : 0.0108672322312842"
#> [1] "error at iteration 116 : 0.0106494703287527"
#> [1] "error at iteration 117 : 0.010436073950749"
#> [1] "error at iteration 118 : 0.0102269555425059"
#> [1] "error at iteration 119 : 0.0100220293060005"
#> [1] "error at iteration 120 : 0.0098212111646907"
#> [1] "error at iteration 121 : 0.00962441872896314"
#> [1] "error at iteration 122 : 0.00943157126226879"
#> [1] "error at iteration 123 : 0.00924258964794511"
#> [1] "error at iteration 124 : 0.009057396356698"
#> [1] "error at iteration 125 : 0.00887591541474286"
#> [1] "error at iteration 126 : 0.00869807237258158"
#> [1] "error at iteration 127 : 0.00852379427440564"
#> [1] "error at iteration 128 : 0.00835300962811836"
#> [1] "error at iteration 129 : 0.00818564837595659"
#> [1] "error at iteration 130 : 0.00802164186569598"
#> [1] "error at iteration 131 : 0.00786092282244866"
#> [1] "error at iteration 132 : 0.00770342532101331"
#> [1] "error at iteration 133 : 0.00754908475878491"
#> [1] "error at iteration 134 : 0.00739783782921677"
#> [1] "error at iteration 135 : 0.00724962249579875"
#> [1] "error at iteration 136 : 0.00710437796657448"
#> [1] "error at iteration 137 : 0.00696204466916051"
#> [1] "error at iteration 138 : 0.00682256422626804"
#> [1] "error at iteration 139 : 0.00668587943172039"
#> [1] "error at iteration 140 : 0.00655193422695"
#> [1] "error at iteration 141 : 0.00642067367796084"
#> [1] "error at iteration 142 : 0.00629204395276695"
#> [1] "error at iteration 143 : 0.00616599229927051"
#> [1] "error at iteration 144 : 0.00604246702359212"
#> [1] "error at iteration 145 : 0.00592141746883357"
#> [1] "error at iteration 146 : 0.00580279399426598"
#> [1] "error at iteration 147 : 0.00568654795493906"
#> [1] "error at iteration 148 : 0.00557263168169442"
#> [1] "error at iteration 149 : 0.00546099846158743"
#> [1] "error at iteration 150 : 0.0053516025186946"
#> [1] "error at iteration 151 : 0.00524439899531171"
#> [1] "error at iteration 152 : 0.00513934393352677"
#> [1] "error at iteration 153 : 0.00503639425716429"
#> [1] "error at iteration 154 : 0.00493550775408824"
#> [1] "error at iteration 155 : 0.00483664305886933"
#> [1] "error at iteration 156 : 0.00473975963578788"
#> [1] "error at iteration 157 : 0.0046448177621885"
#> [1] "error at iteration 158 : 0.00455177851216426"
#> [1] "error at iteration 159 : 0.00446060374056589"
#> [1] "error at iteration 160 : 0.00437125606734057"
#> [1] "error at iteration 161 : 0.00428369886217261"
#> [1] "error at iteration 162 : 0.00419789622944489"
#> [1] "error at iteration 163 : 0.00411381299349411"
#> [1] "error at iteration 164 : 0.00403141468416646"
#> [1] "error at iteration 165 : 0.00395066752265905"
#> [1] "error at iteration 166 : 0.00387153840764842"
#> [1] "error at iteration 167 : 0.00379399490169874"
#> [1] "error at iteration 168 : 0.00371800521793908"
#> [1] "error at iteration 169 : 0.0036435382070108"
#> [1] "error at iteration 170 : 0.00357056334427686"
#> [1] "error at iteration 171 : 0.00349905071728696"
#> [1] "error at iteration 172 : 0.00342897101349227"
#> [1] "error at iteration 173 : 0.00336029550821237"
#> [1] "error at iteration 174 : 0.00329299605284028"
#> [1] "error at iteration 175 : 0.00322704506328098"
#> [1] "error at iteration 176 : 0.00316241550862983"
#> [1] "error at iteration 177 : 0.0030990809000695"
#> [1] "error at iteration 178 : 0.00303701527999767"
#> [1] "error at iteration 179 : 0.00297619321136633"
#> [1] "error at iteration 180 : 0.00291658976724207"
#> [1] "error at iteration 181 : 0.00285818052056541"
#> [1] "error at iteration 182 : 0.00280094153412946"
#> [1] "error at iteration 183 : 0.0027448493507487"
#> [1] "error at iteration 184 : 0.00268988098362666"
#> [1] "error at iteration 185 : 0.00263601390692436"
#> [1] "error at iteration 186 : 0.00258322604650818"
#> [1] "error at iteration 187 : 0.0025314957708904"
#> [1] "error at iteration 188 : 0.00248080188234834"
#> [1] "error at iteration 189 : 0.00243112360822284"
#> [1] "error at iteration 190 : 0.00238244059239001"
#> [1] "error at iteration 191 : 0.00233473288690611"
#> [1] "error at iteration 192 : 0.00228798094382121"
#> [1] "error at iteration 193 : 0.00224216560715007"
#> [1] "error at iteration 194 : 0.0021972681050153"
#> [1] "error at iteration 195 : 0.00215327004193622"
#> [1] "error at iteration 196 : 0.00211015339128284"
#> [1] "error at iteration 197 : 0.00206790048787475"
#> [1] "error at iteration 198 : 0.00202649402073174"
#> [1] "error at iteration 199 : 0.00198591702596751"
#> [1] "error at iteration 200 : 0.00194615287982636"
#> [1] "error at iteration 201 : 0.00190718529186462"
#> [1] "error at iteration 202 : 0.00186899829826004"
#> [1] "error at iteration 203 : 0.0018315762552632"
#> [1] "error at iteration 204 : 0.00179490383277514"
#> [1] "error at iteration 205 : 0.00175896600805991"
#> [1] "error at iteration 206 : 0.00172374805957354"
#> [1] "error at iteration 207 : 0.00168923556092793"
#> [1] "error at iteration 208 : 0.00165541437496763"
#> [1] "error at iteration 209 : 0.00162227064797094"
#> [1] "error at iteration 210 : 0.00158979080396282"
#> [1] "error at iteration 211 : 0.00155796153914345"
#> [1] "error at iteration 212 : 0.00152676981643385"
#> [1] "error at iteration 213 : 0.0014962028601202"
#> [1] "error at iteration 214 : 0.00146624815061447"
#> [1] "error at iteration 215 : 0.00143689341931896"
#> [1] "error at iteration 216 : 0.00140812664358947"
#> [1] "error at iteration 217 : 0.00137993604180409"
#> [1] "error at iteration 218 : 0.00135231006853065"
#> [1] "error at iteration 219 : 0.00132523740978385"
#> [1] "error at iteration 220 : 0.00129870697839163"
#> [1] "error at iteration 221 : 0.00127270790943967"
#> [1] "error at iteration 222 : 0.00124722955581813"
#> [1] "error at iteration 223 : 0.00122226148384907"
#> [1] "error at iteration 224 : 0.00119779346901172"
#> [1] "error at iteration 225 : 0.00117381549174489"
#> [1] "error at iteration 226 : 0.00115031773333474"
#> [1] "error at iteration 227 : 0.00112729057188954"
#> [1] "error at iteration 228 : 0.00110472457839261"
#> [1] "error at iteration 229 : 0.00108261051283254"
#> [1] "error at iteration 230 : 0.00106093932041595"
#> [1] "error at iteration 231 : 0.00103970212784787"
#> [1] "error at iteration 232 : 0.00101889023969903"
#> [1] "error at iteration 233 : 0.000998495134831856"
lm_opt_GD
#> $beta_hat
#>             Dep.var
#> Intercept 4.9681878
#> .Reg1     0.5271015
#> Reg.2     0.2064352
#> Reg3.     0.1019163
#> 
#> $Y
#> # A tibble: 1,000 x 1
#>    Dep.var
#>      <dbl>
#>  1    5.56
#>  2    5.51
#>  3    5.87
#>  4    5.09
#>  5    3.57
#>  6    5.26
#>  7    7.22
#>  8    4.80
#>  9    6.71
#> 10    6.60
#> # ... with 990 more rows
#> 
#> $X
#> # A tibble: 1,000 x 4
#>    Intercept  .Reg1   Reg.2   Reg3.
#>        <dbl>  <dbl>   <dbl>   <dbl>
#>  1         1 -0.626  1.13   -0.886 
#>  2         1  0.184  1.11   -1.92  
#>  3         1 -0.836 -0.871   1.62  
#>  4         1  1.60   0.211   0.519 
#>  5         1  0.330  0.0694 -0.0558
#>  6         1 -0.820 -1.66    0.696 
#>  7         1  0.487  0.811   0.0535
#>  8         1  0.738 -1.91   -1.31  
#>  9         1  0.576 -1.25   -2.12  
#> 10         1 -0.305  0.998  -0.208 
#> # ... with 990 more rows
#> 
#> $model_formula
#> Dep.var ~ .
#> 
#> $method
#> [1] "Gradient Descend"
```
