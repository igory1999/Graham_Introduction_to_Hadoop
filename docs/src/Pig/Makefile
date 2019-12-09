name=Pig

all: build view

build:
	/usr/bin/pdflatex ${name}
	/usr/bin/pdflatex ${name}
	/usr/bin/pdflatex ${name}
	/usr/bin/pdflatex ${name}

view:
	acroread ${name}.pdf

clean:
	rm -f *.toc *.snm  *.out *.nav *.log *.aux *.vrb *~

