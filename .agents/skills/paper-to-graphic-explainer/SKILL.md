---
name: paper-to-graphic-explainer
description: Turn a research paper into an illustrated eight-page explainer or comic with a recurring worked example, upright reading preview, and folded A4 print PDF. Use for paper zines, comics, graphical explainers, and illustrated pamphlets.
compatibility: Requires pdfLaTeX with TikZ, qrcode and pdfpages, Poppler, and ImageMagick.
---

# Paper to graphic explainer

1. Read the primary paper. Choose one mechanism worth showing and check the motivating example, results, and limitations. Record the relevant pages or sections. Label invented examples as illustrations.
2. Start with a concrete question the reader can answer by the end. Plan six interior beats around one case. Show the initial state, change one thing at a time, and show the consequence. End with the payoff or trade-off.
3. Draw the state before writing the caption. Reuse objects, coordinates, labels, and color meanings. Use diagrams to show decisions or changes and captions to explain what is invisible. Keep labels and numbers readable at print size.
4. Use the papergraphic package with the 12 pt article class. One A5 column per page. Make a cover, six interior pages, and a back cover with attribution and a padded, clickable source QR.
5. Run scripts/build.sh SOURCE.tex BASENAME from the source directory. It makes a reading PDF, four-side A4 print PDF, and a four-by-two upright preview PNG. The print file uses two duplex A4 sheets, landscape, short-edge flip, at 100%.
6. Check the upright preview for clipping, small labels, and continuity. Decode the QR from the reading back cover and imposed outside sheet. Verify the reading PDF link annotation and compare it with the source URL.
7. Show the upright preview first. Give the print settings and distinguish the reading and print files by name. Mention any checks that were unavailable.

Bloom example: introduce a slow dictionary lookup, reuse the bit array as exceptions are added, test one word with a zero and one with all ones, and finish by counting the saved disk trips.
