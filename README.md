# Thesis Template

Minimal LaTeX thesis template based on the local `kaobook` setup and title-page
styling from the original thesis project.

## Build

From the repository root:

```sh
latexmk -cd -lualatex main.tex
latexmk -cd -lualatex main-draft.tex
latexmk -cd -lualatex presentation/presentation.tex
```

`latexmk` runs `biber` automatically for the bibliography. The checked-in
`latexmkrc` files use LuaLaTeX with shell escape enabled, matching the original
project's SVG logo workflow. The workspace settings in `.vscode/settings.json`
enable LaTeX Workshop auto-build on save, which also works in Cursor when the
LaTeX Workshop extension is installed.

The repository also includes a small `Makefile`:

```sh
make thesis
make draft
make presentation
make watch
make clean
```

`make draft` compiles `main-draft.tex`, which uses the same thesis source but
skips external image rendering and marks overfull boxes. It is useful while
editing text in figure-heavy chapters. `make watch` runs `latexmk -pvc` for a
terminal-based continuous build.

## Local Setup

This template is tested with LuaLaTeX through `latexmk`.

On Fedora, the simplest setup is the full TeX Live scheme plus the build tools
and Inkscape for the SVG logos:

```sh
sudo dnf install texlive-scheme-full latexmk biber inkscape
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
- Heading override in `main.tex` and `presentation/presentation.tex`:
  `Linux Biolinum O`, matching the original thesis and slides. The thesis file
  has a small fallback, but the presentation assumes the font is installed.

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
- `figs/`: shared figure directory for the thesis and presentation, including
  institutional logos and copied example images.
- `presentation/`: minimal beamer presentation using the same bibliography and
  the same Metropolis-based style as the source presentation.

The chapter `chapters/examples.tex` shows regular and full-width figures and
tables. Replace the copied example images with project-specific files using
`\includegraphics`.

Both `main.tex` and `presentation/presentation.tex` resolve figures through the
root `figs/` directory. Keep new thesis and slide figures there instead of
creating presentation-local image folders.

## Compilation Practices

- Use `main.tex` for final output and `main-draft.tex` while writing.
- Keep chapters in separate files and include them from `main.tex` with
  `\include`. This enables `\includeonly{chapters/introduction}` for fast
  chapter-focused builds.
- Compile once without `\includeonly` before submitting, so references,
  bibliography, page numbers, and the table of contents are final.
- Prefer PDF for vector plots and diagrams. Large PNG/JPG files slow builds and
  often look worse in print.
- Avoid SVG conversion in the inner edit loop. Export SVGs to PDF once, then
  include the PDF in the thesis.
- Keep generated files out of Git. The checked-in `.gitignore` ignores LaTeX
  logs, aux files, PDFs, and Beamer navigation files by default.
- Put reusable notation in `macros.tex`, bibliography entries in `main.bib`, and
  one chapter per file in `chapters/`.
- Use stable label prefixes such as `ch:`, `sec:`, `fig:`, `tab:`, `eq:`, and
  `app:`. This makes large projects much easier to navigate.
