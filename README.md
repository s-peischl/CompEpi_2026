# Computational Epidemiology 2026

Course website for *Computational Epidemiology* (Master in Bioinformatics and Computational Biology, University of Bern, HS 2026).

**Live site:** https://s-peischl.github.io/CompEpi_2026/

## Contents

- `index.qmd`, `schedule.qmd`, `days/`: course overview and day-by-day plan
- `tutorials/`: six R tutorials (SIR, branching processes and resistance, strain invasion, within-host dynamics, spatial models, R_t estimation)
- `slides/`: four lectures as reveal.js decks (figures in `slides/img/`)
- `projects/`: project guide, pitch templates, project menu
- `ai-policy.qmd`: AI use policy

## Build and publish

Requires Quarto and R with `deSolve`, `ggplot2`, `dplyr`, `tidyr`, `EpiEstim`.

```bash
quarto preview              # local preview
quarto publish gh-pages     # render and publish to GitHub Pages
```
