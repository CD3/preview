check-dependencies:
	which gnuplot 2> /dev/null >/dev/null || echo "Could not find 'gnuplot'. Try 'apt install gnuplot'."
	which sexpect 2> /dev/null >/dev/null || echo "Could not find 'sexpect', which is required to run the gnuplot interactive session. See 'https://github.com/clarkwang/sexpect' for install directions."
	which zenity 2> /dev/null >/dev/null || echo "Could not find 'zenity', which is used for creating the pop up window that keeps 'preview' alive.  Try 'apt install zenity'."

start:
	sexpect -sock preview-gnuplot.sock spawn gnuplot
	zenity --info --no-markup --text="Click 'OK' when you are done to close the preview."
	

refresh:
	sexpect -sock preview-gnuplot.sock send 'load "$(INFILE_ABS)"' -cr
	sexpect -sock preview-gnuplot.sock expect

cleanup:
	sexpect -sock preview-gnuplot.sock send 'exit' -cr
	sexpect -sock preview-gnuplot.sock wait
