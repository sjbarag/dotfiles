$pdf_previewer = "start xpdf -remote localhost";
$pdf_update_method = 4;
$pdf_update_command = "xpdf -remote localhost -reload";
 
#0 Automatic update
#1 Manual update
#2 Unix update
#3 Acrobat locks the file (Windows)
#4 Run a command

$pdflatex = 'pdflatex --shell-escape'

