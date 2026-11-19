# LaTeX Mini-Zine

Make an eight-page booklet from one sheet of paper. Write the pages in reading order; LaTeX rearranges and rotates them for the standard one-slit fold. No staples, glue, browser editor, or shell escape.

## Edit and build

Edit the eight `\ZinePage{n}{...}` blocks in [mini-zine.tex](mini-zine.tex). Page 0 is the front cover, 1–6 are the inside pages, and 7 is the back cover. The blocks accept normal LaTeX, including `\includegraphics` and TikZ. The template leaves a 6 mm safe margin inside each panel and warns if a panel is too tall.

Install a LaTeX distribution with pdfLaTeX, geometry, and TikZ. Run pdfLaTeX twice so the page positions settle:

```sh
pdflatex -halt-on-error mini-zine.tex
pdflatex -halt-on-error mini-zine.tex
```

Alternatively, use `latexmk -pdf mini-zine.tex`. A4 is the default. Uncomment `\def\ZineLetter{1}` in the source for US Letter. Define `\ZineNoGuides` before loading the file to hide the guides. For an eight-page PDF in reading order, run this command twice:

```sh
pdflatex -halt-on-error -jobname=mini-zine-preview '\def\ZinePreview{1}\input{mini-zine.tex}'
```

## Print and fold

Try the [A4 example](mini-zine-a4.pdf) or [US Letter example](mini-zine-letter.pdf).

1. Print one-sided, landscape, at **Actual Size / 100%**.
2. Crease the sheet into four columns and two rows. Unfold it.
3. Cut **only** the solid center segment, across the two middle columns.
4. Fold lengthwise, printed side out. Push the short ends toward each other until the slit opens into a diamond.
5. Flatten the diamond into a cross. Wrap the panels so the front and back covers are outside.

The top row is rotated 180° on purpose. Inspired by the [fanzines.app project](https://github.com/krthr/fanzines.app).
