# Chapter 1 Exercises

## Combinators

Notes:
> A combinator is a lambda term with no free variables. (every term in the body
occurs in the head)

**Combinators** Determine if each of the following are combinators or not.

1. `\x.xxx`

me: yes, `x` is referred to in the head

answer: 𝜆𝑥.𝑥𝑥𝑥 is indeed a combinator, it refers only to the variable x which is introduced as an argument.

1. `\xy.zx`

me: no, `z` is NOT referred to in the head

answer: 𝜆𝑥𝑦.𝑧𝑥 is not a combinator, the variable z was not introduced as an argument and is thus a free variable.

3. `\xyz.xy(zx)`

me: i (incorrectly) tried to reduce it:

```
\x(\y(\z.xy))(zx)
[\x = (zx)]
(\y(\z.(zxy)))
[\y = (zxy)]
\z.zx(xyz)
[\z = (xyz)]
(xyz)x(xyz)
```

answer: 𝜆𝑥𝑦𝑧.𝑥𝑦(𝑧𝑥) is a combinator, all terms are bound. The head is 𝜆𝑥𝑦𝑧. and the body is 𝑥𝑦(𝑧𝑥). None of the arguments in the head have been applied so it’s irreducible. The variables x, y, and z are all bound in the head and are not free. This makes the lambda a combinator - no occurrences of free variables.

4. `\xyz.xy(zxy)`

me: yes, `x`, `y`, and `z` are all mentioned in the head

answer: 𝜆𝑥𝑦𝑧.𝑥𝑦(𝑧𝑥𝑦) is a combinator. The lambda has the head 𝜆𝑥𝑦𝑧. and the body: 𝑥𝑦(𝑧𝑥𝑦). Again, none of the arguments have been applied so it’s irreducible. All that is different is that the bound variable y is referenced twice rather than once. There are still no free variables so this is also a combinator.

5. `\xy.xy(zxy)`

me: no, z is not mentioned in the head, so it's not a combinator

answer: 𝜆𝑥𝑦.𝑥𝑦(𝑧𝑥𝑦) is not a combinator, z is free. Note that z isn’t bound in the head.

## Normal form or diverge?

Notes:
> Not all reducible lambda terms reduce neatly to a beta normal form.

> Divergence here means that the reduction process never terminates or ends.

**Normal form or diverge?** Determine if each of the following can be reduced to a normal form or if they diverge.

1. `\x.xxx`

me: normal form already (nothing to apply)

answer: 𝜆𝑥.𝑥𝑥𝑥 doesn’t diverge, has no further reduction steps. If it had been applied to itself, it would diverge, but by itself does not as it is already in normal form.

2. `(\z.zz)(\y.yy)`

me: i try to apply it

```
(\z.zz)(\y.yy)
[z = (\y.yy)]
(\y.yy)(\y.yy) # at this point, i can see it won't terminate, but just in case...
[y = (\y.yy)]
(\y.yy)(\y.yy) # and on, and on, and on...
```

it diverges (never ends)

answer: (𝜆𝑧.𝑧𝑧)(𝜆𝑦.𝑦𝑦) diverges, it never reaches a point where the reduction is done. This is the omega term we showed you earlier, with different names for the bindings. It’s alpha equivalent to (𝜆𝑥.𝑥𝑥)(𝜆𝑥.𝑥𝑥).

3. `(\x.xxx)z`

me: i try to reduce it

```
(\x.xxx)z
[x = z]
zzz
```

reduces to normal form (does NOT diverge)

answer: (𝜆𝑥.𝑥𝑥𝑥)𝑧 doesn’t diverge, it reduces to 𝑧𝑧𝑧.

## Beta reduce

**Beta reduce** Evaluate (that is, beta reduce) each of the following expressions to normal form. We strongly recommend writing out the steps on paper with a pencil or pen.

1. `(\abc.cba)zz(\wv.w)`

me: i try to reduce it:

```
(\abc.cba)zz(\wv.w)
(\a(\b(\c.cba)zz(\w(\v.w))))
\a(\b(\c.cba)zz(\w(\v.w)))
\a(\b(\c.cba)zz(\w(\v.w)))
[a = (\b(\c.cba)zz(\w(\v.w)))]
(\b(\c.cba)zz(\w(\v.w)))
```

answer:

```
(𝜆𝑎𝑏𝑐.𝑐𝑏𝑎)𝑧𝑧(𝜆𝑤𝑣.𝑤)
(𝜆𝑎.𝜆𝑏.𝜆𝑐.𝑐𝑏𝑎)(𝑧)𝑧(𝜆𝑤.𝜆𝑣.𝑤)
(𝜆𝑏.𝜆𝑐.𝑐𝑏𝑧)(𝑧)(𝜆𝑤.𝜆𝑣.𝑤)
(𝜆𝑐.𝑐𝑧𝑧)(𝜆𝑤.𝜆𝑣.𝑤)
(𝜆𝑤.𝜆𝑣.𝑤)(𝑧)𝑧
(𝜆𝑣.𝑧)(𝑧)
𝑧
```

2. `(\x.\y.xyy)(\a.a)b`


me: i try to reduce it:

```
(\x.\y.xyy)(\a.a)b
[x = (\a.a)]
(\y.(\a.a)yy)b
[y = b]
(\a.a)(b)b
(a = b)
(b)(b)
bb
```

answer:

```
(𝜆𝑥.𝜆𝑦.𝑥𝑦𝑦)(𝜆𝑎.𝑎)𝑏
(𝜆𝑦(𝜆𝑎.𝑎)𝑦𝑦)(𝑏)
(𝜆𝑎.𝑎)(𝑏)𝑏
𝑏𝑏
```

