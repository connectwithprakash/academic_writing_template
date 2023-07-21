# Variables
TEX_SOURCE = ./main.tex
OUTPUT_DIR = output

# Targets
all: pdf

pdf:
	mkdir -p $(OUTPUT_DIR)/sections  # Create the output/sections directory
	pdflatex -output-directory=$(OUTPUT_DIR) $(TEX_SOURCE)
	bibtex $(OUTPUT_DIR)/$(basename $(TEX_SOURCE))
	pdflatex -output-directory=$(OUTPUT_DIR) $(TEX_SOURCE)
	pdflatex -output-directory=$(OUTPUT_DIR) $(TEX_SOURCE)

clean:
	latexmk -c -output-directory=$(OUTPUT_DIR)
	rm -f $(OUTPUT_DIR)/thesis.bbl
	rm -f $(OUTPUT_DIR)/thesis.pdf
