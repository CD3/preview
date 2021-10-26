start:
	sexpect -sock preview-gnuplot.sock spawn gnuplot
	zenity --info --no-markup --text="Click 'OK' when you are done to close the preview."
	

refresh:
	sexpect -sock preview-gnuplot.sock send 'load "$(INFILE_ABS)"' -cr
	sexpect -sock preview-gnuplot.sock expect

cleanup:
	sexpect -sock preview-gnuplot.sock send 'exit' -cr
	sexpect -sock preview-gnuplot.sock wait
