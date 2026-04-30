# Plan: LaTeX Knowledge Annotation Skills

## Plan Summary

**Plan saved to:** `.omc/plans/latex-annotation-skills.md`

**Scope:** 2 new skills + 1 shared infrastructure file across 5 files
**Estimated complexity:** MEDIUM

**Key Deliverables:**
1. `/footnote` skill at `~/.claude/skills/omc-learned/latex-footnote/SKILL.md` (user-level, cross-project)
2. Enhanced `/sidenote` skill at `.omc/skills/margin-note/SKILL.md` (project-level, already exists)
3. Shared LaTeX infrastructure snippet at `latex-project/annotation-macros.tex`

---

## 1. Skill Specifications

### Skill 1: Footnote Annotation Skill

| Property | Value |
|---|---|
| **File path** | `~/.claude/skills/omc-learned/latex-footnote/SKILL.md` |
| **Trigger keywords** | `footnote:`, `/footnote`, `脚注:`, `加脚注` |
| **Argument hint** | `<type> <text>` |
| **Scope** | user (cross-project, for any LaTeX document) |

**What it does:** Inserts a footnote into the currently edited LaTeX file at cursor position.

**Annotation types supported:**

| Type | Keyword | Inserted LaTeX |
|---|---|---|
| Explanation | `explain`, `解释`, `explanation` | `\footnote{...}` with full prose |
| Answer | `answer`, `答案`, `solve` | `\footnote{Answer: ...}` |
| Cross-ref | `ref`, `引用`, `cross` | `\footnote{See Eq. (\ref{label}) on page \pageref{label}}` |
| Hint | `hint`, `提示`, `hint:` | `\footnote{Try: ...}` |
| Reference | `cite`, `cite:`, `参考` | `\footnote{\cite{key}}` |
| Proof | `proof`, `证明`, `prove` | `\footnote{Proof sketch: ...}` |

**Output format:**
```latex
...some text...\footnote{Your annotation text here}
```

The skill generates the `\footnote{...}` wrapper and inserts it inline after the current word/phrase.

---

### Skill 2: Sidenote Annotation Skill (Enhancement)

| Property | Value |
|---|---|
| **File path** | `.omc/skills/margin-note/SKILL.md` (replace existing) |
| **Trigger keywords** | `sidenote:`, `/sidenote`, `margin:`, `边注:` |
| **Argument hint** | `<type> <text>` |
| **Scope** | project (YAU contest LaTeX project only) |

**What it does:** Inserts a sidenote/marginnote into the current `.tex` file using kaobook's `\sidenote` command.

**Annotation types supported:**

| Type | Keyword | Inserted LaTeX |
|---|---|---|
| Insight | `insight`, `直觉`, `intuition` | `\sidenote{💡 ...}` |
| Question | `question`, `提问`, `?` | `\sidenote{❓ ...}` |
| Answer | `answer`, `回答`, `✅` | `\sidenote{✅ ...}` |
| Warning | `warning`, `注意`, `⚠️` | `\sidenote{⚠️ ...}` |
| Try-it | `try`, `试试`, `hint` | `\sidenote{🔧 Try it: ...}` |
| Reference | `ref`, `引用`, `link` | `\sidenote{→ See Section \ref{...}}` |

**Output format:**
```latex
...some text...\sidenote{💡 Your insight here}
```

The skill uses kaobook's built-in `\sidenote[]` command (already available in the class).

---

### How the Two Skills Differ and Complement

| Dimension | Footnote (`/footnote`) | Sidenote (`/sidenote`) |
|---|---|---|
| **Location** | Bottom of page (float) | Margin beside the line |
| **Persistence** | Survives document reflow | Tied to specific line position |
| **Use case** | Deeper explanations, answers, proofs | Quick intuitions, questions, study prompts |
| **Content length** | Medium-to-long prose | Short phrases / single sentences |
| **Document flow** | Disrupts reading (eye moves down) | Non-disruptive (peripheral vision) |
| **Reference support** | Can reference back to `\label{}` | Can reference via `\ref{}` |
| **Scope** | User-level (any LaTeX project) | Project-level (kaobook project only) |

**Complementary workflow:**
- `/footnote` for: "Why does this step work?", "The answer uses integration by parts", "Historical note: discovered by Euler in 1734"
- `/sidenote` for: "This is the key insight", "Wait — why is that true?", "Try setting x=0 to check", "Intuition: think of this as a rotation"

