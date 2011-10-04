latex:
	- pdflatex -synctex=1 -interaction=nonstopmode 'main.tex' | egrep "(Warning|Error)" -i | grep -v "Incompatible color definition"
	- bibtex main
	- makeindex  -l -s styles/index.ist main
	- makeglossaries main
	- pdflatex -synctex=1 -interaction=nonstopmode 'main.tex' | grep -i error
	- pdflatex -synctex=1 -interaction=nonstopmode 'main.tex' | egrep "(Warning|Error)" -i | grep -v "Incompatible color definition"
	- cp main.pdf pdf/current.pdf
todo:
	ack-grep TODO
special:
	- ack-grep \cite | grep '}\['
	ack-grep \cite{
clean:
	rm *.aux
	rm */**/*.aux
open:
	vim `find parts | grep "tex$$"`

