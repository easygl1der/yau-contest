const CJK_FALLBACK_CSS = `
section,
section h1,
section h2,
section h3,
section h4,
section h5,
section h6,
section p,
section li,
section blockquote,
section table,
section th,
section td,
section header,
section footer {
  font-family: Inter, "PingFang SC", "Hiragino Sans GB", "Heiti SC", "Noto Sans CJK SC", "Noto Serif CJK SC", "Arial Unicode MS", sans-serif !important;
}

section pre,
section code {
  font-family: "Source Code Pro", "Noto Sans Mono CJK SC", "PingFang SC", "Hiragino Sans GB", monospace !important;
}
`;

module.exports = ({ marp }) => {
  const renderStyle = marp.renderStyle.bind(marp);
  marp.renderStyle = (theme) => `${renderStyle(theme)}\n${CJK_FALLBACK_CSS}`;

  return marp
    .use(require("./markdown-it/@kazumatu981/markdown-it-kroki/index"))
    .use(require("./markdown-it/markdown-it-mark/dist/markdown-it-mark.min"))
    .use(require("./markdown-it/markdown-it-container/dist/markdown-it-container.min"), "container");
};