---

## 2. LaTeX Infrastructure Requirements

### Shared File: `annotation-macros.tex`

Create at: `latex-project/annotation-macros.tex`

This file is included by `config.tex` and provides helper commands for both skills.

```latex
% ============================================================
% Annotation Infrastructure
% Shared macros for footnote and sidenote annotations
% Included by config.tex
% ============================================================

% --- Footnote annotation helpers ---

% Standard explanatory footnote
\DeclareDocumentCommand{\fn}{mo}{%
  \footnote{#1%
    \IfValueT{#2}{\ (#2)}%
  }%
}

% Footnote with cross-reference (label + page)
\DeclareDocumentCommand{\fnref}{mmo}{%
  \footnote{#1%
    \IfValueT{#2}{\ (Eq. (\ref{#2}))}%
    \IfValueT{#3}{\ p.\ \pageref{#3})}%
  }%
}

% Footnote with hint label
\DeclareDocumentCommand{\fnhint}{m}{%
  \footnote{Hint: #1}%
}

% Footnote with answer label
\DeclareDocumentCommand{\fnans}{m}{%
  \footnote{Solution: #1}%
}

% Footnote with proof sketch
\DeclareDocumentCommand{\fnproof}{m}{%
  \footnote{Proof: #1}%
}

% --- Sidenote helpers (kaobook built-in \sidenote is default) ---
% Override defaults if needed:
% \setmarginfont{\normalfont\small}
% \marginnotevadjust{-2pt}

% Colored sidenotes (optional)
\DeclareDocumentCommand{\sidenotewarn}{m}{%
  \sidenote{\color{red}⚠️ #1}%
}

\DeclareDocumentCommand{\sidenoteinsight}{m}{%
  \sidenote{\color{blue}💡 #1}%
}
```

### Package Dependencies

The annotation macros require these packages (all already loaded or available):

- `todonotes` — NOT needed; kaobook already provides `\sidenote` via its own macro
- `geometry` — already set by kaobook class
- `makecell`, `tabularx` — already loaded in `config.tex`
- `xcolor` — via kaobook, `\color` available
- `xparse` — via kaobook, `\DeclareDocumentCommand` available

**No new packages needed.** The infrastructure reuses what kaobook already provides.

### `config.tex` Changes

Add to `config.tex` (after existing package loading):

```latex
% Annotation infrastructure
\input{annotation-macros}
```

This single line makes all helper macros available in every `.tex` file.

---

## 3. Workflow Examples

### Example 1: Adding a footnote

**User action:**
```
用户：在"由 stokes 公式可得"后面加脚注，脚注内容是"实际上需要验证边界条件"
```

**Skill behavior:**
1. Detects `/footnote` trigger and `explain` intent
2. Finds current file (e.g., `content/prereq_geometry.tex`)
3. Locates cursor after "由 stokes 公式可得"
4. Inserts: `由 stokes 公式可得\footnote{实际上需要验证边界条件}`
5. Reports: "Added footnote at line X"

---

### Example 2: Adding a sidenote

**User action:**
```
用户：sidenote: 这里的几何直观是：将曲面看作流形上的区域
```

**Skill behavior:**
1. Detects `/sidenote` trigger and `insight` intent
2. Finds current file (e.g., `content/geometry.tex`)
3. Locates cursor after relevant sentence
4. Inserts: `...\sidenote{💡 将曲面看作流形上的区域}`
5. Reports: "Added sidenote at line X"

---

### Example 3: Footnote with equation cross-reference

**User action:**
```
用户：footnote: ref eq:laplace-equation, 给这个公式加一个关于它历史渊源的脚注
```

**Skill behavior:**
1. Detects `/footnote ref` intent
2. Looks up `eq:laplace-equation` label
3. Inserts: `\footnote{Historical note: ... (see Eq. (\ref{eq:laplace-equation}))}`
4. Reports: "Added footnote referencing eq:laplace-equation"

---

### Example 4: Sidenote for a study question

**User action:**
```
用户：在"等周不等式"这段加一个提问的 sidenote
```

**Skill behavior:**
1. Detects `/sidenote question` intent
2. Inserts: `...\sidenote{❓ 等周不等式的证明需要哪些前置知识？}`
3. Reports: "Added question sidenote"

---

## 4. File Structure

