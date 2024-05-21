% The LaTeX class file should maintain a clean separation between the style and content.
% Users should not have to modify the class file to change the document's content.
\NeedsTeXFormat{LaTeX2e}[2017/04/15]
\ProvidesClass{dlithesis}
[2024/05/12 0.1.0 Dalian University of Technology, Leicester International Institute Thesis Template]
\def\version{0.1.0}

% Options
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
	family=dlithesis,
	prefix=
}
\DeclareStringOption{Title}
\DeclareStringOption[Leicester International Institute]{Department}
\DeclareStringOption{Major}
\DeclareStringOption{StudentName}
\DeclareStringOption{StudentID}
\DeclareStringOption{SupervisorName}
\DeclareStringOption{ReviewerName}
\DeclareStringOption[Professor]{SupervisorTitle}
\DeclareStringOption{CompletionDate}
\DeclareStringOption[false]{TwoSide}


\ProcessKeyvalOptions*


\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToPackage{AutoFakeBold}{xeCJK}

% Silence
\RequirePackage{silence}
\WarningsOff[latex]
\WarningsOff[xeCJK]
\WarningsOff[ctex]
\WarningsOff*
\WarningFilter{latex}{Font "FandolSong-Regular"}
\WarningFilter{latex}{Redefining CJKfamily}


\RequirePackage[svgnames,dvipsnames,table,xcdraw]{xcolor}

\RequirePackage{xifthen}

\ifthenelse{\equal{\TwoSide}{true}}
{
	\PassOptionsToClass{
		twoside,
		openany,
		autospace,
	}{ctexbook}
}
{
	\PassOptionsToClass{
		oneside,
		openany,
	}{ctexbook}
}

\LoadClass[
	zihao = -4,
	UTF8,
]{ctexbook}

\usepackage[main=english]{babel}

% Packages
% Utils
\RequirePackage{amsmath,amsthm,amsfonts,amssymb} % regular math packages
\RequirePackage{bm,mathrsfs} % support mathbf, mathcal, etc.
\RequirePackage{upgreek}
\RequirePackage[version=4]{mhchem} % support chem equations
\RequirePackage{siunitx}
\RequirePackage{notoccite} % prevent trouble from citations in table of contents, etc.
\RequirePackage{ifthen}
\RequirePackage{ifpdf}
\RequirePackage{pdfpages}
\RequirePackage{lipsum} % support for random generation of text as test
\RequirePackage{multido}
\RequirePackage{fontspec}
\RequirePackage{tocloft}
\RequirePackage{paralist}
\RequirePackage{multirow}
\RequirePackage{makecell}
\RequirePackage{ulem}
\RequirePackage{chngcntr}
\RequirePackage{float}
\RequirePackage{listings}
\RequirePackage{hyperref}
\hypersetup{
	hidelinks,
	colorlinks=true,
	linkcolor=Indigo,
	urlcolor=DeepSkyBlue,
	citecolor=Indigo,
}

% Reference
% TODO: gb7714 style still need to be adjusted.
\RequirePackage[
	backend=biber,
	style=gb7714-2015,
	citestyle=gb7714-2015,
	gbpunctin=false,
	gblocal=english,
	gbnamefmt=familyahead,
	url=false,
	doi=false,
]{biblatex} % support for references
\addbibresource[location=local]{body/ref.bib}

% delete `/`notations in references list
\DefineBibliographyStrings{english}{in={}}
\DefineBibliographyStrings{english}{incn={}}

% \addbibresource[location=local]{ref.bib}

% Figure
\RequirePackage{graphicx}
\RequirePackage{subfig} % support for subfigure
\RequirePackage{cprotect} % support for add `\verb` in caption

\RequirePackage{tikz}
\RequirePackage[edges]{forest}

% Code/Algorithm
\RequirePackage[
	cache=true,
	outputdir=./build,
	chapter,
	newfloat,
]{minted} % support for code.

% Table
\RequirePackage{booktabs}
\RequirePackage{longtable}

\RequirePackage{tabularx}

% Fonts
\newcommand{\FakeBoldSize}{4}

