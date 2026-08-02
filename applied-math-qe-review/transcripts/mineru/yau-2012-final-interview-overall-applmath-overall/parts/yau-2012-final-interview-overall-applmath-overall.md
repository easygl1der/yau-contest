## Applied and Computational Mathematics

## 1. Let

$$
V _ {h} = \{v: v | _ {I _ {j}} \in P ^ {k} (I _ {j}) \quad 1 \leq j \leq N \}
$$

where

$$
I _ {j} = (x _ {j - 1}, x _ {j}), \quad 1 \leq j \leq N
$$

with

$$
x _ {j} = j h, \qquad h = \frac {1}{N}.
$$

Here $P ^ { k } ( I _ { j } )$ denotes the set of polynomials of degree at most k in the interval $I _ { j }$ .

Recall the $L ^ { 2 }$ projection of a function $u ( x )$ into the space $V _ { h }$ is defined by the unique function $u _ { h } \in V _ { h }$ which satisfies

$$
\left| \left| u - u _ {h} \right| \right| \leq \left| \left| u - v \right| \right| \quad \forall v \in V _ {h}
$$

where the norm is the usual $L ^ { 2 }$ norm. We assume $u ( x )$ has at least $k + 2$ continuous derivatives.

(1) Prove the error estimate

$$
| | u - u _ {h} | | \leq C h ^ {k + 1}
$$

Explain how the constant C depends on the derivatives of $u ( x )$

(2) If another function $\varphi ( x )$ also has at least $k { + 2 }$ continuous derivatives, prove

$$
\left| \int_ {0} ^ {1} (u (x) - u _ {h} (x)) \varphi (x) d x \right| \leq C h ^ {2 k + 2}
$$

Explain how the constant C depends on the derivatives of $u ( x )$ and $\varphi ( x )$