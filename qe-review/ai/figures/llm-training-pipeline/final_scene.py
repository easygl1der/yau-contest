from manim import *

BG = "#FFFBF5"
INK = "#1C1917"
MUTED = "#57534E"
PT = "#1D4ED8"
SFT = "#0F766E"
AL = "#C2410C"
INF = "#15803D"
RM = "#6D28D9"
GOLD = "#A16207"
FRZ = "#57534E"


def cn_ok():
    return False


class RenderScene(Scene):
    def construct(self):
        self.camera.background_color = BG

        title = Text(
            "LLM pipeline: one backbone, changing targets",
            font_size=30,
            color=INK,
            weight=BOLD,
        ).to_edge(UP, buff=0.18)

        thesis = Text(
            "Same Transformer weights. Data and objective change. Three objects: policy, judge, frozen reference.",
            font_size=16,
            color=MUTED,
        ).next_to(title, DOWN, buff=0.10)

        caption = Text(
            "Pretraining fits the web conditional, not a useful answer.",
            font_size=18,
            color=INK,
        ).to_edge(DOWN, buff=0.16)

        self.play(FadeIn(title, shift=0.12 * UP), FadeIn(thesis))
        self.play(FadeIn(caption))
        self.wait(0.6)

        bands = self._epoch_bands()
        self.play(LaggedStart(*[FadeIn(b, shift=0.1 * UP) for b in bands], lag_ratio=0.12))
        self.wait(0.3)

        cards = self._stage_cards()
        arrows = VGroup(
            self._arrow(cards[0], cards[1]),
            self._arrow(cards[1], cards[2]),
            self._arrow(cards[2], cards[3]),
        )
        self.play(LaggedStart(*[FadeIn(c, shift=0.15 * UP) for c in cards], lag_ratio=0.12))
        self.play(LaggedStart(*[GrowArrow(a) for a in arrows], lag_ratio=0.08))
        self.wait(0.8)

        next_cap = Text(
            "Parameter docking: copy, keep training, or freeze.",
            font_size=18,
            color=INK,
        ).to_edge(DOWN, buff=0.16)
        self.play(FadeOut(caption), FadeIn(next_cap))
        caption = next_cap

        chips, chip_arrows, copies = self._passport(cards)
        self.play(LaggedStart(*[FadeIn(ch, shift=0.1 * DOWN) for ch in chips], lag_ratio=0.1))
        self.play(LaggedStart(*[GrowArrow(a) for a in chip_arrows], lag_ratio=0.08))
        self.wait(0.35)
        self.play(FadeIn(copies, shift=0.1 * DOWN))
        self.wait(1.0)

        next_cap = Text(
            "Alignment fork: same KL-preference goal, two computational routes.",
            font_size=18,
            color=INK,
        ).to_edge(DOWN, buff=0.16)
        self.play(FadeOut(caption), FadeIn(next_cap))
        caption = next_cap

        overview = VGroup(bands, cards, arrows, chips, chip_arrows, copies)
        self.play(overview.animate.scale(0.42).to_edge(UP, buff=0.72), run_time=0.9)

        fork = self._alignment_fork()
        self.play(FadeIn(fork, shift=0.12 * UP))
        self.wait(1.6)

        next_cap = Text(
            "If the reward model is already trained, write J and its policy gradient. Not L_RM, not DPO.",
            font_size=17,
            color=INK,
        ).to_edge(DOWN, buff=0.16)
        self.play(FadeOut(caption), FadeIn(next_cap))
        caption = next_cap
        self.wait(1.2)

        self.play(FadeOut(fork), FadeOut(overview))
        recap = self._recap_table()
        self.play(FadeIn(recap, shift=0.1 * UP))
        last_cap = Text(
            "SFT is demonstration CE. PPO maximises J; it is not a fourth objective. RAG does not train theta.",
            font_size=17,
            color=INK,
        ).to_edge(DOWN, buff=0.16)
        self.play(FadeOut(caption), FadeIn(last_cap))
        self.wait(2.2)

    def _epoch_bands(self):
        specs = [
            ("PRETRAIN", PT, LEFT * 4.65 + UP * 2.55),
            ("POST-TRAIN  =  SFT + Align", AL, ORIGIN + UP * 2.55),
            ("INFERENCE", INF, RIGHT * 4.65 + UP * 2.55),
        ]
        group = VGroup()
        for name, color, pos in specs:
            label = Text(name, font_size=16, color=color, weight=BOLD)
            bar = RoundedRectangle(
                width=max(3.4, label.width + 0.55),
                height=0.38,
                corner_radius=0.08,
                stroke_color=color,
                fill_color=color,
                fill_opacity=0.12,
                stroke_width=1.5,
            )
            item = VGroup(bar, label).move_to(pos)
            group.add(item)
        return group

    def _stage_cards(self):
        data = [
            (
                "1  Pretrain",
                r"\max_\theta \sum_t \log p_\theta(x_{t+1}\mid x_{1:t})",
                "raw corpus  ·  train " + r"\theta",
                PT,
                LEFT * 4.85 + UP * 0.35,
            ),
            (
                "2  SFT",
                r"(x,y_{\mathrm{demo}})\ \mathrm{CE}",
                r"init \theta \leftarrow \theta_{\mathrm{PT}}",
                SFT,
                LEFT * 1.62 + UP * 0.35,
            ),
            (
                "3  Align",
                r"(x,y^+,y^-)\ \mathrm{RM}+J\ \mathrm{or}\ \mathrm{DPO}",
                r"train \phi\ \mathrm{then}\ \theta,\ \mathrm{or}\ \theta\ \mathrm{only}",
                AL,
                RIGHT * 1.62 + UP * 0.35,
            ),
            (
                "4  Infer",
                r"\mathrm{top}\text{-}P(x)\ \mathrm{or}\ \mathrm{RAG}",
                r"\theta\ \mathrm{frozen}",
                INF,
                RIGHT * 4.85 + UP * 0.35,
            ),
        ]
        cards = VGroup()
        for title, formula, foot, color, pos in data:
            box = RoundedRectangle(
                width=2.95,
                height=2.15,
                corner_radius=0.12,
                stroke_color=color,
                fill_color=color,
                fill_opacity=0.10,
                stroke_width=2,
            )
            head = Text(title, font_size=20, color=color, weight=BOLD)
            eq = MathTex(formula, font_size=22, color=INK)
            note = MathTex(foot, font_size=20, color=MUTED)
            body = VGroup(head, eq, note).arrange(DOWN, buff=0.16)
            card = VGroup(box, body).move_to(pos)
            cards.add(card)
        return cards

    def _arrow(self, a, b):
        return Arrow(
            a.get_right() + 0.02 * RIGHT,
            b.get_left() + 0.02 * LEFT,
            buff=0.08,
            stroke_width=2.4,
            color=INK,
            max_tip_length_to_length_ratio=0.18,
        )

    def _passport(self, cards):
        labels = [
            (r"\theta_{\mathrm{PT}}", GOLD, cards[0]),
            (r"\theta_{\mathrm{SFT}}", GOLD, cards[1]),
            (r"\theta", GOLD, cards[2]),
            (r"\theta\ \mathrm{frozen}", FRZ, cards[3]),
        ]
        chips = VGroup()
        for tex, color, card in labels:
            chip = self._chip(tex, color)
            chip.next_to(card, DOWN, buff=0.28)
            chips.add(chip)

        arrs = VGroup(
            Arrow(chips[0].get_right(), chips[1].get_left(), buff=0.08, stroke_width=2, color=GOLD, max_tip_length_to_length_ratio=0.2),
            Arrow(chips[1].get_right(), chips[2].get_left(), buff=0.08, stroke_width=2, color=GOLD, max_tip_length_to_length_ratio=0.2),
            Arrow(chips[2].get_right(), chips[3].get_left(), buff=0.08, stroke_width=2, color=FRZ, max_tip_length_to_length_ratio=0.2),
        )

        piref = self._chip(r"\pi_{\mathrm{ref}}=\mathrm{copy}(\theta_{\mathrm{SFT}})\ \mathrm{frozen}", FRZ)
        phi = self._chip(r"\phi=\mathrm{copy}(\theta_{\mathrm{SFT}})+\mathrm{head}", RM)
        piref.next_to(chips[1], DOWN, buff=0.22)
        phi.next_to(chips[2], DOWN, buff=0.22)
        copies = VGroup(piref, phi)
        return chips, arrs, copies

    def _chip(self, tex, color):
        body = MathTex(tex, font_size=20, color=color)
        box = RoundedRectangle(
            width=body.width + 0.28,
            height=body.height + 0.18,
            corner_radius=0.08,
            stroke_color=color,
            fill_color=color,
            fill_opacity=0.12,
            stroke_width=1.5,
        )
        return VGroup(box, body)

    def _alignment_fork(self):
        pairs = self._panel(
            "preference pairs",
            r"(x,y^+,y^-)",
            AL,
            width=3.3,
            height=1.15,
        ).move_to(LEFT * 4.7 + DOWN * 0.15)

        route_a = self._panel(
            "Route A   RM then RLHF",
            r"\min_\phi \mathcal{L}_{\mathrm{RM}} \;\to\; \mathrm{freeze}\ r_\phi \;\to\; \max_\theta J",
            RM,
            width=5.5,
            height=1.55,
        ).move_to(LEFT * 0.15 + UP * 0.85)

        j_eq = MathTex(
            r"J(\theta)=\mathbb{E}_{y\sim\pi_\theta}\big[r_\phi-\beta\log(\pi_\theta/\pi_{\mathrm{ref}})\big]",
            font_size=26,
            color=INK,
        ).next_to(route_a, DOWN, buff=0.12)

        route_b = self._panel(
            "Route B   DPO",
            r"\min_\theta \mathcal{L}_{\mathrm{DPO}}\quad (r\ \mathrm{implicit})",
            AL,
            width=5.5,
            height=1.35,
        ).move_to(LEFT * 0.15 + DOWN * 1.55)

        out = self._panel(
            "aligned policy",
            r"\pi_\theta",
            GOLD,
            width=2.6,
            height=1.15,
        ).move_to(RIGHT * 4.85 + DOWN * 0.25)

        a1 = Arrow(pairs.get_right(), route_a.get_left(), buff=0.1, color=RM, stroke_width=2.2)
        a2 = Arrow(pairs.get_right(), route_b.get_left(), buff=0.1, color=AL, stroke_width=2.2)
        a3 = Arrow(route_a.get_right(), out.get_left() + 0.15 * UP, buff=0.1, color=RM, stroke_width=2.2)
        a4 = Arrow(route_b.get_right(), out.get_left() + 0.15 * DOWN, buff=0.1, color=AL, stroke_width=2.2)

        note = Text(
            "PPO is the optimiser for J. SFT is not a preference loss.",
            font_size=16,
            color=MUTED,
        ).next_to(route_b, DOWN, buff=0.18)

        return VGroup(pairs, route_a, j_eq, route_b, out, a1, a2, a3, a4, note)

    def _panel(self, title, formula, color, width, height):
        box = RoundedRectangle(
            width=width,
            height=height,
            corner_radius=0.10,
            stroke_color=color,
            fill_color=color,
            fill_opacity=0.10,
            stroke_width=2,
        )
        head = Text(title, font_size=16, color=color, weight=BOLD)
        eq = MathTex(formula, font_size=22, color=INK)
        body = VGroup(head, eq).arrange(DOWN, buff=0.10)
        return VGroup(box, body)

    def _recap_table(self):
        rows = [
            (r"\theta", "generator / policy", "PT, SFT, then J or DPO", "inference, RAG"),
            (r"\phi", "judge / reward model", r"\mathcal{L}_{\mathrm{RM}}\ \mathrm{only}", r"\mathrm{before}\ J"),
            (r"\pi_{\mathrm{ref}}", "KL leash anchor", "never", r"\mathrm{copied\ from\ SFT}"),
            (r"V,\ \mathrm{tok}", "tokenizer / vocab", "designed before PT", "usually frozen"),
        ]
        header = VGroup(
            Text("object", font_size=16, color=MUTED, weight=BOLD),
            Text("role", font_size=16, color=MUTED, weight=BOLD),
            Text("updated by", font_size=16, color=MUTED, weight=BOLD),
            Text("frozen after", font_size=16, color=MUTED, weight=BOLD),
        ).arrange(RIGHT, buff=1.15)
        header[0].set_x(-5.2)
        header[1].set_x(-2.4)
        header[2].set_x(1.05)
        header[3].set_x(4.55)

        body = VGroup()
        colors = [GOLD, RM, FRZ, PT]
        for (sym, role, upd, frz), color in zip(rows, colors):
            line = VGroup(
                MathTex(sym, font_size=26, color=color),
                Text(role, font_size=17, color=INK),
                MathTex(upd, font_size=20, color=INK) if "\\" in upd or "_" in upd else Text(upd, font_size=17, color=INK),
                MathTex(frz, font_size=20, color=INK) if "\\" in frz or "_" in frz else Text(frz, font_size=17, color=INK),
            )
            line[0].set_x(-5.2)
            line[1].set_x(-2.4)
            line[2].set_x(1.05)
            line[3].set_x(4.55)
            body.add(line)
        body.arrange(DOWN, buff=0.32)
        body.next_to(header, DOWN, buff=0.28)

        frame = RoundedRectangle(
            width=12.6,
            height=4.35,
            corner_radius=0.12,
            stroke_color=INK,
            fill_color=BG,
            fill_opacity=0.0,
            stroke_width=1.5,
        )
        table = VGroup(header, body)
        table.move_to(frame.get_center() + 0.08 * UP)
        title = Text("Parameter passport", font_size=22, color=INK, weight=BOLD)
        block = VGroup(title, VGroup(frame, table)).arrange(DOWN, buff=0.16)
        block.move_to(ORIGIN + 0.15 * UP)
        return block
