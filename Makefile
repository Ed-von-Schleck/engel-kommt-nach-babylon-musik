LY_FILES=$(wildcard *.ly)
MIDI_FILES=$(LY_FILES:.ly=.midi)
PDF_FILES=$(LY_FILES:.ly=.pdf)
MP3_FILES=$(LY_FILES:.ly=.mp3)

.PHONY: all
all: $(PDF_FILES) $(MIDI_FILES) $(MP3_FILES)

$(PDF_FILES): %.pdf: %.ly
	lilypond $<

$(MIDI_FILES): %.midi: %.ly
	lilypond $<

$(MP3_FILES): %.mp3: %.midi
	timidity $< -Ow -s 44100 -o - | lame - erste-fanfare.mp3 -h

