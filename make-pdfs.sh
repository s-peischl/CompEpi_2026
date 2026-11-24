#!/bin/bash
# Print the rendered site to PDF with headless Chrome.
# Usage: quarto render && ./make-pdfs.sh   (then quarto publish gh-pages)
set -e
cd "$(dirname "$0")"
C="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
mkdir -p pdf
pr() {  # $1 = page under _site, $2 = output pdf, $3 = optional query
  for try in 1 2 3; do
    "$C" --headless=new --disable-gpu --allow-file-access-from-files --no-pdf-header-footer \
      --virtual-time-budget=40000 --print-to-pdf="pdf/$2" "file://$PWD/_site/$1$3" >/dev/null 2>&1 || true
    [ "$(wc -c < "pdf/$2")" -gt 10000 ] && { echo "ok   $2"; return; }
  done
  echo "FAIL $2"
}
for d in L1-compartment-models L2-chance L3-pathogen-evolution L4-space-data; do pr slides/$d.html $d.pdf "?print-pdf"; done
for t in 00-solving-odes 01-sir 02-chance 03-strain-invasion 04-within-host 05-spatial 06-rt-estimation; do pr tutorials/$t.html "T${t:1:1}-${t:3}.pdf"; done
pr ai-policy.html ai-policy.pdf
pr projects/index.html projects.pdf
pr schedule.html schedule.pdf
pr index.html course-overview.pdf
for i in 1 2 3 4; do pr days/day-$i.html day-$i.pdf; done
