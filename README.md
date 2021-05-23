# Suda For GoldenDict

## DESCRIPTION

The [Suda Lexicon](https://en.wikipedia.org/wiki/Suda) is a Greek dictionary from the
10th century A.D. containing more than 31000 lemmas.

**Suda For GoldenDict** is a utility to decode the text of Suda, taken from the [TLG
CDROM](http://stephanus.tlg.uci.edu/), into utf-8 text, and then compile the
data into a ABBYY Lingvo .dsl dictionary file that can be used with
[GoldenDict]( http://goldendict.org/), so that the Suda can be searched like any
other modern dictionary.

## DEPENDENCIES
The **Suda For GoldenDict** script is meant to be run within a Linux environment.
It requires the following:

* [tlg2u](https://github.com/proteusx/tlg2u), this is the beta-code to utf-8 text conversion
    utility.
* Bash
* Perl
* Patch
* TLG CDROM. This is no longer sold but it can be found via bit torrents.


## USAGE

Clone the Github repository `git clone https://github.com/proteusx/Suda-For-GoldenDict.git`

Edit the first line of the file `build-suda.sh`. The variable `TLG_CDROM` must
contain the path to the TLG CDROM files.

Run the script `build-suda.sh`

If everything is in order the file **`dictionary/suda.dsl`** should be produced.  Point
GoldenDict to this folder and the Suda lexicon is ready to search.  Alternatively you may
copy the folder **`dictionary`** to some other location.

There is also a release with `suda.dsl` compiled and ready to use.

## NOTES
The Suda as encoded in the TLG CDROM is sourced from this hard copy edition:
Suidae lexicon, 4 vols., Adler, A. (Ed) Leipzig, Teubner, 1928 - 1971

## SEE ALSO

<https://www.cs.uky.edu/~raphael/sol/sol-html/>

<http://www.poesialatina.it/_ns/greek/testi/Suda/Lexicon.html>

<http://dadako.narod.ru/paperpoe.htm#greek>

<!-- vim: set tw=80 spell fo=tq: -->
