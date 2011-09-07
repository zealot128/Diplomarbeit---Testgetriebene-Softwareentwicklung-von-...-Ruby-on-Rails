pdf:
	- pdflatex -synctex=1 -interaction=nonstopmode 'main.tex'
	- bibtex main.tex
	- makeglossaries main
	- pdflatex -synctex=1 -interaction=nonstopmode 'main.tex'
	- pdflatex -synctex=1 -interaction=nonstopmode 'main.tex'
	- cp main.pdf diplomarbeit-tdd-und-rails-wienert`date --rfc-3339=date`.pdf

