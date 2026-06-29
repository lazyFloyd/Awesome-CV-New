.PHONY: examples

CC = xelatex
EXAMPLES_DIR = examples
CV_DIR = examples/cv
CV_DE_DIR = examples/cv_deu
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
CV_DE_SRCS = $(shell find $(CV_DE_DIR) -name '*.tex')

examples: $(foreach x, cv cv-de, $x.pdf)

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

cv-de.pdf: $(EXAMPLES_DIR)/cv-de.tex $(CV_DE_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf
