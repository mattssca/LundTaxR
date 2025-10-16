#!/bin/bash
git checkout pkgdown
git merge main
Rscript -e "pkgdown::build_site()"
git add .
git commit -m "Auto-update pkgdown site $(date)"
git push origin pkgdown
echo "Site updated and deployed!"