% NOTE:
%   To use LuaTeX, we manually set the AutoFakeBold size for each font,
%   because in LuaTeX, CTeX invokes luatexja which does not recognize a global
%   AutoFakeBold setting. So we need to set AutoFakeBold for each font.

% ctex package stores one of "windows", "mac", and "fandol" in \g__ctex_fontset_tl
\ifthenelse{\equal{\csname g__ctex_fontset_tl\endcsname}{mac}}
{
	\IfFileExists{ /System/Library/Fonts/PingFang.ttc }
	{
		\setCJKfamilyfont{zhfs}   {STFangsong}      [AutoFakeBold={\FakeBoldSize}]
		\setCJKfamilyfont{zhhei}  {Heiti SC Light}  [BoldFont={Heiti SC Medium}]
		\setCJKfamilyfont{zhkai}  {Kaiti SC}        [BoldFont={Kaiti SC Bold}]
		\setCJKfamilyfont{zhsong} {Songti SC Light} [BoldFont={Songti SC Bold}]
		\newCJKfontfamily{\zhxingkai}  [AutoFakeBold={\FakeBoldSize}, Path="fonts/"] {STXingKai.ttf}

		\setCJKmainfont[AutoFakeBold={\FakeBoldSize}]{Songti SC Light}
	}
	{
		\setCJKfamilyfont{zhfs}   {STFangsong} [AutoFakeBold={\FakeBoldSize}]
		\setCJKfamilyfont{zhhei}  {STHeiti}    [AutoFakeBold={\FakeBoldSize}]
		\setCJKfamilyfont{zhkai}  {STKaiti}    [AutoFakeBold={\FakeBoldSize}]
		\setCJKfamilyfont{zhsong} {STSong}     [AutoFakeBold={\FakeBoldSize}]
		\newCJKfontfamily{\zhxingkai}  [AutoFakeBold={\FakeBoldSize}, Path="fonts/"] {STXingKai.ttf}

		\setCJKmainfont[AutoFakeBold={\FakeBoldSize}]{STSong}
	}
}
{
	% Windows or other platform
	\setCJKfamilyfont{zhfs}   {FangSong} [AutoFakeBold={\FakeBoldSize}]
	\setCJKfamilyfont{zhhei}  {SimHei}   [AutoFakeBold={\FakeBoldSize}]
	\setCJKfamilyfont{zhkai}  {KaiTi}    [AutoFakeBold={\FakeBoldSize}]
	\setCJKfamilyfont{zhsong} {SimSun}   [AutoFakeBold={\FakeBoldSize}]
	\newCJKfontfamily{\zhxingkai}  [AutoFakeBold={\FakeBoldSize}, Path="fonts/"] {STXingKai.ttf}

	\setCJKmainfont[AutoFakeBold={\FakeBoldSize}]{SimSun}
}

\setmainfont{Times New Roman}

% setting bib font
\renewcommand{\bibfont}{\zihao{-4}\songti}

% Geometry
\RequirePackage{geometry}
\geometry{
	a4paper,
	% includeheadfoot,
	vmargin={3.5cm, 2.5cm},
	hmargin={2.5cm, 2.5cm},
	headheight=2.5cm,
	headsep=30pt,
	footskip=30pt,
}
% TODO: set length of footer.

% header and footer style
\RequirePackage{fancyhdr}
\fancypagestyle{dli@hdr@withoutTitle}{
	\fancyhf{}
	\fancyfoot[C]{\zihao{5}{$-$~\thepage~$-$}}
	\fancyhead[CO]{\zihao{5}{\linespread{9pt}Dalian~University~of~Technology \hspace{14em} Capstone~Thesis}}
	\fancyhead[CE]{\zihao{5}{\linespread{9pt}Dalian~University~of~Technology \hspace{14em} Capstone~Thesis}}
}
\fancypagestyle{dli@hdr@withoutTitleRoman}{
	\fancyhf{}
	\fancyfoot[CO]{\zihao{5}{$-$~\thepage~$-$}}
	\fancyhead[CE]{\zihao{5}{\linespread{9pt}Dalian~University~of~Technology \hspace{14em} Capstone~Thesis}}
}

