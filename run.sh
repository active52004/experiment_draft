#!/bin/bash

texFile="experiment_draft"

pdflatex ${texFile}.tex 
bibtex ${texFile}.aux
pdflatex ${texFile}.tex
pdflatex ${texFile}.tex

