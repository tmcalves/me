CV_SRC = cv.md
CV_PDF = cv.pdf
CV_HTML = cv.html

.PHONY: pdf html clean deps

pdf: $(CV_PDF)

$(CV_PDF): $(CV_SRC) $(wildcard images/*)
	pandoc $(CV_SRC) -o $(CV_PDF) \
		--pdf-engine=weasyprint \
		--css=cv.css \
		-V margin-top=20mm \
		-V margin-bottom=20mm \
		-V margin-left=20mm \
		-V margin-right=20mm

html: $(CV_HTML)

$(CV_HTML): $(CV_SRC) $(wildcard images/*)
	pandoc $(CV_SRC) -o $(CV_HTML) --standalone --css=cv.css

clean:
	rm -f $(CV_PDF) $(CV_HTML)

deps:
	brew install pandoc weasyprint
