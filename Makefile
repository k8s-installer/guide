SRCS = kubernetes-guide_jp.adoc kubernetes-guide_en.adoc quickstart-standalone_jp.adoc quickstart-standalone_en.adoc
HTMLS = $(SRCS:%.adoc=%.html)
PDFS = $(SRCS:%.adoc=%.pdf)

#BUNDLE_EXEC =
BUNDLE_EXEC = bundle exec

all: html

html: clean-htmls $(HTMLS)

pdf: clean-pdfs $(PDFS)

%.html: %.adoc
	$(BUNDLE_EXEC) asciidoctor -o $@ $<

%.pdf: %.adoc
	$(BUNDLE_EXEC) asciidoctor-pdf -r asciidoctor-pdf-cjk-kai_gen_gothic -a pdf-style=theme/KaiGenGothicJP-theme.yml -o $@ $<
	#asciidoctor-pdf -r asciidoctor-pdf-cjk -o $@ $<

download-font:
	$(BUNDLE_EXEC) asciidoctor-pdf-cjk-kai_gen_gothic-install

clean: clean-htmls clean-pdfs

clean-htmls:
	rm -f $(HTMLS)

clean-pdfs:
	rm -f $(PDFS)
