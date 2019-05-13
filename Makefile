# Usage:
#   Set your parameters in the variables section
#   Use `$ make` to compile
#   Use `$ make show` to open pdf

# Tex/Latex compiler command
TEXC=lualatex
# Compiler flags
TEXFL=-halt-on-error
# Main file
MAIN=main
# Reader command
READER=evince
# Reader flags
READERFL=
INCLUDES=./focus-beamertheme
GENPIC=

.PHONY: all show clean pictures

all: $(MAIN).pdf

show: all
	$(READER) $(READERFL) $(MAIN).pdf &

$(MAIN).pdf: $(MAIN).tex pictures build
	TEXINPUTS="$(TEXINPUTS):$(INCLUDES)" $(TEXC) -output-directory build $(TEXFL) $(MAIN)
	mv build/$(MAIN).pdf .

pictures:

build:
	mkdir build

clean:
	-rm -rf build
	-rm $(GENPIC)
