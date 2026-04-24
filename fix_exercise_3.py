import os

path = '/Volumes/SSK SSD/Projects/yau-contest/latex-project/content/split_applied/applied_2016.tex'
with open(path, 'r') as f:
    lines = f.readlines()

# Problem 3 block is around lines 95-111 (0-indexed 94-110)
new_exercise_3 = r"""\begin{exercise}
A vector $\mathbf{u}=(u_{1},\dots,u_{n})\in\mathbb{N}^{n}$ is multiplicatively dependent if there is a nonzero vector $\mathbf{k}=(k_{1},\dots,k_{n})\in\mathbb{Z}^{n}$ for which:
\[
u_{1}^{k_{1}}\dots u_{n}^{k_{n}}=1. \tag{1}
\]

This is important in factorization and primality testing algorithms. Prove that if $\mathbf{u}=(u_{1},\dots,u_{n})\in\mathbb{N}^{n}$ is multiplicatively dependent with $\|\mathbf{u}\|_{\infty}\leq H$ where $\|\mathbf{u}\|_{\infty}=\max_{1\leq i\leq n}|u_{i}|$, then there exists a nonzero $\mathbf{k}=(k_{1},\dots,k_{n})\in\mathbb{Z}^{n}$ with:
\[
\|\mathbf{k}\|_{\infty}\leq\left(\frac{2n\log H}{\log 2}\right)^{n-1}.
\]

Thus for fixed $n$, it can be found in polynomial time of order $(\log H)^{n(n-1)}$.

Comment: To solve this problem, you can use the following statement (without proof) which informally means that if a system of homogeneous equations with integer coefficients has a nontrivial solution then it has an integer solution with reasonably small components.

Let $A=(a_{ij})_{i,j=1}^{m,n}$ be an $m\times n$ matrix of rank $r\leq n-1$ with integer entries of size at most $H$. Then there is a nonzero integer vector $\mathbf{x}=(x_{1},\dots,x_{n})\in\mathbb{Z}^{n}$ such that $A\mathbf{x}=\mathbf{0}$ and $\|\mathbf{x}\|_{\infty}\leq(2nH)^{n-1}$.
\end{exercise}
"""

start_idx = -1
end_idx = -1
for i, line in enumerate(lines):
    if "\\begin{exercise}" in line and i > 80 and i < 100:
        start_idx = i
    if "\\end{exercise}" in line and i > start_idx and i < 120 and start_idx != -1:
        end_idx = i
        break

if start_idx != -1 and end_idx != -1:
    lines[start_idx:end_idx+1] = [new_exercise_3]
    with open(path, 'w') as f:
        f.writelines(lines)
    print(f"Successfully updated Exercise 3 (lines {start_idx+1}-{end_idx+1})")
else:
    print(f"Failed to find Exercise 3 block. Found start: {start_idx}, end: {end_idx}")
