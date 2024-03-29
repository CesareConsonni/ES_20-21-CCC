LATEXCOMPILER = pdflatex
BIBERCOMPILER = biber

REMOVE_FILES_COMMAND = rm -f *.log *.aux *.lof *.lot *.toc *.out *.fls *.fdb_latexmk *.bbl *.bcf *.blg *.run.xml 


SRC_DIR = report/src
GO_HOME = ./../..

DELIVERABLES_DIR = report

COMMON_DIR = report/common

REPORT_DIR = report/src

FILE_DIR = Files

MAIN_PDF = main.pdf
MAIN_TEX = main.tex
MAIN_BIB = main.bib

MAIN = main

DD_DIR = $(SRC_DIR)/DD
DD_NAME = DD

__COMMON = $(COMMON_DIR)/commandsFile.tex $(COMMON_DIR)/util/*




$(SRC_DIR)/$(MAIN_PDF): $(SRC_DIR)/$(MAIN_TEX) $(SRC_DIR)/$(FILE_DIR)/* $(__COMMON)
	cd $(SRC_DIR) && $(LATEXCOMPILER) $(MAIN_TEX) && $(BIBERCOMPILER) $(MAIN) && $(LATEXCOMPILER) $(MAIN_TEX)


clean:
	$(REMOVE_FILES_COMMAND)
	cd $(SRC_DIR) && $(REMOVE_FILES_COMMAND)

uninstall: clean
	cd $(SRC_DIR) && rm -f *.pdf

all: $(SRC_DIR)/$(MAIN_PDF)

install: $(SRC_DIR)/$(MAIN_PDF)
	make clean

update:
	make uninstall
	make clean
	make install
