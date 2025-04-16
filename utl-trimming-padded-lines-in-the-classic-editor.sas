%let pgm=utl-trimming-padded-lines-in-the-classic-editor;

Trimming padded lines in the classic editor
Create a copy of the classic editor program in the clipbrd with trimmed lines.

Simpler solution:  go to TOOLS/OPTIONS/PROGRAM EDITOR/ (uncheck include blank space in clipboard)

PROBLEM
Copying and pasting classic editor paaded program lines into listservers and
word documents causes lines to fold. It looks like double spacing.

github
https://tinyurl.com/2xjv39wm
https://github.com/rogerjdeangelis/utl-trimming-padded-lines-in-the-classic-editor


many macros (sas_saspac.sas (performance package)
https://tinyurl.com/2w6aejec
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories

/*               _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
| |_) | | | (_) | |_) | |  __/ | | | | |
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
|_|
*/

The classic editor pads lines with blanks.

The underlines(space characters) are REMOVED, lines end with ';'

%macro xpada / cmd;_____________________________________...
   filename clp clipbrd;________________________________...
   data _null_;_________________________________________...
     infile "c:/utl/&pgm..sas";_________________________...
     input;_____________________________________________...
     t=trim(_infile_);__________________________________...
     put t;_____________________________________________...
     putlog t;__________________________________________...
   run;quit;____________________________________________...
%medn xpada;____________________________________________...

/*         _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| `_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

*/

I could not get gsubmit to work

options cmdmac;
/*----  cmdmac must be set     ----*/

Type xpad on the classic editor command line
or place the xpad macro on a function key

cntl U  xpad

%macro xpad / cmd des="Usage: xpad on command line. Remove line padding and copy program to clipbrd";
   /*---- save current program ----*/
   file "catalog 'sasuser.profile.sasinp.source" r;home;note;notesubmit '%xpada;';
   run;
%mend xpad;

%macro xpada ;
   filename clp clear;
   filename clp clipbrd;
   /*---- copy to clipbrd      ----*/
   data _null_;
     infile "catalog 'sasuser.profile.sasinp.source";
     input;
     file clp;
     put _infile_ ;
   run;quit;
%mend xpada;

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
