pdf:
	- pdflatex -synctex=1 -interaction=nonstopmode 'main.tex' | egrep "(Warning|Error)" -i | grep -v "Incompatible color definition"
	- bibtex main
	- makeglossaries main
	- pdflatex -synctex=1 -interaction=nonstopmode 'main.tex' | grep -i error
	- pdflatex -synctex=1 -interaction=nonstopmode 'main.tex' | egrep "(Warning|Error)" -i | grep -v "Incompatible color definition"
	- cp main.pdf pdf/diplomarbeit-tdd-und-rails-wienert`date --rfc-3339=date`.pdf
todo:
	ack-grep TODO

