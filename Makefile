latex:
	- pdflatex -synctex=1 -interaction=nonstopmode 'main.tex' | egrep "(Warning|Error)" -i | grep -v "Incompatible color definition"
	- bibtex main
	- makeindex -g -l -s index.ist main
	- makeglossaries main
	- pdflatex -synctex=1 -interaction=nonstopmode 'main.tex' | grep -i error
	- pdflatex -synctex=1 -interaction=nonstopmode 'main.tex' | egrep "(Warning|Error)" -i | grep -v "Incompatible color definition"
	- cp main.pdf pdf/diplomarbeit-tdd-und-rails-wienert`date --rfc-3339=date`.pdf
todo:
	ack-grep TODO
special:
	- ack-grep \cite | grep '}\['
	ack-grep \cite{


