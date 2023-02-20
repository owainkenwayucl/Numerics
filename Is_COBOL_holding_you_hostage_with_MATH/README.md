# Is COBOL holding you hostage with Math?

This directory holds the code snippets from this excellent medium post by Marianne Bellotti:

[Is COBOL holding you hostage with Math?](https://medium.com/the-technical-archaeologist/is-cobol-holding-you-hostage-with-math-5498c0eb428b)

I would strongly recommend her book [Kill it with Fire](https://www.amazon.co.uk/Kill-Fire-Manage-Computer-Systems-ebook/dp/B08CTFY4JP/) - it's a really informative and entertaining read for anyone who has to maintain or moderinise large systems.

## Python version:

Run with:

```
python3.11 Mullers_Recurrence.py
```

This gives:

```
i   | floating pt        | fixed pt
--- | ------------------ | ---------------------------
  0 |                  4 |                           4
  1 |               4.25 |                        4.25
  2 |  4.470588235294116 | 4.4705882352941176470588235
  3 | 4.6447368421052175 | 4.6447368421052631578947362
  4 |  4.770538243625083 | 4.7705382436260623229461618
  5 |  4.855700712568563 | 4.8557007125890736342039857
  6 |   4.91084749866063 | 4.9108474990827932004342938
  7 |  4.945537395530508 | 4.9455374041239167246519529
  8 |  4.966962408040999 | 4.9669625817627005962571288
  9 |  4.980042204293014 | 4.9800457013556311118526582
 10 |  4.987909232795786 | 4.9879794484783912679439415
 11 |  4.991362641314552 | 4.9927702880620482067468253
 12 |  4.967455095552268 | 4.9956558915062356478184985
 13 |   4.42969049830883 | 4.9973912683733697540253088
 14 | -7.817236578459315 | 4.9984339437852482376781601
 15 | 168.93916767106458 | 4.9990600687785413938424188
 16 | 102.03996315205927 | 4.9994358732880376990501184
 17 |  100.0999475162497 | 4.9996602467866575821700634
 18 | 100.00499204097244 | 4.9997713526716167817979714
 19 |  100.0002495792373 | 4.9993671517118171375788238
```

## COBOL version:

This is an exact copy of the COBOL snippet from the Marianne Bellotti's Medium post.  You can compile it with GnuCOBOL with:

```
cobc -x -free muller.cbl
```

and then run the resulting binary:

```
./muller
01|004.470588235294118
02|004.644736842105272
03|004.770538243626253
04|004.855700712593068
05|004.910847499165008
06|004.945537405797454
07|004.966962615594416
08|004.980046382396752
09|004.987993122733704
10|004.993044417666328
11|005.001145954388894
12|005.107165361144283
13|007.147823677868234
14|035.069409660592417
15|090.744337001124836
16|099.490073035205414
17|099.974374743980031
18|099.998718461941870
19|099.999935923870551
20|099.999996796239314
```

## Common Lisp version:

This version demonstrates the advantage of storing numbers internally as fractions as Common Lisp does i.e. if you do:

```lisp
(/ 3 4)
```

you get `(3/4)`.

This implementation does all the maths as fractions and then converts to floats (by multiplying by *1.0*) and compares it to the bare floating point version. As can be seen, this version doesn't blow up even for very large *n*.

To run it, start your Common Lisp interpreter and:

```lisp
(load "Mullers-Recurrence.cl")
 i    | Floating Point       | Fraction (->fp out) 
---------------------------------------------------
 1    |                  4.0 |                  4.0
 2    |                 4.25 |                 4.25
 3    |    4.470588235294116 |    4.470588235294118
 4    |   4.6447368421052175 |    4.644736842105263
 5    |    4.770538243625083 |    4.770538243626063
 6    |    4.855700712568563 |    4.855700712589074
 7    |     4.91084749866063 |    4.910847499082793
 8    |    4.945537395530508 |    4.945537404123916
 9    |    4.966962408040999 |    4.966962581762701
 10   |    4.980042204293014 |    4.980045701355631
 11   |    4.987909232795786 |    4.987979448478392
 12   |    4.991362641314552 |    4.992770288062068
 13   |    4.967455095552268 |    4.995655891506634
 14   |     4.42969049830883 |    4.997391268381344
 15   |   -7.817236578459315 |    4.998433943944817
 16   |   168.93916767106458 |    4.999060071970894
 17   |   102.03996315205927 |    4.999435937146839
 18   |    100.0999475162497 |    4.999661524103767
 19   |   100.00499204097244 |   4.9997969007134175
 20   |    100.0002495792373 |    4.999878135477931
T
```

This runs it initially for *n = 20* but you can re-run it for arbitrary *n* by running:

```lisp
(Compare n)
```