\fancypagestyle{dli@hdr@withoutTitleFoot}{
	\fancyhf{}
	% \fancyfoot[CO]{\zihao{5}{$-$~\thepage~$-$}}
	\fancyhead[CE]{\zihao{5}{\linespread{9pt}Dalian~University~of~Technology \hspace{14em} Capstone~Thesis}}
	\fancyhead[CO]{\zihao{5}{\linespread{9pt}Dalian~University~of~Technology \hspace{14em} Capstone~Thesis}}
}

\fancypagestyle{dli@hdr@withTitleNoFoot}{
	\fancyhf{}
	\fancyhead[C]{\zihao{5}{\Title}}
	\fancyfoot[C]{}
}

\fancypagestyle{dli@hdr@withTitle}{
	\fancyhf{}
	\fancyfoot[C]{\zihao{5}{$-$~\thepage~$-$}}
	\fancyhead[CO]{\zihao{5}{\Title}}
	\fancyhead[CE]{\zihao{5}{\Title}}
}

\renewcommand{\frontmatter}{
	% \clearpage
	\if@openright\cleardoublepage\else\clearpage\fi
	\@mainmatterfalse
	\pagenumbering{Roman}
	\pagestyle{dli@hdr@withoutTitle}
}

\renewcommand{\mainmatter}{
	\if@openright\cleardoublepage\else\clearpage\fi
	% \clearpage
	\@mainmattertrue
	\pagenumbering{arabic}
	\newcounter{mainpage}
	\setcounter{mainpage}{\number\value{page}}%
	\pagestyle{dli@hdr@withTitle}
}

\renewcommand{\backmatter}{
	\clearpage
	% \if@openright\cleardoublepage\else\clearpage\fi
	\@mainmatterfalse
	\pagenumbering{arabic}
	\setcounter{page}{\number\value{mainpage}}%
	\pagestyle{dli@hdr@withTitle}
}


% title settings via CTeX
\RequirePackage{titlesec}
\ctexset{
	chapter={
	  name = {},
	  number = {\arabic{chapter}},
	  format = { \CTEXifname{\raggedright\zihao{-3}}{\centering\zihao{-3}\textbf}},
	  pagestyle = {dli@hdr@withTitle},
	  beforeskip = 9.5pt,
	  afterskip = 18pt,
	  fixskip = true,
	 }
}
\ctexset{
	section={
	  format = {\raggedright\zihao{4}},
	  beforeskip = 10pt,
	  afterskip = 18pt,
	  fixskip = true,
	 }
}
\ctexset{subsection={
			format = {\raggedright\zihao{-4}},
			beforeskip = 18pt,
			afterskip = 18pt,
			fixskip = true,
		}
}
\ctexset{subsubsection=
		{
			name = {(,)},
			number = {\arabic{subsubsection}},
			format = {\raggedright\zihao{-4}},
			beforeskip =18pt,
			afterskip = 18pt,
			fixskip = true,
		}
}

% TOC
\RequirePackage{titletoc}

\contentsmargin{\z@}

\titlecontents{chapter}
[0pt]{\songti\zihao{-4}}
{\thecontentslabel\;}{}
{\titlerule*[4bp]{.}\thecontentspage}

\titlecontents{section}
[1\ccwd]{\songti\zihao{-4}}
{\thecontentslabel\;}{}
{\titlerule*[4bp]{.}\thecontentspage}

\titlecontents{subsection}
[2\ccwd]{\songti\zihao{-4}}
{\thecontentslabel\;}{}
{\titlerule*[4bp]{.}\thecontentspage}

\titlecontents{figure}
[0pt]{\songti\zihao{-4}}
{\figurename\thecontentslabel\;}{\hspace*{-1.5cm}}
{\titlerule*[4bp]{.}\thecontentspage}

\titlecontents{table}
[0pt]{\songti\zihao{-4}}
{\tablename\thecontentslabel\;}{\hspace*{-1.5cm}}
{\titlerule*[4bp]{.}\thecontentspage}

\renewcommand\listfigurename{Toc of figures}
\renewcommand\listtablename{Toc of tables}

