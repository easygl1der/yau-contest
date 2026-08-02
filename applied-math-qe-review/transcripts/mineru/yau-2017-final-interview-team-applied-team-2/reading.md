1 (Optimal Mass Transport). Suppose <sup>D</sup> is the unit disk in the plane, $P = \{p_{1}, p_{2}, \cdots, p_{n}\}$ is a discrete planar point set. Each point $p_{i}$ is associated with a weight $r_{i}$ , the power distance between any point $p \in \mathbb{R}^{2}$ to $p_{i}$ is defined as

$$
Pow(p, p_{i}) = | p - p_{i} |^{2} + r_{i}.
$$

The power Voronoi diagram is a partition of the whole plane

$$
\mathbb{R}^{2} = \bigcup_{i = 1}^{n} W_{i}, W_{i} = \{p \in \mathbb{R}^{2} | Pow(p, p_{i}) \leq Pow(p, p_{j}), \forall 1 \leq j \leq n\}.
$$

The power Vornoi diagram induces a cell decomposition of <sup>D</sup>,

$$
\mathbb{D} = \bigcup_{i = 1}^{n} W_{i} \cap \mathbb{D},
$$

suppose the area of each cell $\mathbb{D} \cap W_{i}$ is $A_{i}$ . Construct a mapping $\varphi : \mathbb{D} P$ , such that each cell $W_{i} \cap \mathbb{D}$ is mapped to the point $p_{i}$

$$
\varphi : W_{i} \cap \mathbb{D} \mapsto p_{i}, \forall 1 \leq i \leq n.
$$

(1) Suppose $\mathrm{gi}$ ven another cell decomposition

$$
\mathbb{D} = \bigcup_{i = 1}^{n} \tilde{W}_{i} \cap \mathbb{D},
$$

and construct a mapping $\tilde{\varphi}$ , such that

$$
\tilde{\varphi}: \tilde{W}_{i} \cap \mathbb{D} \mapsto p_{i},
$$

and the area of each cell $\tilde{W}_{i} \cap \mathbb{D}$ equals to $A_{i}$ as well. The $L^{2}$ transportation cost of $\varphi$ is defined as

$$
E(\varphi) := \int_{\mathbb{D}} | p - \varphi(p) |^{2} dA,
$$

show that the mapping $\varphi$ is optimal, i.e.

$$
E(\varphi) \leq E(\tilde{\varphi}).
$$

(2) Show that there exists real numbers $h_{1}, h_{2}, \cdots, h_{n}$ , which determine n planes

$$
\pi_{i}(p) := \langle p, p_{i} \rangle + h_{i},
$$

the upper envelope of the planes $\{\pi_{i}\}$ is the graph of the convex PL function

$$
f(p) = \max_{1 \leq i \leq n} \pi_{i}(p).
$$

The power Voronoi diagram is induced by the projection of the upper envelope of these planes $\{\pi_{i}, i = 1, 2, \cdots, n\}$

![](parts/images/2ae7dd1379a4dfbb77ec218fd7c8661183524004612171ad9179b28dcebc87dd.jpg)