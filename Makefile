TARGET_DIR = ../target/install/jp

SRCS = kubernetes-guide_jp.adoc kubernetes-guide_en.adoc
TARGET = $(SRCS:%.adoc=%.html)

all: clean $(TARGET)

%.html: %.adoc
	asciidoctor -o $@ $<

clean:
	rm -f $(TARGET)

install: $(TARGET)
	mkdir -p $(TARGET_DIR)
	cp $(TARGET) $(TARGET_DIR)
