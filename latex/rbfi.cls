%%%
%%% rbfi.cls - a LaTeX document class for the Revista Boliviana de Física
%%%
%%% Author: Instituto de Investigaciones Físicas, Carrera de Física,
%%%	    Universidad Mayor de San Andrés,
%%%         La Paz, Bolivia

%%% This is a modification from the original:
%%%-----------------------------------------------------------------
%%% rmaa.cls - a LaTeX document class for the RevMexAA
%%% Author: William Henney (will@astrosmo.unam.mx)
%%% Copyright (C) 1999, 2000 Instituto de Astronomia, UNAM, Mexico
%%%-----------------------------------------------------------------
%%% and under the terms of the GNU General Public License. The changes
%%% were made on June, 2002.

%%% This program is free software; you can redistribute it and/or
%%% modify it under the terms of the GNU General Public License
%%% as published by the Free Software Foundation; either version 2
%%% of the License, or (at your option) any later version.
%%% 
%%% This program is distributed in the hope that it will be useful,
%%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%%% GNU General Public License for more details.
%%% 
%%% You should have received a copy of the GNU General Public License
%%% along with this program; if not, write to the Free Software
%%% Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
%%% 
\NeedsTeXFormat{LaTeX2e}[1995/06/01]
\newcommand{\rmaa@version}{2.1}
\newcommand{\rmaa@date}{2001/01/23}
%% Version 2.1 (2001/01/23)
%%  Fixed some inconsistencies in \nocite and \bibitem uniqification 
%%  Fixed the definition of \ion so it will work in math mode and in
%%  contexts where the typesize is different from normal (e.g. title,
%%  fig captions). 
%%  Modified the definition of \@caption, so we don't write any
%%  list-of-figures data (we never use it anyway, and it just causes
%%  problems with fragile commands in fig captions). 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%            REVISION HISTORY            %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Version 2.0 (2000/11/30) 
%%  Added `newstyle' option, which should be used in all new
%%  proceedings volumes (wider abstract, smaller typeface in fig
%%  captions, etc.) Added commands for formatting table captions. New
%%  demonstation document rmpostsamp.tex for 1-page posters. This will
%%  be the last release under a PRI government (for a while...)
%% Version 1.9 (2000/06/06) 
%%  Corrected position of page number in footer of articles that open
%%  on even pages. Ensured that first article in each session opens on
%%  an odd page, as do list of abstracts and author index. Added extra
%%  space in TOC before the backmatter. Added command for editors,
%%  \BoldSessionTitles, that makes produces bold titles for session in
%%  the TOC. 
%% Version 1.8 (2000/05/16) 
%%  Fixed bug in last page label with \suppressfulladdresses
%% Version 1.7 (2000/05/11) 
%%  Fixed more little things. Page labels now work, even if you have
%%  no bibliography. You can output the full addresses by hand with
%%  the \outputfulladdresses command.Editors' Guide updated but still
%%  not finished. Revamped splitbook.sh now produces PS file of each 
%%  article for web page and also an EPS file of each page for sending
%%  to the printers. 
%% Version 1.6 (2000/04/15) 
%%  More cleaning up: full stops after titles in index, running
%%  headers and footers in frontmatter, fontsize in title of index, etc
%% Version 1.5 (2000/04/15) 
%%  Eliminated superscripts from titles in TOC and index
%% Version 1.4 (2000/04/14) 
%%  Added copyright and license info (GPL)
%% Version 1.3 (2000/03/01) 
%%  Corrected \figcaption to do the caption formatting right
%%  Corrected font size of sec headings in front matter
%% Version 1.2 (2000/02/16) 
%%  Added \plate command
%% Version 1.1 (2000/02/14) 
%%  Added manuscript option, corrected bugs
%% Version 1.0 (2000/02/08): 
%%  Now does a whole book - lots of stuff tidied up
%% Version 0.7 (1999/10/04): 
%%  Increased spacing between sections in single column 
%%  styles. Suppressed floats at bottom of pages (didn't work though) 
%% Version 0.6 (1999/09/24): 
%%  Tweaked \adjustfinalcols (still not perfect) 
%%  Added proceedings option
%%  Added onecolumn/twocolumn options (orthogonal to journal/proceedings) 
%% Version 0.5 (1999/09/23): 
%%  Added \fulladdresses and \adjustfinalcols (just about working) 
%% Version 0.4 (1999/09/22): 
%%  Minor stylistic changes
%% Version 0.3 (1999/06/28): 
%%  Better mechanism for alternative affiliations
%%  Added `guide' option for user guide
%% Version 0.2 (1999/05/27): 
%%  All basic functionality present, I think
%% Version 0.1 (1999/05/26): 
%%  Just about working - still missing Fig/Tab/Refs
%% Version 0.0 (1999/05/21): 
%%  So bored today, decided to rewrite RMAA LaTeX macros from scratch
%%
\ProvidesClass{rmaa}[\rmaa@date\ v\rmaa@version\ RevMexAA article
class]


%%% Declarations that are needed in options

\newif\if@journal
\@journaltrue
\newif\if@proceedings
\@proceedingsfalse
\newif\if@manuscript
\@manuscriptfalse
\newif\if@guide
\@guidefalse
\newif\if@preprint
\@preprintfalse
\newif\if@rmtwocol
\@rmtwocoltrue
\newif\if@biblist
\@biblistfalse
\newif\if@book
\@bookfalse
\newif\if@rmcite
\@rmcitefalse
\newif\if@titlevisible
\@titlevisibletrue
\newif\if@abstractpresent
\@abstractpresentfalse
\newif\if@printbanner
\@printbannerfalse
\newif\if@suppressfulladdresses
\@suppressfulladdressesfalse
\newif\if@newstyle
\@newstylefalse
%%% The option handling - this obviously needs work

\DeclareOption{manuscript}{\typeout{Manuscript for referee} 
  \@manuscripttrue\@journalfalse\@rmtwocolfalse
  \PassOptionsToClass{12pt}{article}}
\DeclareOption{journal}{\typeout{Main journal option}%
  \@journaltrue\@rmtwocoltrue}
\DeclareOption{guide}{\typeout{User guide option}%
  \@guidetrue\@journalfalse\@rmtwocoltrue}
\DeclareOption{preprint}{\typeout{Preprint option}%
  \@preprinttrue\@journalfalse}
\DeclareOption{proceedings}{\typeout{Proceedings option}%
  \@proceedingstrue\@journalfalse\@rmtwocolfalse} 
\DeclareOption{book}{\typeout{Whole issue option}%
  \@booktrue} 
%% New option 27 Nov 2000
\DeclareOption{newstyle}{\typeout{Use new layout style}%
  \@newstyletrue}
