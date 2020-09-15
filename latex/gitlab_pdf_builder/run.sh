for dir in */;
do
	if [ "${dir}" == "pdf/" ]; then
		continue
	fi

	for name in "$dir"*.tex; do break; done

	pdflatex -output-dir "$dir" "${name}"
	outname=${name%.tex}
	mv "$dir${outname##*/}.pdf" "${name%/*}.pdf" 
done
