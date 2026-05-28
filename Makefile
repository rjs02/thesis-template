THESIS = main.tex
DRAFT = main-draft.tex
PRESENTATION = presentation/presentation.tex

.PHONY: thesis draft presentation watch clean clean-all

thesis:
	latexmk -cd -lualatex $(THESIS)

draft:
	latexmk -cd -lualatex $(DRAFT)

presentation:
	latexmk -cd -lualatex $(PRESENTATION)

watch:
	latexmk -cd -pvc -lualatex $(THESIS)

clean:
	latexmk -cd -c $(THESIS)
	latexmk -cd -c $(DRAFT)
	latexmk -cd -c $(PRESENTATION)

clean-all:
	latexmk -cd -C $(THESIS)
	latexmk -cd -C $(DRAFT)
	latexmk -cd -C $(PRESENTATION)