\newcommand\maketoc{
	\@restonecolfalse
	\chapter*{Catalogue}
	\thispagestyle{dli@hdr@withoutTitleFoot}
	% \addcontentsline{toc}{chapter}{}
	\@starttoc{toc}
	\if@restonecol
		\twocolumn
	\fi
}

\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{3}

% Caption settings for figures/tables
\RequirePackage[list=off]{bicaption}
\RequirePackage[justification=centering,tableposition=top]{caption}
\RequirePackage{booktabs}
\DeclareCaptionLabelSeparator{zhspace}{\hspace{1\ccwd}}
\DeclareCaptionFont{fontsize}{\zihao{5}}
\captionsetup{
	font = {fontsize},
	labelsep = zhspace,
}
\captionsetup[figure][second]{name=Figure.}
\captionsetup[table]{
	position = top,
	aboveskip = 1pt,
	belowskip = 1pt,
}
\numberwithin{table}{chapter}
\captionsetup[figure]{
	position = bottom,
	aboveskip = 6bp,
	belowskip = 6bp,
}
\captionsetup[table][bsecond]{name=Table.}
\renewcommand{\figurename}{Figure.}
\renewcommand{\tablename}{Table.}

\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}

\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

% Math
\theoremstyle{definition}
\newtheorem{algo}{Algorithm~}[chapter]
\newtheorem{theorem}{Theorem~}[chapter]
\newtheorem{lemma}[theorem]{Lemma~}
\newtheorem{proposition}[theorem]{Proposition~}
\newtheorem{corollary}[theorem]{Corollary~}
\theoremstyle{definition}
\newtheorem{definition}{Definition~}[chapter]
\newtheorem{exmple}{Example~}[chapter]
\newtheorem{case}{Case~}
\renewcommand{\proofname}{\bf Proof}


% Algorithm
\newcounter{algorithm}[chapter]
\RequirePackage{algorithm}
\RequirePackage{algorithmicx}
\RequirePackage{algpseudocode}
\renewcommand{\algorithmicrequire}{\textbf{Input:}}
\renewcommand{\algorithmicensure}{\textbf{Output:}}
\renewcommand\thealgorithm{\thechapter.\arabic{algorithm}}

% layout
\RequirePackage{enumitem}
\setlist[itemize]{noitemsep}
\setlist[enumerate]{noitemsep}
\setlist{nosep}

\RequirePackage[
	UseMSWordMultipleLineSpacing, % 需设置为真
	MSWordLineSpacingMultiple=1.25,
	MSWordSinglespaceRatio=1.14990234375,
]{zhlineskip}

\RequirePackage{setspace}

% FrontCover
\RequirePackage{tabularx}

\renewcommand\maketitle{
	\begin{titlepage}
		\begin{center}

			\thispagestyle{empty}
			\setcounter{page}{-1}

			\null

			\begin{spacing}{1.25}
				% TODO: adjust top length.
				\zihao{-1} \bfseries
				Dalian University of Technology \\ Undergraduate Diploma Thesis (Design)
			\end{spacing}
			\vspace{2.3cm}
			\begin{spacing}{1.5}
				\centering
				\zihao{3}
				\textbf{\Title}
			\end{spacing}

			\vskip 26mm

			\begin{spacing}{1.5}
				\zihao{-3}
				\begin{tabularx}{.8\textwidth}{>{}l >{}X<{}}
					Department:      & \uline{\hfill \Department \hfill}                       \\
					Major:           & \uline{\hfill \Major \hfill}                            \\
					Name:            & \uline{\hfill \StudentName \hfill}                      \\
					Student Number:  & \uline{\hfill \StudentID \hfill}                        \\
					Supervisor:      & \uline{\hfill \SupervisorTitle.~\SupervisorName \hfill} \\
					Review Teacher:  & \uline{\hfill \ReviewerName \hfill}                     \\
					Completion Date: & \uline{\hfill \CompletionDate \hfill}                   \\
				\end{tabularx}
			\end{spacing}

			\vspace{20mm}

			\begin{spacing}{1.5}
				{\zihao{-2}\zhxingkai 大连理工大学} \\
				\vspace{5mm}
				{\zihao{-4} Dalian~University~of~Technology}
			\end{spacing}
		\end{center}
	\end{titlepage}

	\clearpage
	\if@twoside
		\thispagestyle{empty}
		\cleardoublepage
	\fi
}

