print("Hello, world!  I'm a .latexmkrc\n");
use File::Basename;
 $pdf_mode = 1; $dvi_mode = $postscript_mode = 0;
add_cus_dep('plt','pdf', 0, 'makegnu2pdf');
sub makegnu2pdf {
system("powershell .\\cplt.ps1 -filename \"$_[0].plt\"") ;
return 0;
}
@default_files = ('0_Main.tex');
$latex="xelatex -synctex=1 -shell-escape -interaction=nonstopmode";
$pdflatex="xelatex -synctex=1 -shell-escape -interaction=nonstopmode";
