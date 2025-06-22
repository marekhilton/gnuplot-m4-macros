define(m4_default,`ifelse($1,`',$2,$1)')dnl
dnl
define(m4_args_by_line,`ifelse(`$1', `', `', `$1\
m4_args_by_line(shift($@))')')dnl
dnl
dnl
dnl Macris to set figure size parameters
define(`m4_pngcairo_set_width',
`define(`m4_pngcairo_width',$1)dnl
define(`m4_pngcairo_width_unit',`m4_default($2,`cm')')dnl)
')dnl
m4_pngcairo_set_width(12,cm)dnl
define(`m4_pngcairo_set_height',
`define(`m4_pngcairo_height',$1)dnl
define(`m4_pngcairo_height_unit',
`m4_default($2,`cm')')dnl
dnl
')dnl
m4_pngcairo_set_height(9,cm)dnl
define(`m4_pngcairo_set_dpi',
`define(`m4_pngcairo_dpi',$1)dnl
')dnl
m4_pngcairo_set_dpi(600)dnl
define(`m4_pngcairo_set_output',
`set output "| magick - -density m4_pngcairo_dpi $1"
')dnl
dnl
dnl A macro to set the terminal to pngcairo
define(m4_pngcairo,
`scale = m4_pngcairo_dpi/96.0
set term pngcairo\
         size (m4_pngcairo_width*scale)m4_pngcairo_width_unit,(m4_pngcairo_height*scale)m4_pngcairo_height_unit\
         fontscale scale\
         pointscale scale\
         linewidth scale\
         transparent rounded\
         m4_args_by_line($@)
')dnl
dnl
dnl Macros to handle font sizes because gnuplot doesn't scale fonts
dnl properly
define(m4_font,
`sprintf("$1,%0.02f",m4_default($2,10)*0.75)dnl
')dnl
define(m4_pngcairo_default_font,
`m4_font(Nimbus Roman, 10)dnl
')dnl
dnl
