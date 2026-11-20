---
name: paper-to-zine
description: Turn a research paper into an eight-panel LaTeX mini-zine. Use for paper zines, paper-to-zine revisions, source QR covers, and foldable or reading-order PDF exports.
compatibility: Uses the latex-mini-zine template, pdfLaTeX with TikZ and qrcode, and Poppler. QR verification can use ZXing.
---

# Paper to zine

1. Read the primary paper. Record the title, authors, stable URL, and the sections supporting the claims you plan to use. Check results against the actual tables, examples, or methods. Label invented teaching examples and keep them consistent with the paper.
2. Choose a reader and a question they will be able to answer after reading. Open with a prediction or choice in a worked example. Carry that case through the mechanism and its consequence. Use the last inside panel to resolve the question or test whether the reader can apply the idea.
3. Reverse-outline the six inside panels in one sentence each. Cut repeated jobs. Introduce technical terms where the example needs them. Use small diagrams, comparisons, or tables when they make relationships visible. Include compact section or figure references for claims that readers may want to verify.
4. Use the repository's mini-zine.tex and preserve its imposition engine. Replace the eight page blocks in reading order. Put the title, authors, and a high-contrast, padded QR code on page 7. Encode the original source URL, and make the code clickable in the PDF. Keep enough whitespace around it for scanning.
5. From the LaTeX source directory, run the bundled script with the source filename and a PDF basename. It compiles the eight-page preview and the one-sheet US Letter version with fold and cut guides. Use the template's A4 option when requested.
6. Render the PDFs, check clipping and legibility at panel scale, and confirm the back cover and fold order. Decode the QR from both rendered outputs and compare it with the original URL. Check PDF link annotations. Record any check that could not be done.
7. Deliver the two verified PDFs through the available download surface. For an at-a-glance preview, render the reading-order PDF into a four-column, two-row grid, with all panels upright and the front cover at upper left. Identify the print format and its 100% scale setting. For revisions, use a distinct filename when it helps the reader identify the newest version.

Example editorial test: After reading a build-systems zine, a reader can explain why a cell may acquire a new dependency and predict when unchanged output prevents downstream work.
