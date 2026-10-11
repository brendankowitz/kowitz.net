# Resume themes

Custom [RenderCV](https://rendercv.com) Typst themes for my resume.

- `notebook/`: "Engineer's Notebook" theme (IBM Plex, teal accents)
- `swiss/`: "Swiss grid" theme (Hanken Grotesk, left label column, orange accent)
- `fonts/`: IBM Plex Sans and Mono (`fonts/LICENSE.txt`) and Hanken Grotesk (`fonts/OFL-HankenGrotesk.txt`), both under the SIL Open Font License

The resume content and design settings are private and live in the gitignored `reference/` folder, which links `reference/notebook`, `reference/swiss` and `reference/fonts` back to this folder. The public About page (`src/content/docs/about.mdx`) is a separate, shorter summary.

Wrap a number in italics (`*25B+*`) in the content YAML to render it as a highlighted chip. Each role's title and date share one line so ATS parsers read the date with its role.

## Render

From this folder:

```
PYTHONIOENCODING=utf-8 rendercv render ../reference/brendan_kowitz_cv_private.yaml -d ../reference/design_notebook_private.yaml -typ ../reference/private_output/Brendan_Kowitz_CV.typ -pdf ../reference/private_output/Brendan_Kowitz_CV.pdf -png ../reference/private_output/Brendan_Kowitz_CV.png -nomd
```

For the Swiss theme:

```
PYTHONIOENCODING=utf-8 rendercv render ../reference/brendan_kowitz_cv_private.yaml -d ../reference/design_swiss_private.yaml -typ ../reference/swiss_output/Brendan_Kowitz_CV.typ -pdf ../reference/swiss_output/Brendan_Kowitz_CV.pdf -png ../reference/swiss_output/Brendan_Kowitz_CV.png -nomd
```
