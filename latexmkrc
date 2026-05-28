# Keep LuaLaTeX font caches outside the repository.
$ENV{'TEXMFVAR'} = '/tmp/texlive-texmf-var';
$ENV{'TEXMFCONFIG'} = '/tmp/texlive-texmf-config';

$pdf_mode = 4;
$lualatex = 'lualatex -shell-escape -interaction=nonstopmode -synctex=1 -file-line-error %O %S';