% these two need to be declared explicitly so that \ExecuteOptions
% actually does something
\DeclareOption{twocolumn}{\@rmtwocoltrue}
\DeclareOption{onecolumn}{\@rmtwocolfalse}
\DeclareOption{twoside}{\PassOptionsToClass{\CurrentOption}{article}}
% pass any other option along to the article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% Default options:
\ExecuteOptions{twoside,article}
\ProcessOptions\relax
% What standard class do we want to be based on?
\if@book
%\if@rmtwocol\LoadClass[twocolumn]{book}\else\LoadClass{book}\fi
\LoadClass{book}
\newcommand{\abstract}{\relax}
\newcommand{\@maketitle}{\relax}
\else
\if@rmtwocol\LoadClass[twocolumn]{article}\else\LoadClass{article}\fi
\fi
\RequirePackage{graphicx}
\RequirePackage{ifthen}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modificacion del IIF: Se usa el paquete del lenguaje espaniol
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% explicitly require babel just to make sure
\IfFileExists{babel.sty}{%
%  \RequirePackage[english]{babel}
  \usepackage[ansinew]{inputenc}
  \RequirePackage[spanish]{babel}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % reinstate the definition of \@roman so as not to break .idx files
  \@ifundefined{org@@roman}{\relax}{\renewcommand{\@roman}[1]{\org@@roman{##1}}}
  }{%
  \typeout{Babel not found}}
% commented out for moment since requires more modern version of LaTeX
%\RequirePackage[latin1]{inputenc}
%%% The other stuff....

%% other declarations
\newif\if@needaddresses
\@needaddressestrue

% These are used in various commands to check if arg was left blank
\newcommand{\@rmaaEmpty}{}
\newcommand{\@rmaaArg}{}

%% This package is based on the 1998/12/01 release of LaTeX
%% Older releases may not define all the commands that we need
%% Luckily, we can use \providecommand to define these if necessary. 
%% The following commands are not defined in the 1994/06/01 release. 
                                % User commands
\providecommand{\MakeUpperCase}[1]{\uppercase{#1}}
\providecommand{\textsuperscript}[1]{\ensuremath{^\textrm{#1}}}
\providecommand{\textbackslash}{\ensuremath{\backslash}}
                                % LaTeX internal commands
\providecommand{\protected@xdef}{%
        \let\@@protect\protect
        \let\protect\@unexpandable@protect
        \afterassignment\restore@protect
        \xdef}
\providecommand{\restore@protect}{\let\protect\@@protect}
\providecommand{\@unexpandable@protect}{\noexpand\protect\noexpand}
\providecommand{\hb@xt@}{\hbox to}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modificacion del IIF: se cambian las dimensiones del texto
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Dimensions of the text
% width and side margins
\setlength{\textwidth}{7in}
\setlength{\@tempdima}{\paperwidth}
\addtolength{\@tempdima}{-\textwidth}
\setlength{\oddsidemargin}{0.5\@tempdima}
\addtolength{\oddsidemargin}{-0.75in}
\setlength{\evensidemargin}{\oddsidemargin}
\addtolength{\evensidemargin}{-0.25in}
% height and top margin
\setlength{\textheight}{9.75in} % this is height of whole lot, measured on RevMex
%\addtolength{\textheight}{-\headsep}% subtract the header/footer
%\addtolength{\textheight}{-\headheight}
%\addtolength{\textheight}{-\footskip}
\setlength{\topmargin}{-1in} % margin 8mm from top of page
\addtolength{\topmargin}{0.9in}
% columns
\setlength{\columnsep}{0.25in}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% header/footer
\setlength{\headsep}{0.7cm}
\setlength{\footskip}{0.75cm}
% paragraphs
\setlength{\parindent}{1.5em}
%% changes for the MS option
\newlength{\MSextramargin}
\setlength{\MSextramargin}{0.3in} % extra all-round margin 
\if@manuscript
   \renewcommand{\baselinestretch}{1.5}
   \addtolength{\textwidth}{-2\MSextramargin}
   \addtolength{\oddsidemargin}{\MSextramargin}
   \setlength{\evensidemargin}{\oddsidemargin}
   \addtolength{\textheight}{-2\MSextramargin}
   \addtolength{\topmargin}{\MSextramargin}
   \raggedright
\fi
%% float parameters
% need to experiment with some of these
%% don't allow bottom floats 04 Oct 1999
\renewcommand{\fps@figure}{tp}
\renewcommand{\fps@table}{tp}

%% Various parameters that we will use later. 
%%
%% These include style commands for various types of headings and
%% text, which have the form \rmaa@XYZStyle{TEXT}
%%
\newcommand{\rmaa@AffilStyle}[1]{{\normalsize\rmfamily#1}}
\newcommand{\rmaa@PagesStyle}[1]{{\normalsize\rmfamily#1}}
\newcommand{\rmaa@YearStyle}[1]{{\normalsize\rmfamily#1}}
\newcommand{\rmaa@VolumeStyle}[1]{{\normalsize\rmfamily\bfseries#1}}
\newcommand{\rmaa@VolumenStyle}[1]{{\Large\sffamily\bfseries#1}}
\newcommand{\rmaa@JournalNameStyle}[1]{{\normalsize\itshape#1}}
\newcommand{\rmaa@ReceivedStyle}[1]{{\normalsize\rmfamily\itshape#1}}
\newcommand{\rmaa@AbstractHeaderStyle}[1]{%
  {\normalsize\rmfamily\MakeUpperCase{#1}}}
\newcommand{\rmaa@TitleStyle}[1]{%
  {\large\bfseries\rmfamily\boldmath\MakeUpperCase{#1}\par}}
%% Headings of ``front sections''
\newcommand{\rmaa@FrontSecStyle}[1]{%
  {\normalsize\bfseries\rmfamily\MakeUpperCase{#1}}}
%% Commands to set style of TOC and index entries
%% rewritten to avoid unnecessary font commands in the .toc and .ind files
\newcommand{\rmaa@TOCTitleStyle}[1]{\MakeUpperCase{#1}}
\newcommand{\rmaa@TOCPartStyle}[1]{\rmaa@TOCTitleStyle{#1}}
\newcommand{\rmaa@IndexTitleStyle}[1]{#1}
\newcommand{\rmaa@TOCAuthorStyle}[1]{%
%  {\protect\normalsize\mdseries\rmfamily\itshape#1}}
  {\itshape#1}}
\newcommand{\rmaa@IndexAuthorStyle}[1]{%
%  {\protect\normalsize\bfseries\rmfamily#1}}
  {\bfseries#1}}
\if@newstyle
   \newcommand{\rmaa@KeywordStyle}[1]{%
     {\small\bfseries\MakeUpperCase{\raggedright #1}}}
   \newcommand{\rmaa@KeywordHeaderStyle}[1]{%
     {\small\itshape#1}}
\else
   \newcommand{\rmaa@KeywordStyle}[1]{%
     {\normalsize\bfseries\MakeUpperCase{\raggedright #1}}}
   \newcommand{\rmaa@KeywordHeaderStyle}[1]{%
     {\normalsize\itshape#1}}
\fi
%% There are also various spacing parameters 
\newcommand{\rmaa@AuthorWidthFrac}{1.0}
\newcommand{\rmaa@AbstractWidthFrac}{0.75}
%% Wide abstract to save space in the new style
\if@newstyle\renewcommand{\rmaa@AbstractWidthFrac}{1.0}\fi

%% The running headers
% for normal pages
\newcommand{\ps@rmaa}{%
  % nothing in either foot
  \renewcommand\@oddfoot{\relax}%
  \renewcommand\@evenfoot{\relax}%
  % page num and short author list in the even heads
  \renewcommand\@evenhead{\rlap{\thepage}\hfil\@shortauthor\hfil}%
  % short title and page num in the odd heads
  \renewcommand\@oddhead{\hfil\@shorttitle\hfil\llap{\thepage}}
  }
% for the first page of the article
\newcommand{\ps@rmaafirstpage}{%
  \renewcommand\@oddfoot{\hfil\thepage}%
  %% corrected (06 Jun 2000) to have page on outside edge
  \renewcommand\@evenfoot{\thepage\hfil}%
  \renewcommand\@oddhead{\@journalname\hspace*{0.1cm} 
    \if@journal
    \@volume, \@artpages\ 
    \fi
    \if@proceedings
    \@volume, \@artpages\ 
    \fi
    \if@guide
    \textsc{Documentation}
    \fi
    \if@preprint
    \textsc{Preprint}
    \fi
    \if@manuscript
    \textbf{MS\#\@MSnum}\ 
    \fi
    (\@year)\hfil}%
  \renewcommand\@evenhead{\@oddhead}}
% normally use this
\pagestyle{rmaa}
% actually, nothing comes out on the first page - this needs fixing

%% User commands for setting the resumen and abstract. 
%% These should be used in the document header
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modificacion del IIF: Se elije lenguaje espaniol
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\if@setresumen
\newcommand{\resumen}[1]{%
  \renewcommand{\@resumen}{{\selectlanguage{spanish}#1}}%
  \renewcommand{\@resumen}{{#1}}%
  \@setresumentrue}
\renewcommand{\abstract}[1]{%
  \renewcommand{\@abstract}{#1}
  \@abstractpresenttrue
  }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% User commands for affiliation, etcetera
% Principal affiliation. Typeset in italics after the authors
%\newcommand{\affil}[1]{\begin{center}
%    \textit{#1} 
%  \end{center}}

\newcommand{\@rawtitle}{Raw Title}
\newcommand{\@rawauthors}{Raw Authors}
\newcommand{\@TOCtitle}{\rmaa@TOCTitleStyle{Title for TOC}}
\newcommand{\@Indextitle}{\rmaa@IndexTitleStyle{Title for index}.}
\newcommand{\@TOCauthors}{\rmaa@TOCAuthorStyle{Author list for TOC}}
\renewcommand{\title}[1]{%
  \renewcommand{\@rawtitle}{#1}
  \renewcommand{\@title}{\rmaa@TitleStyle{#1}}%
  \renewcommand{\@TOCtitle}{\rmaa@TOCTitleStyle{#1}\@TOCaftertitle}%
  \renewcommand{\@Indextitle}{\rmaa@IndexTitleStyle{#1\@TOCaftertitle}.}%
  }

%% Some user/editor commands for doing the TOC and index in the book option
%% They need to be always defined though to avoid breaking documents
\newcommand{\listofauthors}[1]{%
  \renewcommand{\@rawauthors}{#1}
  \renewcommand{\@TOCauthors}{\rmaa@TOCAuthorStyle{#1}}}
%% IMPORTANT: This command must come AFTER the \title and the \listofauthors commands  
\newcommand{\indexauthor}[1]{% authorindex entry
%  % first get rid of \textlatin commands, wherever they come from  
%  \@ifundefined{org@@roman}{\relax}{\renewcommand{\@roman}[1]{\org@@roman{##1}}}
  % now write the entry
  \index{#1@{\rmaa@IndexAuthorStyle{#1}\hskip1em plus1em minus0.4em 
      \@Indextitle\hskip1em plus2em minus0.4em\penalty-100 \@TOCauthors}}
  }
%% Note that the first #1 sets the key for the index, making sure it actually starts with 
%% first letter of the surname. Meanwhile, the @{...} expression, which starts with some 
%% control sequences is what is written to the .ind file. 
%% See makeindex man page for details. 

\newcommand{\affil}[1]{\\[1.5ex]\rmaa@AffilStyle{#1}\\[1.5ex]}
\renewcommand{\and}{and\\[1.5ex]}
% alternative affiliation is footnoted
\newcommand{\altaffil}{\thanks}
%% Alternative mechanism for alternative affiliations - should not be
%% mixed with \altaffil or there will be problems with numbering
\newcommand{\altaffilmark}[1]{\textsuperscript{#1}}
%\hspace{-0.2em}} 
\newcommand{\altaffiltext}[2]{%
  \stepcounter{footnote}%
  \protected@xdef\@thanks{\@thanks
    \protect\footnotetext[#1]{#2}}} 
\newcommand{\keywords}[1]{%
  \renewcommand{\@keywords}{\rmaa@KeywordStyle{#1}}}
\newcommand{\@keywordheader}{\rmaa@KeywordHeaderStyle{Key Words:}}
%% commands for setting the running headers
\newcommand{\shorttitle}[1]{%
  \renewcommand\@shorttitle{\MakeUpperCase{#1}}}
\newcommand{\shortauthor}[1]{%
  \renewcommand\@shortauthor{\MakeUpperCase{#1}}}

\newlength{\@fulladdheight}
\newlength{\@fulladddepth}
\newsavebox{\@fulladdbox}
% \fulladdresses command modified (11 May 2000) so that we can put
% \fulladdresses{} in the article to suppress the output of the addresses
\newcommand{\fulladdresses}[1]{%
  \renewcommand{\@rmaaArg}{#1}
  \ifx\@rmaaArg\@rmaaEmpty
     \renewcommand{\@fulladdresses}{}
  \else
     \renewcommand{\@fulladdresses}{
       \normalsize\vspace*{1ex}
       %% do addresses as a list (copied from thebibliography environment) 
       \list{\null}{\leftmargin 1.5em\labelwidth\z@\labelsep\z@\itemindent -1.5em
         \itemsep\z@\parsep\z@\usecounter{enumi}}
       \sloppy\clubpenalty4000\widowpenalty4000
       \sfcode`\.=1000\relax
       #1
       \endlist
       }
  \fi
  }
% New command for suppressing full addresses
\newcommand{\suppressfulladdresses}{\@suppressfulladdressestrue\@needaddressesfalse}

%% Default value in each case is to print out a warning if not set
\newcommand{\@resumen}{%
  \@setresumenfalse
  \ClassWarningNoLine{rmaa}{No resumen specified - this will be
    translated by the editors}%
  \textbf{El resumen ser\'a traducido al espa\~nol por los editores.} }
\newcommand{\@abstract}{\ClassWarningNoLine{rmaa}{No abstract specified}}
\newcommand{\@keywords}{%
  \ClassWarningNoLine{rmaa}{No keywords specified}%
  Keywords go here
  }
\newcommand{\@shorttitle}{SHORT TITLE GOES HERE}
\newcommand{\@shortauthor}{SHORT AUTHOR GOES HERE}
\newcommand{\@fulladdresses}{Full addresses go here}

%% These are for the editors to set the volume number, etc
% cunning trick to get the page numbers from \pageref
% Put a label on the first and last page of the document
%% 02 Feb 2000 : this way won't work for the book option. 
%% In that case, we do it by redefining the document environment
\if@book\else
\AtBeginDocument{\label{RMAAFirstPage}}
%% LastPage label is now done in the \@outputaddresses command if we
%% are not in a book style,  or in the \article command if we are
% 
%\AtEndDocument{\@endofarticlehook\null}
\fi
% This is a hook to be run at the end of each article
% currently, it just labels the last page
% It should not produce any printed output
\newcommand{\@endofarticlehook}{\ClassWarning{rmaa}{***Doing Hook***}\label{RMAALastPage}}
	
\newcommand{\SetVolume}[1]{%
  \renewcommand{\@volume}{\rmaa@VolumeStyle{#1}}
  \renewcommand{\@volumen}{\rmaa@VolumenStyle{volumen #1}}%
  }
\newcommand{\SetMSnumber}[1]{\renewcommand{\@MSnum}{#1}}
\newcommand{\SetFirstPage}[1]{\setcounter{page}{#1}}
%\newcommand{\SetPages}[1]{\renewcommand{\@artpages}{\rmaa@PagesStyle{#1}}}
\newcommand{\SetYear}[1]{%
  \renewcommand{\@year}{\rmaa@YearStyle{#1}}
  \renewcommand{\@anyo}{\rmaa@VolumenStyle{#1}}
  }
%% some new commands
\newcommand{\ReceivedDate}[1]{\renewcommand{\@received}{#1}}
\newcommand{\AcceptedDate}[1]{\renewcommand{\@accepted}{#1}}
% default vals for above
\newcommand{\@volume}{\rmaa@VolumeStyle{00}}
\newcommand{\@volumen}{\rmaa@VolumenStyle{00}}
\newcommand{\@artpages}{%
  \rmaa@PagesStyle{\pageref{RMAAFirstPage}--\pageref{RMAALastPage}}}
\newcommand{\@year}{\rmaa@YearStyle{2000}}
\newcommand{\@anyo}{\rmaa@VolumenStyle{2000}}
\newcommand{\@journalname}{\rmaa@JournalNameStyle{%
    \if@proceedings\RMAASClong\else\RMAAlong\fi}}
\newcommand{\@received}{\today}
\newcommand{\@accepted}{\today}
\newcommand{\@MSnum}{000000}

%% Note, we have to redefine the \maketitle command to use the
%% numbered footnotes. This means we needn't use the atbeginend stuff. 
\renewcommand{\maketitle}{\par
  \begingroup
  %% Don't switch to marked footnotes
  %% This is consistent with existing style but I'm not sure I like it
  %%  \renewcommand\thefootnote{\fnsymbol{footnote}}%
%  \def\@makefnmark{\hbox to\z@{$\m@th^{\@thefnmark}$\hss}}%
  \def\@makefnmark{\textsuperscript{\@thefnmark}\hspace{-0.2em}}%
  \long\def\@makefntext##1{\parindent 1em\noindent
    \hbox to1.8em{\hss$\m@th^{\@thefnmark}$}##1}%
  \if@rmtwocol
%     \ifnum \col@number=\@ne
%        \ClassWarning{rmaa}{TWO COLUMN A}
%        \@maketitle
%     \else
        \ClassWarning{rmaa}{TWO COLUMN B}
        \twocolumn[\@maketitle]%
%     \fi
  \else
     \ClassWarning{rmaa}{ONE COLUMN}
     \newpage
     \global\@topnum\z@   % Prevents figures from going at top of page.
     \if@manuscript \@MSmaketitle \else \@maketitle \fi
  \fi
  \if@manuscript\else\thispagestyle{rmaafirstpage}\@thanks\fi
  \endgroup
  %% don't reset footnote counter (not sure whether this is good thing
  %% or not)
  %%  \setcounter{footnote}{0}%
  \let\thanks\relax\let\affil\relax\let\altaffil\relax
  \let\maketitle\relax\let\@maketitle\relax
  \gdef\@thanks{}\gdef\@author{}\gdef\@title{}}

%% Redefine \@maketitle to include the abstract, resumen and keywords
\newlength{\@kwhwidth}\newlength{\@kwtwidth}
\renewcommand{\@maketitle}{%
  \newpage
  \null 
  \vskip 2em%
  \begin{center}%
    {\@title \par}%
    \vskip 1.5em%
    \parbox{\rmaa@AuthorWidthFrac\textwidth}{\centering
      \lineskip .5em%
      \@author
      \par}
    %% this should be replaced with `Submitted to...' for preprints
    %%\if@journal
    %%\rmaa@ReceivedStyle{Recibido \@received; aceptado \@accepted}
    %%\fi
    \if@preprint
    \rmaa@ReceivedStyle{Submitted to RevMexAA \@received}
    \fi
    \if@manuscript
    \rmaa@ReceivedStyle{Submitted to RevMexAA \@received}
    \fi
    \if@guide
    \rmaa@ReceivedStyle{Version \rmaa@version, \rmaa@date}
    \fi
    \vskip 3ex%
    \if@abstractpresent
    \parbox{\rmaa@AbstractWidthFrac\textwidth}{%
      \setlength{\parindent}{0.9cm}%
      \centerline{\rmaa@AbstractHeaderStyle{Resumen}}\par%
      \vskip 1ex%
      \if@newstyle\noindent\fi\@resumen
      \if@setresumen\else\@abstract\fi % append english abstract if
                                       % spanish one not set
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modificacion del IIF: Se quita 'abstract' y 'keywords'.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%      \vskip 2ex%
%      \centerline{\rmaa@AbstractHeaderStyle{Abstract}}\par%
%      \vskip 1ex%
%      \if@newstyle\noindent\fi\@abstract

%      \vskip 1ex%
      % Format the Key Words with hanging indentation:
      % They are put in a \parbox with width equal to the line width
      % minus the width of the header. 
%      { % Widths of keyword
%        \settowidth{\@kwhwidth}{\@keywordheader~}   % header and
%        \setlength{\@kwtwidth}{\linewidth}          % keyword text
%        \addtolength{\@kwtwidth}{-\@kwhwidth}       %
%        \noindent\@keywordheader~\parbox[t]{\@kwtwidth}{\@keywords}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      }
      \fi
  \end{center}%
  \par
  }
\newcommand{\@MSmaketitle}{%
  \newpage
  \thispagestyle{rmaafirstpage}
  \setlength{\parindent}{0pt}
  \null\vskip 2ex
  \begin{center}
    \@title\par
    \@author\par
    \rmaa@ReceivedStyle{Submitted to RevMexAA \@received}\par
  \end{center}
  \@thanks
  \centerline{\rmaa@AbstractHeaderStyle{Resumen}}
  \@resumen\par\vskip 1 ex
  \centerline{\rmaa@AbstractHeaderStyle{Abstract}}
  \@abstract\par\vskip 1ex
  \@keywordheader~\@keywords\par
  }


%% reset the sectioning commands

%% different spacing depending on whether we are in twocolumn mode or not
\if@rmtwocol
\newcommand{\abovesectionskip}{2.5ex \@plus 1ex \@minus .2ex}
\newcommand{\belowsectionskip}{0.5ex \@plus.12ex}
\newcommand{\aboveparaskip}{2.0ex \@plus 1.0ex}
\newcommand{\belowparaskip}{-1em}
\else
\newcommand{\abovesectionskip}{3.5ex \@plus 1ex \@minus .2ex}
\newcommand{\belowsectionskip}{2.3ex \@plus.2ex}
\newcommand{\aboveparaskip}{3.25ex \@plus1ex \@minus.2ex}
\newcommand{\belowparaskip}{-1em}
\fi

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {\abovesectionskip}%
                                   {\belowsectionskip}%
                                   %% how do we get upper case here
                                   {%
%                                     \renewcommand{\sec@upcase}{\uppercase}
                                     \centering\reset@font\normalsize}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {\abovesectionskip}%
                                     {\belowsectionskip}%
                                     {\centering\reset@font\normalsize\itshape}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {\abovesectionskip}%
                                     {\belowsectionskip}%
                                     {\centering\reset@font\normalsize\itshape}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {\aboveparaskip}%
                                    {\belowparaskip}%
                                    {\reset@font\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                      {\aboveparaskip}%
                                      {\belowparaskip}%
                                      {\reset@font\normalsize\bfseries}}

% For subsection and subsubsection, we want the numbers to be roman
% but the title to be italic. This seems the easiest way to go about it.
\renewcommand{\thesubsection}{{\upshape\thesection.\@arabic\c@subsection}}
\renewcommand{\thesubsubsection}{\thesubsection{\upshape.\@arabic\c@subsubsection}}

% add a ``.'' to the number here so we can remove it from \thesection,
% etc. Reduce gap between number and title WJH 27 Jan 1995
%\def\@seccntformat#1{\csname the#1\endcsname\hskip 1em}
\def\@seccntformat#1{\csname the#1\endcsname .\hskip 0.4em}

% mess with the \@sect command to get upper case
\def\@sect#1#2#3#4#5#6[#7]#8{
  \ifnum #2>\c@secnumdepth
     \let\@svsec\@empty
  \else
     \refstepcounter{#1}%
     \let\@@protect\protect
     \def\protect{\noexpand\protect\noexpand}%
     \edef\@svsec{\@seccntformat{#1}}%
     \let\protect\@@protect
  \fi
                                % my bit WJH 27 Jan 1995
  \ifnum #2=1                   % use upper case for \section
     \def\sec@upcase##1{\uppercase{##1}}
  \else                         % use mixed case for the rest 
     \def\sec@upcase##1{\relax{##1}}
  \fi
                                %
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
     \begingroup #6\relax
          \@hangfrom{\hskip #3\relax\@svsec}%
                    {\interlinepenalty \@M \sec@upcase{#8}\par}%
     \endgroup
     \csname #1mark\endcsname{#7}
     \if@guide % only write TOC entries if doing the Guide style
        \addcontentsline{toc}{#1}{%
          \ifnum #2>\c@secnumdepth \else
             \protect\numberline{\csname the#1\endcsname}
          \fi
          #7}%
     \fi
  \else
     \def\@svsechd{#6\hskip #3\relax  %% \relax added 2 May 90
       \@svsec #8\csname #1mark\endcsname{#7}
       \if@guide
          \addcontentsline{toc}{#1}{%
            \ifnum #2>\c@secnumdepth \else
               \protect\numberline{\csname the#1\endcsname}%
            \fi
            #7}%
       \fi
       }%
  \fi
  \@xsect{#5}}


%% Floating things   

% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modificacion del IIF: Se cambiaron 'figura' y 'tabla'.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\thetable}{\@arabic\c@table}
\renewcommand{\thefigure}{\@arabic\c@figure}
\renewcommand{\figurename}{Figura}
\renewcommand{\tablename}{TABLA}
%\renewcommand{\fnum@table}{\MakeUpperCase{\tablename}~\thetable}
% For some reason, I have to write TABLE explicitly here
% If I use \tablename, it gets converted to mixed case - God knows why
% \figurename is also being ignored
\renewcommand{\fnum@table}{TABLA~\thetable}
\renewcommand{\fnum@figure}{Figura~\thefigure}
\long\def\@makefigcap#1#2{%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % do captions in 9 pt face in the main journal style
  \if@proceedings\else\small\fi
  \if@newstyle\small\fi % ditto for new style
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1. #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1. #2 \par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\long\def\@maketabcap#1#2{%
  \hbox to\hsize{\hfil #1 \hfil}
  \vskip 6pt 
  \centering\MakeUpperCase{#2}\par
  \vskip 6pt}
\renewenvironment{figure}
                 {\renewcommand{\@makecaption}{\@makefigcap}\@float{figure}}
                 {\end@float}
\renewenvironment{figure*}
                 {\renewcommand{\@makecaption}{\@makefigcap}\@dblfloat{figure}}
                 {\end@dblfloat}
\renewenvironment{table}
                 {\renewcommand{\@makecaption}{\@maketabcap}\@float{table}}
                 {\end@float}
\renewenvironment{table*}
                 {\renewcommand{\@makecaption}{\@maketabcap}\@dblfloat{table}}
                 {\end@dblfloat}

%% redefine \@caption so that we don't bother with the list of figures
\long\def\@caption#1[#2]#3{%
  \par
%  \addcontentsline{\csname ext@#1\endcsname}{#1}%
%    {\protect\numberline{\csname the#1\endcsname}{\ignorespaces #2}}%
  \begingroup
    \@parboxrestore
    \if@minipage
      \@setminipage
    \fi
    \normalsize
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup}

\renewcommand{\arraystretch}{1.15}
\setlength{\doublerulesep}{0.4pt}

%% Footnotes in tables 
%% user commands \tablenotemark{MARK}, \tablenote{MARK{TEXT}
\newcommand\tablenotemark[1]{$^\mathrm{#1}$} 
\newcommand\tablenote[2]{\if@proceedings\else\small\fi ${}^\mathrm{#1}$ #2} 
\newcommand\tablenoteskip{\\[0.5\baselineskip]} 

%% Alternative way of doing footnotes in tables
\newcommand{\tabnotemark}[1]{\textsuperscript{\lowercase{#1}}}
\newcommand{\tabnotetext}[2]{%
%  \multicolumn{\@tablecols}{p{\tabnotewidth}}{\small\llap{\textsuperscript{#1}}#2}\\}
  \multicolumn{\@tablecols}{p{\tabnotewidth}}{\small\textsuperscript{#1}#2}\\}
\newlength{\tabnotewidth}
\newcommand{\@tablecols}{1}
\newcommand{\tablecols}[1]{\renewcommand{\@tablecols}{#1}}
\newcommand{\tabcaptioncontinued}{%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modificacion del IIF: Se cambia tabla por table
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \multicolumn{\@tablecols}{c}{\addtocounter{table}{-1}TABLA~\thetable\ (continuaci\'on)} \\ \\
  }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% References
\newlength{\beforebiblioskip}
\setlength{\beforebiblioskip}{0pt}
\newlength{\afterbiblioskip}
\setlength{\afterbiblioskip}{0pt}
\newcommand{\ibidrule}{\rule[-0.03cm]{4.7em}{.01cm}.\ } % do the rule for ibid entries
\renewenvironment{thebibliography}{%
%% done as starred section with extra vertical space after heading
  \vspace*{\beforebiblioskip}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modificacion del IIF: Se cambia references por referencias
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \section*{REFERENCIAS} 
  \vspace*{\afterbiblioskip}
%  \vspace*{1.5ex}
  \small
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                % references themselves set as a list
                                % to get the hanging indentation 
  \list{\null}{\leftmargin 1.5em\labelwidth\z@\labelsep\z@\itemindent -1.5em
    \itemsep\z@\parsep\z@\usecounter{enumi}}
  \sloppy\clubpenalty4000\widowpenalty4000
  \sfcode`\.=1000\relax\@biblisttrue}
{\endlist\@biblistfalse\normalsize\@outputaddressesifnecessary}

%% Command to output the addresses if we haven't already done so
\newcommand{\@outputaddressesifnecessary}{%
  \ifthenelse{\boolean{@needaddresses}}{%
    %% If in one column style, or in the first column of a two column
    %% style then we can try to put it on this page 
    \ifthenelse{\boolean{@firstcolumn} \or \not\boolean{@rmtwocol}}{%
      \@outputaddresses}{%
      %% otherwise give warning it will be on a separate page
      \ClassWarning{rmaa}{Full addresses will go on a separate
        page (please see User Guide for how to remedy this)}}%
    %% If we haven't managed yet, put it on its own page
    \ifthenelse{\boolean{@needaddresses}}{%
      \ClassWarning{rmaa}{In this silly bit!}
      \clearpage\vfill\@outputaddresses}{}%
    }{}%
  }  
% A user interface to the above command, in case there is no biblio
% (11 May 2000) 
\newcommand{\outputfulladdresses}{\@outputaddressesifnecessary}

%% This command starts a new column and should be 
%% used to ensure that the columns balance on the last page. It also
%% outputs the full 
%% author addresses to ensure that this occurs in the left hand
%% column. 
%% The \par command is so that the current line will be taken account
%% of when working out \pagetotal
\newcommand{\adjustfinalcols}{\if@twocolumn\goodbreak\@outputaddresses\newpage\noindent\fi}

%% command to do the work of outputting the addresses
\newcommand{\@outputaddresses}{%
  % Allow option of suppressing the full addresses, in which case
  % we just run the hook if we are not in a book style
  \if@suppressfulladdresses
     \if@book\else\@endofarticlehook\fi
  \else
  %% save the full addresses in a box for output later
  \sbox{\@fulladdbox}{\parbox{\textwidth}{\@fulladdresses}}
  % calculate height of address box  
  \settoheight{\@fulladdheight}{\usebox{\@fulladdbox}}
  \settodepth{\@fulladddepth}{\usebox{\@fulladdbox}}
  \addtolength{\@fulladdheight}{\@fulladddepth}
%  \typeout{Address total height: \the\@fulladdheight}
%  \typeout{Text height: \the\pagetotal}
%  \typeout{Goal height: \the\pagegoal}
  % reuse \@fulladdheight to mean the total height of text+addresses
  \addtolength{\@fulladdheight}{\pagetotal}
  % check it will fit on current page
  \ifdim\@fulladdheight<\pagegoal
     %% must shift it to the left
     %% to compensate for the hanging indentation in the reference list. 
     %% NOTE: this is not foolproof!
     %% NB. This will give overfull hbox warnings, which is a bit ugly.
     \vfill\noindent\if@biblist\hspace*{-\leftmargin}\fi
     \usebox{\@fulladdbox}
     % set this to show we've done it
     \@needaddressesfalse
     % and assume we are at the end of the article
     % so that we do the EOA hook if not in the book style
     \if@book\else\@endofarticlehook\fi
  \else
  % if not, just do nothing. With luck, this function will get 
  % called again on the next page
%  \typeout{Holding over full addresses to next page}
  \fi\fi
  }


%%%
%%% Code for typesetting an entire volume of conference proceedings
%%%

%% The uniquifying of cross-references is now always done, so 
%% we don't get multiply-defined labels in the single article case
\newcommand{\articlename}{anon}
\let\oldcite=\cite 
\let\oldnocite=\nocite 
\let\oldref=\ref 
\let\oldpageref=\pageref
\let\oldlabel=\label
%% uniquify all cross-references by prepending the article name
\renewcommand{\ref}[1]{\oldref{\articlename:#1}}
\renewcommand{\pageref}[1]{\oldpageref{\articlename:#1}}
\renewcommand{\label}[1]{\oldlabel{\articlename:#1}}
%% citations are more complicated since can contain a list of keys
\renewcommand{\nocite}[1]{\@bsphack
  \@for\@citeb:=#1\do{%
    \edef\@citeb{\articlename:\expandafter\@firstofone\@citeb}%
    \if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi
    \@ifundefined{b@\@citeb}{\G@refundefinedtrue
      \@latex@warning{Citation `\@citeb' undefined}}{}}%
  \@esphack}
%% This needs doing too 
\renewcommand{\cite}[1]{\oldcite{\articlename:#1}}
\newcommand{\HyperTOCEntry}[3]{\relax}
\newcommand{\HyperTOCpart}[1]{\relax}
\newcommand{\HyperTOCmeeting}[3]{\relax}
\newcommand{\HyperTOCeditors}[1]{\relax}
\newcommand{\HyperTOCpreamble}{\relax}


%%% Horrible fiddling with the bibliography citation mechanism
%%% Put outside \if@book 23 Jan 2001
%% this has to be globally available in case rmaacite puts it in the .aux file
\def\lbibcite#1#2#3{\global\@namedef{b@#1}{#2}
                    \global\@namedef{by@#1}{#3}}
\let\oldbibitem\bibitem
\newcommand{\@rmaaBibArg}{}
\newcommand{\@rmaaSpace}{ }
\newcounter{rmaabib}
%% redefine \bibitem to use articlename: as prefix and use numbers if key not set 
\renewcommand{\bibitem}[1]{%
  \renewcommand{\@rmaaBibArg}{#1}
  \ifx\@rmaaBibArg\@rmaaEmpty
     \addtocounter{rmaabib}{1}
     \oldbibitem{\articlename:\thermaabib}
  \else\ifx\@rmaaBibArg\@rmaaSpace
     \addtocounter{rmaabib}{1}
     \oldbibitem{\articlename:\thermaabib}
  \else 
     \oldbibitem{\articlename:#1}
  \fi\fi
  \renewcommand{\@rmaaBibArg}{}
  }
%% This does the same as the above, but for the rmaacite definition
\newcommand{\@redefinebibitem}{%
  \let\oldbibitem\bibitem
  \let\oldcite\cite
  \let\oldpcite\pcite
  \let\oldscite\scite
  \def\bibitem[##1<##2>]##3{%
    \renewcommand{\@rmaaBibArg}{##3}
    \ifx\@rmaaBibArg\@rmaaEmpty
       \addtocounter{rmaabib}{1}
       \oldbibitem[##1<##2>]{\articlename:\thermaabib}
    \else\ifx\@rmaaBibArg\@rmaaSpace
       \addtocounter{rmaabib}{1}
       \oldbibitem[##1<##2>]{\articlename:\thermaabib}
    \else 
%       \oldbibitem[##1<##2>]{\articlename:##3}
    % trust the author here
       \oldbibitem[##1<##2>]{##3}
    \fi\fi
    }
  }

\if@book
%% environment for including the individual articles
\newcommand{\@fiddleauthors}[2]{\relax}
\renewcommand{\theequation}{\@arabic\c@equation}
\newenvironment{articles}%
{ \begingroup % make it a group so that author definitions do not
              % spill over
  \pagestyle{rmaa}
  \renewenvironment{document}{%
    \label{RMAAFirstPage}%
    \addtocounter{chapter}{1}%
    \addcontentsline{toc}{chapter}{%
      \protect\@fiddleauthors{\@TOCtitle}{\@TOCauthors}}%
    \addtocontents{htc}{\protect\HyperTOCEntry{\@rawtitle}{\@rawauthors}{\articlename}}
    }{\@endofarticlehook\relax}
  \renewcommand{\documentclass}[2][foo]{\relax} 
  \renewcommand{\usepackage}[2][foo]{%
    \def\@packagename{##2}\def\@rmaacitename{rmaacite}%
    \ifx\@packagename\@rmaacitename
    \@rmcitetrue\ClassInfo{rmaa}{This paper uses rmaacite}
    \makeatletter\input{rmaacite.sty}\makeatother % read it in here so that all changes
    \@redefinebibitem % what it says
    \else                                         % are local to paper
    \ClassWarning{rmaa}{Package \@packagename\space was requested by \articlename\space}
    \fi} 
  %% Don't allow individual articles to mess with the pages, volume or year
  \renewcommand{\SetFirstPage}[1]{\relax}
  \renewcommand{\SetYear}[1]{\relax}
  \renewcommand{\SetVolume}[1]{\relax}
  %% Don't allow individual articles to change these
  \renewcommand{\nonstopmode}{\relax}
  \renewcommand{\scrollmode}{\relax}
  \renewcommand{\outputplates}{\relax}
  %% XXXX need to check if using rmaacite and act accordingly
  %% avoid multiple declarations of the same length
  \let\oldnewlength=\newlength
  \renewcommand{\newlength}[1]{%
    \edef\reserved@a{\expandafter\@gobble\string ##1}%
    \@ifundefined{\reserved@a}{%
      \oldnewlength{##1}}{%
      \ClassInfo{rmaa}{\reserved@a\space already defined: doing nothing}%
      \relax}}%
  }%
{\endgroup\onecolumn}
     

\newcommand{\@TOCaftertitle}{}
%% command to be used in `articles' environment for including an article
\newcommand{\article}[2][]{%
  % optional first argument is extra text to put in brackets after title in TOC
  % e.g. ``Invited Talk'' or ``Poster''
  \renewcommand{\articlename}{#2}
  % reset loads of counters
  \setcounter{footnote}{0}
  \setcounter{figure}{0}
  \setcounter{table}{0}
  \setcounter{section}{0}
  \setcounter{equation}{0}
  \setcounter{rmaabib}{0}
  \@rmcitefalse
  \if@suppressfulladdresses\else\@needaddressestrue\fi
  \renewcommand{\@rmaaArg}{#1}
  \ifx\@rmaaArg\@rmaaEmpty
     \renewcommand{\@TOCaftertitle}{}
  \else
     \renewcommand{\@TOCaftertitle}{ (#1)}
% this didn't work for some reason
%     \renewcommand{\@TOCaftertitle}{ (\@rmaaArg{})} 
  \fi
  % Now input the file, then run the end-of-article hook
  {\input{\@articledir/\articlename.tex}\clearpage}}
%% Command to separate articles into sessions
\newcommand{\session}[1]{
  %% this does nothing except write an entry in the TOC
  \addcontentsline{toc}{part}{\rmaa@TOCPartStyle{#1}}
  \addtocontents{htc}{\protect\HyperTOCpart{#1}}
  %% and also makes sure we start on an odd page (added 06 Jun 2000)
  \clearpage\thispagestyle{empty}\cleardoublepage
  }
\newcommand{\BoldSessionTitles}{%
  \renewcommand{\rmaa@TOCPartStyle}[1]{\textbf{\rmaa@TOCTitleStyle{##1}}}
  }
\newcommand{\@reunionplace}{Lugar de la reuni\'on}
\newcommand{\@reuniondate}{Fecha de la reuni\'on}
\newcommand{\@conftitle}{Conference Title}
\newcommand{\SetReunion}[2]{\renewcommand{\@reunionplace}{#1}\renewcommand{\@reuniondate}{#2}}
\newcommand{\SetConfTitle}[1]{\renewcommand{\@conftitle}{#1}}
\newcommand{\@editors}{Juan Ram\'on de la Fuente and ``El Mosh''}
\newcommand{\SetEditors}[1]{\renewcommand{\@editors}{#1}}
\newcommand{\@editores}{Juan Ram\'on de la Fuente y ``El Mosh''}
\newcommand{\SetEditores}[1]{\renewcommand{\@editores}{#1}}
\newcommand{\@mes}{mes de la publicaci\'on}
\newcommand{\SetMes}[1]{\renewcommand{\@mes}{\rmaa@VolumenStyle{#1}}}
\newcommand{\ArticleDir}[1]{\renewcommand{\@articledir}{#1/}\graphicspath{{1/}}}
\newcommand{\@articledir}{.}
%\newcommand{\ps@rmaafront}{\ps@rmaa}% page style for front matter (same as ever, actually)
\newcommand{\ps@rmaafront}{% page style for front matter:  page # in each foot
  \renewcommand\@oddfoot{\hfil{\thepage}}%
  \renewcommand\@evenfoot{{\thepage}\hfil}%
  % shorttitle in both heads
  \renewcommand\@evenhead{\hfil\@shorttitle\hfil}%
  \renewcommand\@oddhead{\@evenhead}
  }
\newcommand{\ps@rmaafrontfirstpage}{% page style for first page of front matter
  % page # in each foot, on outside edge
  \renewcommand\@oddfoot{\hfil\thepage}%
  \renewcommand\@evenfoot{\thepage\hfil}%
  % nothing in the even heads
  \renewcommand\@evenhead{\relax}%
  \renewcommand\@oddhead{\relax}%
  }
%% slight modification to the standard \frontmatter and \mainmatter
%% commands, just to set the \pagestyle
\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}
  \pagestyle{rmaafront}
  \addtocounter{page}{2} % leave space for the title page
  }
\renewcommand\mainmatter{%
  \pagestyle{empty}
  \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{rmaa}
  }
\renewcommand\backmatter{%
  \clearpage\pagestyle{empty}\cleardoublepage
  \@mainmatterfalse
  %% put extra space in the TOC
  \addtocontents{toc}{\bigskip}
  }
%% Environment for doing a section in the front matter
%% One optional argument:   #1 = short title (no embedded spaces) for use in making PS files
%% Two mandatory arguments: #2 = title of section (e.g. `Preface')
%%                          #3 = commands to be evaluated before starting
%%                               (e.g. \listofauthors, \authorindex, \notitle)
\newcommand{\notitle}{\@titlevisiblefalse}
\newcommand{\shortname}{}
\newenvironment{frontsection}[3][]{%
  \begingroup
  \renewcommand{\shortname}{#1}
  \ifx\shortname\@rmaaEmpty
     \renewcommand{\articlename}{#2}
  \else
     \renewcommand{\articlename}{\shortname}
  \fi
  \frontlabel{RMAAFirstPage}
  \@titlevisibletrue % default
  \thispagestyle{rmaafrontfirstpage}
  \listofauthors{} % blank out this in case it is not specified
  \title{{\protect\normalsize #2}}\shorttitle{#2}\shortauthor{#2}
  #3 % evaluate the command given as second mandatory arg
  \addcontentsline{toc}{chapter}{\protect\@fiddleauthors{\@TOCtitle}{\@TOCauthors}}%
  \addtocontents{htc}{\protect\HyperTOCEntry{\@rawtitle}{\@rawauthors}{\articlename}}
  \if@titlevisible
     \vspace*{1cm}\centerline{\rmaa@FrontSecStyle{\@title}}\vspace*{1cm}
  \fi
  \setlength{\parskip}{3ex}
  }{\frontlabel{RMAALastPage}\clearpage\endgroup}
%% Definition of the command \frontlabel, which rights out something like `F4' to
%% the .aux file, instead of `\textlatin  {i}'. This is so it is easy to post-process
%% the file for making PS files of individual sections
\newcommand{\frontlabel}[1]{%
  \@bsphack
  \protected@write\@auxout{}%
     {\string\newlabel{\articlename:#1}{{}{F\@arabic{\c@page}}}}
  \@esphack
  }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modificacion del IIF: editors of the... por Editores de la revista ...
%% User command to say X, Y, Z,\\ Editors of the Proceedings
\newcommand{\EditorSignature}{\vspace*{\parskip}\rightline{\@editors}%
  \rightline{Editores}}
%% Fiddle with \thesection, etc. so that they don't include the chapter number
%% Basically go back to the `article' definitions of these
\renewcommand{\thesection}{\@arabic\c@section}
\renewcommand{\thefigure}{\@arabic\c@figure}
\renewcommand{\thetable}{\@arabic\c@table}

\newcommand{\@oldargs}{}
\newcommand{\@newargs}{}
%% add TOC entry for each paper
%\renewcommand{\title}[1]%
%{\renewcommand{\@title}{\rmaa@TitleStyle{#1}}%
%\addtocounter{chapter}{1}\addcontentsline{toc}{chapter}{#1}%
%}

%% Formatting of the table of contents
% dimensions of various parts
\newlength{\TOCtextwidth}\setlength{\TOCtextwidth}{12.65cm}
\newlength{\TOCpagenumwidth}\setlength{\TOCpagenumwidth}{1.3cm}
\newlength{\TOCentrywidth}\setlength{\TOCentrywidth}{\TOCtextwidth}
\addtolength{\TOCentrywidth}{-\TOCpagenumwidth} 
\newlength{\TOCextramargin}\setlength{\TOCextramargin}{1.25cm}
\newcommand{\TOCbox}[1]{\hspace{\TOCextramargin}\parbox{\TOCtextwidth}{#1}\par}
\newlength{\TOCextramarginx}\setlength{\TOCextramarginx}{\TOCextramargin}\addtolength{\TOCextramarginx}{4.3cm}
\newlength{\TOCtextwidthx}\setlength{\TOCtextwidthx}{\TOCtextwidth}\addtolength{\TOCtextwidthx}{-4.3cm}
\newcommand{\TOCboxx}[1]{\hspace{\TOCextramarginx}\parbox{\TOCtextwidthx}{#1}\par}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modificacion del IIF: Aqui deberia cambiarse por rbfi.ps.
% Se cambia contents por contenido.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\RMAAbannerimage}{rmsc.ps}
\renewcommand\tableofcontents{%
  \renewcommand{\articlename}{CONTENIDO}
  \begingroup
  \frontlabel{RMAAFirstPage}
  \if@twocolumn
     \@restonecoltrue\onecolumn
  \else
     \@restonecolfalse
  \fi
  %% 9pt for journal style
  \if@proceedings\else\small\fi
  \if@newstyle\small\fi %% same for new style
  \thispagestyle{rmaafrontfirstpage}
  \shortauthor{Contenido}\shorttitle{Contenido}
  \vspace*{18mm}
  \if@printbanner
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %% put in the banner header (need to get better image of this)
     \TOCbox{\hspace*{-0.15cm}\includegraphics[width=0.1\TOCtextwidth]{\RMAAbannerimage}}
     \vspace*{8mm}
  %% volume and publication date (should really be in funny font)
     \TOCboxx{\@volumen\\[2mm] \@mes\ \@anyo}
  \else
  %% put in the banner header (need to get better image of this)
     \TOCbox{\hspace*{-0.15cm}\includegraphics[width=0.1\TOCtextwidth]{\RMAAbannerimage}}
     \vspace*{12.5mm}
  %% volume and publication date (should really be in funny font)
     \TOCboxx{~\\[2mm] ~}
  \fi
  \vspace*{16mm}
  %% This is the command that fiddles with the TOC entry so that the
  %% title is flushleft but the authors are flushright
  \renewcommand{\@fiddleauthors}[2]{%
    % first put the paper title
    \renewcommand{\\}{\relax} % temporarily turn off explicit line breaks just in case
    \renewcommand{\altaffilmark}[1]{\relax} % ditto with this
    \renewcommand{\textsuperscript}[1]{\relax} % ditto with this 
    ##1
    % now save the author list in a box
    \sbox\@tempboxa{##2}%
    % check that box is shorter than the total width available for the entry
    \ifdim \wd\@tempboxa <\TOCentrywidth
       % if so, then put it right here, flush against right margin
       \penalty10000\hskip1em plus10em\penalty0\hbox{}\nobreak\hfill\box\@tempboxa
       % Note that we force a space of at least 1em between title and authorlist, 
       % stretchable to 11em since we may have very short titles but still with an 
       % authorlist too long to go on the same line.  The only linebreak allowed is 
       % directly before the authorlist.
    \else
       % if it is too long, we set the original authorlist text in its own parbox
       \par\vskip1ex\parbox[b]{\TOCentrywidth}{\raggedleft ##2}
    \fi
    }
  \@starttoc{toc}%
  \if@restonecol\twocolumn\fi
  \frontlabel{RMAALastPage}
  \clearpage
  \thispagestyle{empty}
  \cleardoublepage % make sure we start on an odd page
  \endgroup

  %%% ALSO, do the HTML TOC
  %% The file that will be used to make the HTML TOC
  \@starttoc{htc}
  %% All the stuff in this file does nothing in the book style
  \addtocontents{htc}{\protect\HyperTOCmeeting{\@conftitle}{\@reunionplace}{\@reuniondate}}
  \addtocontents{htc}{\protect\HyperTOCeditors{\@editors}}
  \addtocontents{htc}{\protect\HyperTOCpreamble}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modificacion del IIF: Table of.. por Indice.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \addtocontents{htc}{\protect\HyperTOCEntry{Indice}{}{\articlename}}

  }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This is now much simpler
\renewcommand\l@chapter[2]{%TOC entry for articles
  \ifnum \c@tocdepth >\m@ne
    \vskip 1.0em \@plus\p@
    \TOCbox{%
      \parbox[b]{\TOCentrywidth}{#1}\parbox[b]{\TOCpagenumwidth}{\hfill#2}
    }
  \fi} 
\renewcommand\l@part[2]{%TOC entry for sessions: centered, no page number
  \ifnum \c@tocdepth >\m@ne
    \vskip 1.5em \@plus1.5em \goodbreak
    \TOCbox{%
      \parbox[b]{\TOCentrywidth}{\hfil#1\hfil}\hfill
    }
  \fi\nobreak} 

\newcommand{\@makeminititle}{%
  \newpage
  \null 
  \vskip 3em%
  \begin{center}%
    {\@title \par}%
  \end{center}
  \vskip 3em%
  }

%% Formatting theindex
% strongly encourage page breaks between index entries
\renewcommand{\@idxitem}{\par\penalty-1000\hangindent.45cm} 
\renewcommand{\indexspace}{\par\penalty-1000\vskip 10\p@ \@plus15\p@ \@minus3\p@\relax}
\renewenvironment{theindex}{%
  %% first, make sure we start on an odd page (06 Jun 2000)
  \clearpage\thispagestyle{empty}\cleardoublepage
  %% this looks a bit like an article but is two columns and without abstract, etc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modificacion del IIF: Index por indice
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \renewcommand{\articlename}{INDICE}
  \title{{\protect\normalsize Author Index}}\shortauthor{Indice por Autor}\shorttitle{Indice por Autor}
  \listofauthors{}
  \addcontentsline{toc}{chapter}{\protect\@fiddleauthors{\@TOCtitle}{\@TOCauthors}}%
  \addtocontents{htc}{\protect\HyperTOCEntry{\@rawtitle}{\@rawauthors}{\articlename}}
  \thispagestyle{rmaafirstpage}
  %% 9pt for journal style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \if@proceedings\else\small\fi
  \if@newstyle\small\fi
  \twocolumn[\@makeminititle]
  \label{RMAAFirstPage}
  %% vertical spacing (see also definition of \@idxitem and \indexspace
  \parskip\z@ \@plus .6\p@\relax % allow quite a lot of leaway here to avoid breaks inside entries
  %% horizontal spacing, breaking and glue parameters (see also the stuff in the definition 
  %% of \indexauthor
  \parindent\z@ 
  \exhyphenpenalty10000 % don't break on explicit hyphens, it always looks bad
  \rightskip=0pt plus.2em % allow a tiny bit of leeway at the ends of lines
  \spaceskip.3333em plus.5em minus.15em % a lot of leeway between words
  \xspaceskip.5em plus.5em minus.4em % this seems to have no effect
  \let\item\@idxitem
  \renewcommand{\\}{\relax} % temporarily turn off explicit line breaks just in case
  \renewcommand{\altaffilmark}[1]{\relax} % ditto with this
  \renewcommand{\textsuperscript}[1]{\relax} % ditto with this
  }{\label{RMAALastPage}\clearpage} % clearpage necessary so that we know about \shortauthor

%% Formatting the poster abstracts 
\RequirePackage{multicol}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modificacion del IIF: Abstracts... por resumenes...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{abstracts}[1][Abstracts of Contributed Papers]{%
  %% First, make sure we start on an odd page (06 Jun 2000)
  \clearpage\thispagestyle{empty}\cleardoublepage
  %%
  \renewcommand{\articlename}{Res\'umenes}
  \title{#1}\shortauthor{Res\'umenes}\shorttitle{Res\'umenes}
  \listofauthors{}
  \addcontentsline{toc}{chapter}{\protect\@fiddleauthors{\@TOCtitle}{\@TOCauthors}}%
  \addtocontents{htc}{\protect\HyperTOCEntry{\@rawtitle}{\@rawauthors}{\articlename}}
  \pagestyle{rmaa} % this now seems necessary (06 Jun 2000)
  \thispagestyle{rmaafirstpage}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  \twocolumn[\@makeminititle]
  \label{RMAAFirstPage}
  \renewcommand{\abstract}[1]{\renewcommand{\@abstract}{##1}\@writeabstract}
  \renewcommand{\title}[2][]{%
    \renewcommand{\@rmaaArg}{##1}
    \ifx\@rmaaArg\@rmaaEmpty
       \renewcommand{\@TOCaftertitle}{}
    \else
       \renewcommand{\@TOCaftertitle}{ (\@rmaaArg)}
    \fi
    \renewcommand{\@title}{\rmaa@TOCTitleStyle{##2}}%
    \renewcommand{\@TOCtitle}{\rmaa@TOCTitleStyle{##2}\@TOCaftertitle}%
    \renewcommand{\@Indextitle}{\rmaa@IndexTitleStyle{##2\@TOCaftertitle.}}%
    }
  \renewcommand{\author}[1]{\let\@thanks\@empty \renewcommand\@author{##1} }
  \renewcommand{\footnotetext}[2][XX]{\par\noindent\textsuperscript{##1}~##2}
  \renewcommand{\footnoterule}{\kern-3\p@ \hrule \@width 3em \kern 2.6\p@}
  \begin{multicols}{2}[\@makeminititle]
  \begingroup
  \setcounter{footnote}{0}
  }% and at the end of the environment....
{\label{RMAALastPage}\endgroup\end{multicols}
\listofabstracts\clearpage}
%% auxiliary commands used:
%% \@writeabstract does all the actual formatting 
\newcommand{\@writeabstract}{%
  \addcontentsline{loa}{abstract}{\protect\@fiddleauthors{\@TOCtitle}{\@TOCauthors}}%
  \begin{center}\@title\par\@author\end{center}
  \@abstract
  \par\noindent\footnoterule\nobreak\footnotesize\@thanks
  \par\noindent\hrulefill\goodbreak
  \vskip 1cm \@plus0.5cm
  \endgroup % this pair is to make each abstract a self-contained group
  \begingroup
  \setcounter{footnote}{0}
  }
%% List of abstracts (stuff written to .loa file)
\newcommand{\listofabstracts}{%
  \begin{multicols}{2}[%
    \vskip 1.5cm \vfill % leave at least 1.5 cm and go to bottom of page if possible
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modificacion del IIF: List... por lista...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    \centerline{\MakeUpperCase{Lista de Res\'umenes}}
    \vskip 1.5cm \@plus0.5cm
    ][6cm] % this makes it start a new page if there is not at least 6cm of space
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    \renewcommand{\@fiddleauthors}[2]{##1\hskip1em plus2em minus0.4em\penalty-100  ##2}
    \parindent\z@
%    \parskip.5\p@ \@plus .7\p@\relax % allow quite a lot of leaway here to avoid breaks inside entries
    \parskip3\p@ \@plus 1\p@ \@minus 1\p@\relax % allow quite a lot of leaway here to avoid breaks inside entries
    \renewcommand{\\}{\relax} % temporarily turn off explicit line breaks just in case
    \renewcommand{\altaffilmark}[1]{\relax} % ditto with this
    \@starttoc{loa}
  \end{multicols}
  }
\newcommand*{\l@abstract}[2]{%
  \par\penalty-1000
  #1\hskip 1em\penalty0\null\nobreak\hfill#2}



%% end definitions for book styles
\fi


%% Plates
%% Define 2 counters: plate is the number in the whole document, plateloop is used 
%% internally by \outputplates
\newcounter{plate}
\newcounter{plateloop}
%% Currently limited to 15 plates in document
% when we do a label, we need to write to \newlabel entries to the .aux file, one 
% that says RMAAPlateX so that it can be referred to in \ouputplates, and one that
% says articlename:RMAAPlateX so that the dvips program can find it and asociate it
% with the right article
\newcommand{\@platelabeli}{\oldlabel{RMAAPlate1}\label{RMAAPlate1}}
\newcommand{\@platelabelii}{\oldlabel{RMAAPlate2}\label{RMAAPlate2}}
\newcommand{\@platelabeliii}{\oldlabel{RMAAPlate3}\label{RMAAPlate3}}
\newcommand{\@platelabeliv}{\oldlabel{RMAAPlate4}\label{RMAAPlate4}}
\newcommand{\@platelabelv}{\oldlabel{RMAAPlate5}\label{RMAAPlate5}}
\newcommand{\@platelabelvi}{\oldlabel{RMAAPlate6}\label{RMAAPlate6}}
\newcommand{\@platelabelvii}{\oldlabel{RMAAPlate7}\label{RMAAPlate7}}
\newcommand{\@platelabelviii}{\oldlabel{RMAAPlate8}\label{RMAAPlate8}}
\newcommand{\@platelabelix}{\oldlabel{RMAAPlate9}\label{RMAAPlate9}}
\newcommand{\@platelabelx}{\oldlabel{RMAAPlate10}\label{RMAAPlate10}}
\newcommand{\@platelabelxi}{\oldlabel{RMAAPlate11}\label{RMAAPlate11}}
\newcommand{\@platelabelxii}{\oldlabel{RMAAPlate12}\label{RMAAPlate12}}
\newcommand{\@platelabelxiii}{\oldlabel{RMAAPlate13}\label{RMAAPlate13}}
\newcommand{\@platelabelxiv}{\oldlabel{RMAAPlate14}\label{RMAAPlate14}}
\newcommand{\@platelabelxv}{\oldlabel{RMAAPlate15}\label{RMAAPlate15}}
\newcommand{\@outputplatelabeli}{\oldlabel{RMAAOutputPlate1}}
\newcommand{\@outputplatelabelii}{\oldlabel{RMAAOutputPlate2}}
\newcommand{\@outputplatelabeliii}{\oldlabel{RMAAOutputPlate3}}
\newcommand{\@outputplatelabeliv}{\oldlabel{RMAAOutputPlate4}}
\newcommand{\@outputplatelabelv}{\oldlabel{RMAAOutputPlate5}}
\newcommand{\@outputplatelabelvi}{\oldlabel{RMAAOutputPlate6}}
\newcommand{\@outputplatelabelvii}{\oldlabel{RMAAOutputPlate7}}
\newcommand{\@outputplatelabelviii}{\oldlabel{RMAAOutputPlate8}}
\newcommand{\@outputplatelabelix}{\oldlabel{RMAAOutputPlate9}}
\newcommand{\@outputplatelabelx}{\oldlabel{RMAAOutputPlate10}}
\newcommand{\@outputplatelabelxi}{\oldlabel{RMAAOutputPlate11}}
\newcommand{\@outputplatelabelxii}{\oldlabel{RMAAOutputPlate12}}
\newcommand{\@outputplatelabelxiii}{\oldlabel{RMAAOutputPlate13}}
\newcommand{\@outputplatelabelxiv}{\oldlabel{RMAAOutputPlate14}}
\newcommand{\@outputplatelabelxv}{\oldlabel{RMAAOutputPlate15}}
\newcommand{\@platerefi}{\oldpageref{RMAAPlate1}}
\newcommand{\@platerefii}{\oldpageref{RMAAPlate2}}
\newcommand{\@platerefiii}{\oldpageref{RMAAPlate3}}
\newcommand{\@platerefiv}{\oldpageref{RMAAPlate4}}
\newcommand{\@platerefv}{\oldpageref{RMAAPlate5}}
\newcommand{\@platerefvi}{\oldpageref{RMAAPlate6}}
\newcommand{\@platerefvii}{\oldpageref{RMAAPlate7}}
\newcommand{\@platerefviii}{\oldpageref{RMAAPlate8}}
\newcommand{\@platerefix}{\oldpageref{RMAAPlate9}}
\newcommand{\@platerefx}{\oldpageref{RMAAPlate10}}
\newcommand{\@platerefxi}{\oldpageref{RMAAPlate11}}
\newcommand{\@platerefxii}{\oldpageref{RMAAPlate12}}
\newcommand{\@platerefxiii}{\oldpageref{RMAAPlate13}}
\newcommand{\@platerefxiv}{\oldpageref{RMAAPlate14}}
\newcommand{\@platerefxv}{\oldpageref{RMAAPlate15}}
\newcounter{figplatei}
\newcounter{figplateii}
\newcounter{figplateiii}
\newcounter{figplateiv}
\newcounter{figplatev}
\newcounter{figplatevi}
\newcounter{figplatevii}
\newcounter{figplateviii}
\newcounter{figplateix}
\newcounter{figplatex}
\newcounter{figplatexi}
\newcounter{figplatexii}
\newcounter{figplatexiii}
\newcounter{figplatexiv}
\newcounter{figplatexv}
%% Printed output should use the counter `plate'
\renewcommand{\theplate}{\@arabic\c@plate}
\renewcommand{\theplateloop}{\@arabic\c@plateloop}
%% Command to output all the saved plates in this paper
\newcommand{\outputplates}{%
  \setcounter{plateloop}{0}
  \if@book\else\@endofarticlehook\fi % not entirely sure why, but this
                                     % seems to be needed
  \clearpage % first output the last page of text
  % now set pagestyle for blank even pages and make sure we start on an odd page
  \pagestyle{empty}
  \cleardoublepage
  \onecolumn
  \parindent\z@
  % first put in an extra sheet
  % the main purpose of this is so there is always a blank even page before 
  % each plate for filling in the PS file if the article has an odd number
  % of pages (see splitbook.sh)
  \null\vfil\centerline{PLATES}\vfil\clearpage\pagestyle{rmaaplate}\cleardoublepage
  % output each plate in turn
  \@whilenum\value{plateloop}<\value{plate}\do{%
    \addtocounter{plateloop}{1}
    % restore the figure counter from \@figcounti, \@figcountii, etc
    \setcounter{figure}{\value{figplate\roman{plateloop}}}
    % spew out the plate (in its own group for safety)
    {\csname @plate\roman{plateloop}\endcsname\par}
    }
  \pagestyle{rmaa}
  % reset the page number as if nothing had happened
  \addtocounter{page}{-\value{plate}}
  \addtocounter{page}{-\value{plate}}
  }
\newcommand\figcaption{%
  \def\@captype{figure}
  \renewcommand{\@makecaption}{\@makefigcap}
  \caption}
\newcommand\tabcaption{%
  \def\@captype{table}
  \renewcommand{\@makecaption}{\@maketabcap}
  \caption}

\newcommand{\plate}[2][1]{%
  %% User command to make a plate page: 
  %% Mandatory argument is what goes on the plate - this should not 
  %% include any floating environments (e.g. figure). Instead, \figcaption 
  %% should be used to do the captions. 
  %% Optional argument is the number of figures (i.e. captions) on the plate
  %% page (default is 1). This is necessary for incrementing the figure counter. 
  %%
  %% Note that we have to use a \gdef rather than an \xdef when we 
  %% save the plate output in a command. This means that in the book styles when it 
  %% comes to spewing out the plate, we will have forgotten about any user macros 
  %% that may have been defined. This can be got round by repeating the macros inside the plate.
  %% (Presumably, one would use a \newcommand rather than \renewcommand if they were new.)
  % increment global and local counters
  \addtocounter{plate}{1}
  % write appropriate label to .aux file
  \csname @platelabel\roman{plate}\endcsname
  % define a global macro called \@platei, \@plateii, \@plateiii, \@plateiv, ...
  \expandafter\gdef\csname @plate\roman{plate}\endcsname{%
    \csname @outputplatelabel\roman{plateloop}\endcsname
    \null\vfil #2 \vfil
    \cleardoublepage
    }
  % save the current shortauthor and shorttitle
  % need to be \xdef to take current values of \@shortauthor, etc 
  \expandafter\xdef\csname @shorta\roman{plate}\endcsname{\@shortauthor}
  \expandafter\xdef\csname @shortt\roman{plate}\endcsname{\@shorttitle}
  % save the current value of the figure counter for later use in \outputplates
  \setcounter{figplate\roman{plate}}{\value{figure}}
  % increment the figure counter according to the optional argument
  \addtocounter{figure}{#1}
  }
% page style for plate pages 
\newcommand{\ps@rmaaplate}{%
  % Plate X (see page Y) in the foot
  \renewcommand\@oddfoot{\hfil\csname @shorta\roman{plateloop}\endcsname\ 
    (see page~\csname @plateref\roman{plateloop}\endcsname)\hfil}%
  \renewcommand\@evenfoot{\relax}%
  % nothing in even heads (blank pages)
  \renewcommand\@evenhead{\relax}
  % short title and page num in the odd heads
  \renewcommand\@oddhead{\hfil\csname @shortt\roman{plateloop}\endcsname%
    \hfil\llap{PLATE~\theplateloop}}
  }



%% some random definitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modificacion del IIF: Cambio del nombre
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\RMAA}{Revista Boliviana de F\'{\i}sica}
\newcommand{\RMAAlong}{Revista Boliviana de F\'{\i}sica}
\newcommand{\RMAASC}{Revista Boliviana de F\'{\i}sica(SC)}
\newcommand{\RMAASClong}{\RMAA}

%\usepackage{rmaaextr}

%% Various new commands from AAS macros
\def\acknowledgments{\vskip 3ex plus .8ex minus .4ex}
\let\acknowledgements=\acknowledgments                  % second spelling

\let\jnl@style=\rm
\def\ref@jnl#1{{\jnl@style#1}}
\def\aj{\ref@jnl{AJ}}                   
\def\araa{\ref@jnl{ARA\&A}}             
\def\apj{\ref@jnl{ApJ}}                 
\def\apjl{\ref@jnl{ApJ}}                
\def\apjs{\ref@jnl{ApJS}}               
\def\ao{\ref@jnl{Appl.~Opt.}}           
\def\apss{\ref@jnl{Ap\&SS}}             
\def\aap{\ref@jnl{A\&A}}                
\def\aapr{\ref@jnl{A\&A~Rev.}}          
\def\aaps{\ref@jnl{A\&AS}}              
\def\azh{\ref@jnl{AZh}}                 
\def\baas{\ref@jnl{BAAS}}               
\def\jrasc{\ref@jnl{JRASC}}             
\def\memras{\ref@jnl{MmRAS}}            
\def\mnras{\ref@jnl{MNRAS}}             
\def\pra{\ref@jnl{Phys.~Rev.~A}}        
\def\prb{\ref@jnl{Phys.~Rev.~B}}        
\def\prc{\ref@jnl{Phys.~Rev.~C}}        
\def\prd{\ref@jnl{Phys.~Rev.~D}}        
\def\pre{\ref@jnl{Phys.~Rev.~E}}        
\def\prl{\ref@jnl{Phys.~Rev.~Lett.}}    
\def\pasp{\ref@jnl{PASP}}               
\def\pasj{\ref@jnl{PASJ}}               
\def\qjras{\ref@jnl{QJRAS}}             
\def\skytel{\ref@jnl{S\&T}}             
\def\solphys{\ref@jnl{Sol.~Phys.}}      
\def\sovast{\ref@jnl{Soviet~Ast.}}      
\def\ssr{\ref@jnl{Space~Sci.~Rev.}}     
\def\zap{\ref@jnl{ZAp}}                 
\def\nat{\ref@jnl{Nature}}              
\def\iaucirc{\ref@jnl{IAU~Circ.}}
\def\aplett{\ref@jnl{Astrophys.~Lett.}}
\def\apspr{\ref@jnl{Astrophys.~Space~Phys.~Res.}}
\def\bain{\ref@jnl{Bull.~Astron.~Inst.~Netherlands}}
\def\fcp{\ref@jnl{Fund.~Cosmic~Phys.}}
\def\gca{\ref@jnl{Geochim.~Cosmochim.~Acta}}
\def\grl{\ref@jnl{Geophys.~Res.~Lett.}}
\def\jcp{\ref@jnl{J.~Chem.~Phys.}}      
\def\jgr{\ref@jnl{J.~Geophys.~Res.}}    
\def\jqsrt{\ref@jnl{J.~Quant.~Spec.~Radiat.~Transf.}}
\def\memsai{\ref@jnl{Mem.~Soc.~Astron.~Italiana}}
\def\nphysa{\ref@jnl{Nucl.~Phys.~A}}
\def\physrep{\ref@jnl{Phys.~Rep.}}
\def\physscr{\ref@jnl{Phys.~Scr}}
\def\planss{\ref@jnl{Planet.~Space~Sci.}}
\def\procspie{\ref@jnl{Proc.~SPIE}}
\let\astap=\aap
\let\apjlett=\apjl
\let\apjsupp=\apjs
\let\applopt=\ao
\def\phn{\phantom{0}}
\def\phd{\phantom{.}}
\def\phs{\phantom{$-$}}
\def\phm#1{\phantom{#1}}
\def\sun{\hbox{$\odot$}}
\def\earth{\hbox{$\oplus$}}
\def\lesssim{\mathrel{\hbox{\rlap{\hbox{\lower4pt\hbox{$\sim$}}}\hbox{$<$}}}}
\def\gtrsim{\mathrel{\hbox{\rlap{\hbox{\lower4pt\hbox{$\sim$}}}\hbox{$>$}}}}
\def\sq{\hbox{\rlap{$\sqcap$}$\sqcup$}}
\def\arcdeg{\hbox{$^\circ$}}
\def\arcmin{\hbox{$^\prime$}}
\def\arcsec{\hbox{$^{\prime\prime}$}}
\def\fd{\hbox{$.\!\!^{\rm d}$}}
\def\fh{\hbox{$.\!\!^{\rm h}$}}
\def\fm{\hbox{$.\!\!^{\rm m}$}}
\def\fs{\hbox{$.\!\!^{\rm s}$}}
\def\fdg{\hbox{$.\!\!^\circ$}}
\def\farcm{\hbox{$.\mkern-4mu^\prime$}}
\def\farcs{\hbox{$.\!\!^{\prime\prime}$}}
\def\fp{\hbox{$.\!\!^{\scriptscriptstyle\rm p}$}}
\def\micron{\hbox{$\mu$m}}
\let\la=\lesssim                        
\let\ga=\gtrsim
\def\case#1#2{\hbox{$\frac{#1}{#2}$}}
\def\slantfrac#1#2{\hbox{$\,^#1\!/_#2$}}
\def\onehalf{\slantfrac{1}{2}}
\def\onethird{\slantfrac{1}{3}}
\def\twothirds{\slantfrac{2}{3}}
\def\onequarter{\slantfrac{1}{4}}
\def\threequarters{\slantfrac{3}{4}}
\def\ubvr{\hbox{$U\!BV\!R$}}            
\def\ub{\hbox{$U\!-\!B$}}               
\def\bv{\hbox{$B\!-\!V$}}               
\def\vr{\hbox{$V\!-\!R$}}               
\def\ur{\hbox{$U\!-\!R$}}
%% New version of the \ion command, that actually works! 
\DeclareRobustCommand\ion[2]{\mbox{#1\kern0.2em \smaller\rmfamily\@Roman{#2}}}
%\def\ion#1#2{\ensuremath{\mathrm{#1}\;}{\protect\small\rm\@Roman{#2}}}
\def\nodata{ ~$\cdots$~ }

\let\@small=\small
\let\@normalsize=\normalsize
\let\@footnotesize=\footnotesize
\let\@scriptsize=\scriptsize
\let\@tiny=\tiny
\let\@large=\large
\let\@Large=\Large
\let\@LARGE=\LARGE
\let\@huge=\huge
\let\@Huge=\Huge

\newcommand{\smaller}{\small}
\renewcommand{\normalsize}{\renewcommand{\smaller}{\small}\@normalsize}
\renewcommand{\small}{\renewcommand{\smaller}{\footnotesize}\@small}
\renewcommand{\footnotesize}{\renewcommand{\smaller}{\scriptsize}\@footnotesize}
\renewcommand{\scriptsize}{\renewcommand{\smaller}{\tiny}\@scriptsize}
\renewcommand{\tiny}{\renewcommand{\smaller}{\tiny}\@tiny}
\renewcommand{\large}{\renewcommand{\smaller}{\normalsize}\@large}  
\renewcommand{\Large}{\renewcommand{\smaller}{\large}\@Large}  
\renewcommand{\LARGE}{\renewcommand{\smaller}{\Large}\@LARGE}  
\renewcommand{\huge}{\renewcommand{\smaller}{\LARGE}\@huge}  
\renewcommand{\Huge}{\renewcommand{\smaller}{\huge}\@Huge}  

%% Things for the User Guide
\if@guide
% stolen from doc.sty
\def\MakeShortVerb#1{%
  \expandafter\ifx\csname cc\string#1\endcsname\relax
  \@shortvrbinfo{Made }{#1}%
  \add@special{#1}%
  \expandafter
  \xdef\csname cc\string#1\endcsname{\the\catcode`#1}%
  \begingroup
  \catcode`\~\active  \lccode`\~`#1%
  \lowercase{%
    \global\expandafter\let
    \csname ac\string#1\endcsname~%
    \gdef~{\verb~}}%
  \endgroup
  \global\catcode`#1\active
  \else
  \@shortvrbinfo\@empty{#1 already}%
  \fi}
\def\DeleteShortVerb#1{%
  \expandafter\ifx\csname cc\string#1\endcsname\relax
  \else
  \@shortvrbinfo{Deleted }{#1 as}%
  \rem@special{#1}%
  \global\catcode`#1\csname cc\string#1\endcsname
  \global \expandafter\let \csname cc\string#1\endcsname \relax
  \ifnum\catcode`#1=\active
  \begingroup
  \catcode`\~\active   \lccode`\~`#1%
  \lowercase{%
    \global\expandafter\let\expandafter~%
    \csname ac\string#1\endcsname}%
  \endgroup \fi \fi}
\def\@shortvrbinfo#1#2{%
  \PackageInfo{doc}{%
    #1\expandafter\@gobble\string#2 a short reference
    for \string\verb}}
\def\add@special#1{%
  \rem@special{#1}%
  \expandafter\gdef\expandafter\dospecials\expandafter
  {\dospecials \do #1}%
  \expandafter\gdef\expandafter\@sanitize\expandafter
  {\@sanitize \@makeother #1}}
\def\rem@special#1{%
  \def\do##1{%
    \ifnum`#1=`##1 \else \noexpand\do\noexpand##1\fi}%
  \xdef\dospecials{\dospecials}%
  \begingroup
  \def\@makeother##1{%
    \ifnum`#1=`##1 \else \noexpand\@makeother\noexpand##1\fi}%
  \xdef\@sanitize{\@sanitize}%
  \endgroup}
% define | as shortcut for \verbatim
\MakeShortVerb{\|}
% comand to specify arguments to LaTeX commands
\newcommand{\rmArg}[1]{%
  \ensuremath{\langle}{\scriptsize \textsf{\MakeUpperCase{#1}}}\ensuremath{\rangle}}
%\newcommand{\rmArg}[1]{\ensuremath{\langle}\textsc{#1}\ensuremath{\rangle}}
\providecommand{\BibTeX}{{\rmfamily B\kern-.05em%
    \textsc{i\kern-.025em b}\kern-.08em%
    T\kern-.1667em\lower.7ex\hbox{E}\kern-.125emX}}
%% Environment for code examples
\newenvironment{Code}{%
  \begin{list}{}{\setlength{\leftmargin}{0.05\columnwidth}} 
  \item[]}{\end{list}}
\fi































