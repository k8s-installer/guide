SRCS = kubernetes-guide_jp.adoc kubernetes-guide_en.adoc quickstart-standalone_jp.adoc quickstart-standalone_en.adoc
HTMLS = $(SRCS:%.adoc=%.html)
PDFS = $(SRCS:%.adoc=%.pdf)

all: html

html: clean-htmls $(HTMLS)

pdf: clean-pdfs $(PDFS)

%.html: %.adoc
	asciidoctor -o $@ $<

%.pdf: %.adoc
	asciidoctor-pdf -r asciidoctor-pdf-cjk-kai_gen_gothic -a pdf-style=theme/KaiGenGothicJP-theme.yml -o $@ $<
	#asciidoctor-pdf -r asciidoctor-pdf-cjk -o $@ $<

download-font:
	asciidoctor-pdf-cjk-kai_gen_gothic-install

clean: clean-htmls clean-pdfs

clean-htmls:
	rm -f $(HTMLS)

clean-pdfs:
	rm -f $(PDFS)
