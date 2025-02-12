---
title: "Cross-validation results from admixture"
author: "Nikolaos Tourvas"
date: "2025-02-12"
output: 
  html_document:
    code_download: yes
    code_folding: show
    theme: default
    toc: yes
    toc_float: yes
    keep_md: yes
---


``` r
knitr::opts_chunk$set(echo = TRUE, include=TRUE, cache=FALSE,
                      dev = c("png", "pdf", "svg"), dpi = 300)
```

# Load libraries

``` r
library(ggplot2)
```

# CV plot
load the data

``` r
cv <- read.table("../results/admixture/cv.error", header = FALSE)
colnames(cv) <- c("K", "CV")
```

plot cv

``` r
ggplot(cv, aes(x=K, y=CV)) +
  geom_point()+
  geom_line() +
  ylab("Cross-validaiton error")
```

![](02_Admixture_files/figure-html/cv_plot-1.png)<!-- -->