\newcommand\keywords[1]{\vspace{2ex}\noindent{\bfseries\zihao{-4} Keywords:} #1}

\newcommand\makestatement{
	\chapter*{\zihao{2} Declaration of originality}
	\thispagestyle{dli@hdr@withTitleNoFoot}
	{
		\vspace{1em}
		\zihao{4}
		I solemnly declare that the graduation project (thesis) submitted is the result of independent research under the guidance of my supervisor. All referenced published or unpublished achievements, data, opinions, etc. are carefully cited in the graduation project (thesis) with the source. Except for those already cited, it does not include any other scientific research results that have been published or written by individuals or organization. Individuals and organizations who have made significant contributions to the thesis are clearly identified.\\

		\noindent The legal responsibility for this statement shall be borne by me.
		\vspace{4em}

		\begin{flushleft}
			\begin{table}[!h]
				% \fontsize{15}{22.5}\selectfont
				\zihao{4}
				\renewcommand{\arraystretch}{1.5}
				\begin{tabular}[c]{ll}
					Author's signature: \hspace{9em} & Date: \\
				\end{tabular}
			\end{table}
		\end{flushleft}
	}
	\clearpage
	\if@twoside
		\thispagestyle{empty}
		\cleardoublepage
	\fi
}

\newcommand\makecopyright{
	\chapter*{\zihao{2} Copyright}
	 {
	  \thispagestyle{dli@hdr@withTitleNoFoot}
	  \zihao{4}
	  \vspace{1em}
	  The intellectual property rights of the graduation project (thesis) and related materials (including drawings, test records, original data, physical photos, pictures, audio tapes, design manuscripts, etc.) completed by me under the guidance of my supervisor belong to Dalian University of Technology. I am fully aware of the regulations of Dalian University of Technology on the preservation and use of graduation project (thesis), and I authorize Dalian University of Technology to compile all or part of the content of this graduation project (thesis) into relevant databases for search, and can use any means of reproduction to preserve and compile this graduation project (thesis). If the relevant results are published, the consent of the instructor must be obtained, and the first signatory unit is Dalian University of Technology. When I use the graduation project (thesis) or academic papers or achievements directly related to the thesis after I leave the university, the first signatory unit is still Dalian University of Technology.

	  \vspace{4em}

	  \begin{flushleft}
		  \begin{table}[!h]
			  % \fontsize{15}{22.5}\selectfont
			  \zihao{4}
			  \renewcommand{\arraystretch}{1.5}
			  \begin{tabular}[c]{ll}
				  Author's signature: \hspace{9em} & Date: \\
				  Mentor's signature: \hspace{9em} & Date:
			  \end{tabular}
		  \end{table}
	  \end{flushleft}
	 }
	\clearpage
	\if@twoside
		\thispagestyle{empty}
		\cleardoublepage
	\fi
}

% Abstract
\newenvironment{abstract}{
	\chapter*{{\zihao{3}Abstract}}
	\addcontentsline{toc}{chapter}{Abstract}
	\thispagestyle{dli@hdr@withoutTitle}
}{
	\clearpage
	\if@twoside
		\thispagestyle{empty}
		\cleardoublepage
	\fi

}

\newcommand\makereflist{
	\chapter*{References}
	\thispagestyle{dli@hdr@withTitle}
	\addcontentsline{toc}{chapter}{References}
	\renewcommand{\bibfont}{\zihao{-4}}
	\setlength{\bibitemsep}{0ex}
	\setlength{\bibnamesep}{0ex}
	\setlength{\bibinitsep}{0ex}
	\printbibliography[heading=none,title=References]
}

\newenvironment{acknowledgement}{
	\chapter*{Acknowledgement}
	\addcontentsline{toc}{chapter}{Acknowledgement}
	\thispagestyle{dli@hdr@withTitle}
}
{}

% Appendix
\RequirePackage{appendix}

\newenvironment{revision}{
	\chapter*{Revision}
	\addcontentsline{toc}{chapter}{Revision}
	\thispagestyle{dli@hdr@withTitle}
}
{}


\endinput
