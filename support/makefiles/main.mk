MAIN := $(shell ./pillar introspect mainDocument)

OUTPUTDIRECTORY := $(shell ./pillar introspect outputDirectory)
LATEXTEMPLATE := $(shell ./pillar introspect latexTemplate)
LATEXCHAPTERTEMPLATE := $(shell ./pillar introspect latexChapterTemplate)
HTMLTEMPLATE := $(shell ./pillar introspect htmlTemplate)
HTMLCHAPTERTEMPLATE := $(shell ./pillar introspect htmlChapterTemplate)
CHAPTERS := $(shell ./pillar introspect chapters)

.phony: all book chapters

all: pdf html ## Build everything in all formats
book: htmlbook pdfbook ## Full book only, all formats
chapters: pdfchapters htmlchapters ## Separate chapters, all formats

include support/makefiles/help.mk
include support/makefiles/prepare.mk
include support/makefiles/pdf.mk
include support/makefiles/html.mk
include support/makefiles/epub.mk