```
yau-contest/
├── latex-project/
│   ├── config.tex                        [MODIFY: add \input{annotation-macros}]
│   └── annotation-macros.tex             [NEW: shared annotation helpers]
│
├── .omc/
│   └── skills/
│       └── margin-note/
│           └── SKILL.md                  [REPLACE: enhanced sidenote skill]
│
└── ~/.claude/skills/omc-learned/          (user-level)
    └── latex-footnote/
        └── SKILL.md                      [NEW: footnote annotation skill]

Files summary:
  - 1 NEW file in project:   latex-project/annotation-macros.tex
  - 1 MODIFY in project:    latex-project/config.tex
  - 1 REPLACE in project:   .omc/skills/margin-note/SKILL.md
  - 1 NEW user-level skill:  ~/.claude/skills/omc-learned/latex-footnote/SKILL.md
```

---

## 5. Implementation Checklist

### Phase 1: LaTeX Infrastructure (foundational, do first)

- [ ] **Create `latex-project/annotation-macros.tex`** with all helper commands
  - `\fn{}`, `\fnref{}{}`, `\fnhint{}`, `\fnans{}`, `\fnproof{}`
  - `\sidenotewarn{}`, `\sidenoteinsight{}`
  - All use xparse/kaobook built-ins, no new packages
- [ ] **Modify `latex-project/config.tex`** to include `annotation-macros.tex`
- [ ] **Compile** `latex-project/main.tex` to verify no errors from new macros
- [ ] **Git commit** infrastructure change

### Phase 2: Footnote Skill (user-level, cross-project)

- [ ] **Create `~/.claude/skills/omc-learned/latex-footnote/SKILL.md`**
  - YAML frontmatter: name, description, triggers, argument-hint, scope
  - Trigger keywords: `footnote:`, `/footnote`, `脚注:`, `加脚注`
  - Full workflow: detect intent, find file, locate cursor, insert `\footnote{...}`
  - Annotation types table (explain/answer/ref/hint/cite/proof)
  - 4 example workflows with exact LaTeX output
  - Notes on cross-file label resolution
- [ ] **Verify** skill is listed in `/skill list`

### Phase 3: Sidenote Skill Enhancement (project-level, replace existing)

- [ ] **Replace `.omc/skills/margin-note/SKILL.md`** with enhanced version
  - Keep the existing sidenote mechanics (kaobook `\sidenote`)
  - Add missing types: insight (💡), try-it (🔧), reference (→)
  - Update workflow to match footnote skill's structure
  - Add emoji prefix to each type (consistent visual language)
  - Add notes about `mainmatter` layout requirement
  - Add offset syntax documentation (`\sidenote[<offset>]{...}`)
  - Add marginfigure/margintable environments
- [ ] **Test** in an actual `.tex` file with a sidenote insertion
- [ ] **Git commit** enhanced skill

### Phase 4: Verification

- [ ] Insert a footnote in `prereq_geometry.tex` via `/footnote`
- [ ] Insert a sidenote in `prereq_physics.tex` via `/sidenote`
- [ ] Compile `main.pdf` and verify both appear correctly
- [ ] Verify footnote at bottom of page, sidenote in margin
- [ ] Final git commit with both annotation examples

---

## 6. Open Questions

- **Should the footnote skill support `\footnote[<number>]{...}` for manual numbering?** The macro could accept an optional argument. Most geometry notes don't need manual numbering, so default auto-numbering is fine — but adding it is low-cost and useful for matching footnotes to a separate answer key.

- **Should sidenotes have a companion `sidenotes-bibliography.tex` file** for study references? Currently sidenotes reference inline (`\ref{}`). If the user wants a separate study notes file, a `annotations/sidenotes-studies.tex` could be added as a `\include` target.

- **Emoji in LaTeX**: Both skills use emoji prefixes (💡, ❓, ✅, ⚠️, 🔧, →). Verify that the kaobook template's font configuration supports emoji rendering. If not, fall back to text labels (e.g., "Hint:" instead of "💡 Try it:"). The skill should list both options.

---

## Success Criteria

1. Typing `/footnote` with content generates valid `\footnote{...}` LaTeX in the current file
2. Typing `/sidenote` with content generates valid `\sidenote{...}` LaTeX in the current file
3. Both compile without errors in `main.pdf`
4. Footnotes appear at page bottom; sidenotes appear in margin
5. Both skills are discoverable via `/skill list`
6. No new LaTeX packages required (reuse existing infrastructure)