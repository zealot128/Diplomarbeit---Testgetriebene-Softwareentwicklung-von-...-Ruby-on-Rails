pdf:
	- pdflatex -synctex=1 -interaction=nonstopmode 'main.tex' | grep -i error
	- bibtex main.tex
	- makeglossaries main
	- pdflatex -synctex=1 -interaction=nonstopmode 'main.tex' | grep -i error
	pdflatex -synctex=1 -interaction=nonstopmode 'main.tex' | grep -i error
	- cp main.pdf diplomarbeit-tdd-und-rails-wienert`date --rfc-3339=date`.pdf