3. `(\y.y)(\x.xx)(\z.zq)`


me: i try to reduce it:
```
(\y.y)(\x.xx)(\z.zq)
[y = (\x.xx)]
(\x.xx)(\z.zq)
[x = (\z.zq)]
(\z.zq)(\z.zq)
[z = (\z.zq)]
(\z.zq)q
[z = q]
qq
```

answer:

```
(𝜆𝑦.𝑦)(𝜆𝑥.𝑥𝑥)(𝜆𝑧.𝑧𝑞)
(𝜆𝑥.𝑥𝑥)(𝜆𝑧.𝑧𝑞)
(𝜆𝑧.𝑧𝑞)(𝜆𝑧.𝑧𝑞)
(𝜆𝑧.𝑧𝑞)(𝑞)
𝑞𝑞
```

4. `(\z.z)(\z.zz)(\z.zy)`
`Hint: alpha equivalence.`

me: i try to reduce it:

```
(\z.z)(\z.zz)(\z.zy)
[z = (\z.zz)]
(\z.zz)(\z.zy)
[z = (\z.zy)]
(\z.zy)(\z.zy)
[z = (\z.zy)]
(\z.zy)y
[z = y]
yy
```

answer:
```
(𝜆𝑧.𝑧)(𝜆𝑧.𝑧𝑧)(𝜆𝑧.𝑧𝑦)
(𝜆𝑧.𝑧𝑧)(𝜆𝑧.𝑧𝑦)
(𝜆𝑧.𝑧𝑦)(𝜆𝑧.𝑧𝑦)
(𝜆𝑧.𝑧𝑦)(𝑦)
𝑦𝑦
```

5. `(\x.\y.xyy)(\y.y)y`

me: i (incorrectly) try to reduce it:

```
(\x.\y.xyy)(\y.y)y
[x = (\y.y)]
(\y.(\y.y)yy)y
[y = y]
(\y.y)yy)
```

answer:
```
(𝜆𝑥.𝜆𝑦.𝑥𝑦𝑦)(𝜆𝑦.𝑦)𝑦
(𝜆𝑦(𝜆𝑦.𝑦)𝑦𝑦)(𝑦)
(𝜆𝑦.𝑦)(𝑦)𝑦
𝑦𝑦
```

6. `(\a.aa)(\b.ba)c`

me: i try to reduce it:

```
(\a.aa)(\b.ba)c
[a = (\b.ba)]
(\b.ba)(\b.ba)c
[b = (\b.ba)]
(\b.ba)(a)c
[b = a]
aac
```

answer:

```
(𝜆𝑎.𝑎𝑎)(𝜆𝑏.𝑏𝑎)𝑐
(𝜆𝑏.𝑏𝑎)(𝜆𝑏.𝑏𝑎)𝑐
(𝜆𝑏.𝑏𝑎)(𝑎)𝑐
𝑎𝑎𝑐
```

7. `(\xyz.xz(yz))(\x.z)(\x.a)`

me: i (incorrectly) try to reduce it:

```
(\xyz.xz(yz))(\x.z)(\x.a)
\x(\y(\z.xz(yz))(\x.z)(\x.a)
[x = (\x.z)]
\y(\z.(\x.z)z(yz)(\x.a)
[y = (\x.a)]
\z.(\x.z)(z)((\x.a)z)
[z = z]
\x.z)((\x.a)z
```

answer:
```
Steps we took
a) (𝜆𝑥𝑦𝑧.𝑥𝑧(𝑦𝑧))(𝜆𝑥.𝑧)(𝜆𝑥.𝑎)
b) (𝜆𝑥.𝜆𝑦.𝜆𝑧.𝑥𝑧(𝑦𝑧))(𝜆𝑥.𝑧)(𝜆𝑥.𝑎)
c) (𝜆𝑦.𝜆𝑧1(𝜆𝑥.𝑧)𝑧1(𝑦𝑧1))(𝜆𝑥.𝑎)
d) (𝜆𝑧1.(𝜆𝑥.𝑧)(𝑧1)((𝜆𝑥.𝑎)𝑧1))
e) (𝜆𝑧1.𝑧((𝜆𝑥.𝑎)(𝑧1)))
f) (𝜆𝑧1.𝑧𝑎) The 𝑧1 notation allows us to distinguish two vari- ables named 𝑧 that came from different places. One is bound by the  rst head; the second is a free variable in the second lambda expression.
How we got there, step by step
a) Our expression we’ll reduce.
b) Add the implied lambdas to introduce each argument.
c) Apply the le most 𝑥 and bind it to (𝜆𝑥.𝑧), rename le most 𝑧 to 𝑧1 for clarity to avoid confusion with the other z. Here- a er, “z” is exclusively the z in (𝜆𝑥.𝑧).
d) Apply 𝑦, it gets bound to (𝜆𝑥.𝑎).
e) Can’t apply z1 to anything, evaluation strategy is normal order so le most outermost is the order of the day. Our le most, outermost lambda has no remaining arguments to be applied so we now examine the terms nested within to see if they are in normal form. (𝜆𝑥.𝑧) gets applied to 𝑧1, tosses the 𝑧1 away and returns 𝑧. 𝑧 is now being applied to ((𝜆𝑥.𝑎)(𝑧1)).
CHAPTER1. ANYTHINGFROMALMOSTNOTHING 22
f) Cannot reduce 𝑧 further, it’s free and we know nothing, so we go inside yet another nesting and reduce ((𝜆𝑥.𝑎)(𝑧1)). 𝜆𝑥.𝑎 gets applied to 𝑧1, but tosses it away and returns the free variable 𝑎. The 𝑎 is now part of the body of that expression. All of our terms are in normal order now.

```
