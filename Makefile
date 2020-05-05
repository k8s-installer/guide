SRCS = kubernetes-guide_jp.adoc kubernetes-guide_en.adoc quickstart-standalone_jp.adoc
HTMLS = $(SRCS:%.adoc=%.html)
PDFS = $(SRCS:%.adoc=%.pdf)

all: html

html: clean-htmls $(HTMLS)

pdf: clean-pdfs $(PDFS)

%.html: %.adoc
	bundle exec asciidoctor -o $@ $<

%.pdf: %.adoc
	bundle exec asciidoctor-pdf -r asciidoctor-pdf-cjk -o $@ $<

clean: clean-htmls clean-pdfs

clean-htmls:
	rm -f $(HTMLS)

clean-pdfs:
	rm -f $(PDFS)
