# Thesis Template

Minimal LaTeX thesis template based on the local `kaobook` setup from the
original thesis project.

## Build

From the repository root:

```sh
latexmk -cd -lualatex main.tex
latexmk -cd -lualatex presentation/presentation.tex
```

`latexmk` runs `biber` automatically for the bibliography. The workspace
settings in `.vscode/settings.json` enable LaTeX Workshop auto-build on save,
which also works in Cursor when the LaTeX Workshop extension is installed.

## Local Setup

This template is tested with LuaLaTeX through `latexmk`.

On Fedora, the simplest setup is the full TeX Live scheme plus the build tools:

```sh
sudo dnf install texlive-scheme-full latexmk biber
```

The full scheme is intentionally broad. It avoids chasing individual LaTeX
packages while writing, presenting, or adding figures. If you prefer a smaller
install, start from the errors reported by `latexmk` and install the missing
`texlive-*` packages one by one.

Recommended editor setup:

- Install the VS Code/Cursor extension `James-Yu.latex-workshop`.
- Open this repository as the workspace root.
- Save `main.tex` or `presentation/presentation.tex`; the checked-in settings
  run `latexmk -lualatex -cd` automatically on save.

### Fonts

The default thesis build uses the `kaobook` modern font path with LuaLaTeX:

- Main serif/math fonts: `Libertinus Serif` and `Libertinus Math`.
- Sans font: `Libertinus Sans`.
- Monospace font: `Liberation Mono`.
- Heading override in `main.tex`: `Linux Biolinum O` when installed, otherwise
  `Latin Modern Roman` as a fallback.

On Fedora, the fonts used in the tested setup are covered by:

```sh
sudo dnf install linux-libertine-biolinum-fonts liberation-mono-fonts
```

`Libertinus` and `newpx` are included in TeX Live; with the full scheme, the
relevant LaTeX files are already available. `newpxtext` and `newpxmath` are only
used if you switch the inherited `kaobook` setup to its older `fontmethod=tex`
path. The template itself uses the modern LuaLaTeX path, so `newpx` is not a
separate runtime requirement here.

`Consolas` is not required by this template. The original thesis had a local
`Consolas.ttf`, but Consolas is a Microsoft font and should only be added if you
have a licensed copy. If `fc-match "Consolas"` returns another font, Consolas is
not installed and fontconfig is substituting a fallback.

## Structure

- `main.tex`: thesis root file and document structure.
- `frontmatter/`: abstract and acknowledgements.
- `chapters/`: thesis chapters and appendix content.
- `macros.tex`: shared notation and helper commands.
- `main.bib`: bibliography database.
- `presentation/`: minimal beamer presentation using the same bibliography.

The chapter `chapters/examples.tex` shows regular and full-width figures and
tables. Replace the placeholder TikZ drawings with real files using
`\includegraphics`.
