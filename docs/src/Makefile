name=Introduction_to_Hadoop

all: build view

build:
	/usr/bin/pdflatex ${name}
	/usr/bin/pdflatex ${name}
	/usr/bin/pdflatex ${name}
	/usr/bin/pdflatex ${name}
	mv ${name}.pdf ../

view:
	acroread ../${name}.pdf

clean:
	rm -f *.toc *.snm  *.out *.nav *.log *.aux *.vrb *~

