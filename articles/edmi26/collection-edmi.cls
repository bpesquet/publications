%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% collection-edmi
% LaTeX Class
% Inspired by 'Wenneker Article'
%Please do not modify this file !
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{collection-edmi}[]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

% Load the base class
\LoadClass{book}

% ----------------------------------------
% Magic packages
% ----------------------------------------
\RequirePackage[subpreambles=true]{standalone}
\RequirePackage{import}

% ----------------------------------------
% Base packages
% ----------------------------------------

% English language hyphenation
\RequirePackage[french]{babel}

% Links
\RequirePackage{hyperref}
\hypersetup{
    colorlinks = true,
    allcolors = {SecondaryColor},
}

% Better typography
\RequirePackage{microtype}

% Math packages for equations
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}

% Enabling colors by their 'svgnames'
\RequirePackage[svgnames]{xcolor}
\definecolor{darkjunglegreen}{rgb}{0.1, 0.14, 0.13}

\colorlet{PrimaryColor}{DarkGoldenrod}
\colorlet{SecondaryColor}{DarkRed}
\colorlet{TertiaryColor}{darkjunglegreen}

% Custom captions under/above tables and figures
\RequirePackage[small, labelfont=bf, up, textfont=it, hypcap=false]{caption}
\captionsetup{labelfont={color=TertiaryColor,bf}}

 % Horizontal rules in tables
\RequirePackage{booktabs}

 % Used to determine the number of pages in the document (for "Page X of Total")
\RequirePackage{lastpage}

% Required for adding images
\RequirePackage{graphicx}

% Required for customising lists
\RequirePackage{enumitem}
% Remove spacing between bullet/numbered list elements
\setlist{noitemsep}

% Enables custom section titles
\RequirePackage{sectsty}
% Change the font of all section commands (Helvetica)
\allsectionsfont{\usefont{OT1}{phv}{b}{n}\color{TertiaryColor}}
% \chapterfont{\usefont{OT1}{phv}{b}{n}\color{PrimaryColor}}
\sectionfont{\usefont{OT1}{phv}{b}{n}\color{PrimaryColor}}
\subsectionfont{\usefont{OT1}{phv}{b}{n}\color{SecondaryColor}}

% Tikz
\RequirePackage{tikz}

% ----------------------------------------
% Margins and spacing
% ----------------------------------------
\RequirePackage{geometry} % Required for adjusting page dimensions

\geometry{
	top=1cm, % Top margin
	bottom=1.5cm, % Bottom margin
	left=2cm, % Left margin
	right=2cm, % Right margin
	includehead, % Include space for a header
	includefoot, % Include space for a footer
	%showframe, % Uncomment to show how the type block is set on the page
}

% Column separation width
\setlength{\columnsep}{7mm}

% ----------------------------------------
% Fonts
% ----------------------------------------
% Output font encoding for international characters
\RequirePackage[T1]{fontenc}
% Required for inputting international characters
\RequirePackage[utf8]{inputenc}
% Use the XCharter font
\RequirePackage{XCharter}

% ----------------------------------------
% Headers and footers
\RequirePackage{fancyhdr} % Needed to define custom headers/footers
\pagestyle{fancy} % Enables the custom headers/footers

% No header rule
\renewcommand{\headrulewidth}{0.0pt}
% Thin footer rule
\renewcommand{\footrulewidth}{0.4pt}
% Removes the section number from the header when \leftmark is used
\renewcommand{\sectionmark}[1]{\markboth{#1}{}}

% Headers
\lhead{} % Left header
\rhead{} % Right header

% Footers
\lfoot{} % Left footer
\cfoot{} % Center footer
\rfoot{} %no pagination
%\rfoot{\footnotesize Page \thepage\ sur \pageref*{LastPage}} % Right footer, "Page 1 of 2"

% Page style for the first page with the title
\fancypagestyle{firstpage}{
	\fancyhf{}
	\renewcommand{\footrulewidth}{0pt} % Suppress footer rule
}

% ----------------------------------------
% Title section
% ----------------------------------------

% Styles
\newcommand{\authorstyle}[1]{{\large\usefont{OT1}{phv}{b}{n}\color{SecondaryColor}#1}}
\newcommand{\institutionstyle}[1]{{\footnotesize\usefont{OT1}{phv}{m}{sl}\color{Black}#1}} % Institutions style (Helvetica)

% \RequirePackage{titling} % Allows custom title configuration

\newcommand{\HorRule}{\color{PrimaryColor}\noindent\rule{0.66\textwidth}{2pt}} % Defines the gold horizontal rule around the title

\renewcommand\title[1]{\def\article@title{#1}}
\renewcommand\author[1]{\def\article@author{#1}}
\newcommand\direction[1]{\def\article@direction{#1}}
\newcommand\institution[1]{\def\article@institution{#1}}
\newcounter{articleid}

\def\maketitle{%
	\newpage
	\null
	\vskip 2em%
	\vspace*{2em}
	{
		\vspace{-50pt} % Move the entire title section up
		% \HorRule
		\vspace{10pt} % Horizontal rule before the title
		\fontsize{22}{40}\usefont{OT1}{phv}{b}{n}\selectfont % Helvetica
		\noindent\textcolor{PrimaryColor}{\textsc{\article@title}}
		\vspace{5mm}
	}
	{
		\par
		\noindent\authorstyle{\underline{\article@author}}
		\par
		\medskip
		\noindent\authorstyle{\article@direction}
		\par
		\medskip
		\noindent\institutionstyle{\article@institution}
		\par\HorRule
	}
	\medskip\par
	%
	\addtocounter{articleid}{1}%
	\addtocounter{chapter}{1}%
	\addcontentsline{toc}{chapter}{\protect\numberline{\thechapter} \article@title\newline\hspace{1em}{\normalfont\itshape\article@author}}
	\setcounter{figure}{0}
	\setcounter{table}{0}
}

%
\def\article@author{}
\newcommand{\articleref}[1]{#1\roman{articleid}}

\makeatletter
\AtBeginDocument{%
 \let\oldref\ref
 \renewcommand*{\ref}[1]{%
   \oldref{\articleref{#1}}%
 }%
%   \let\origpageref\pageref
%   \renewcommand*{\pageref}[1]{%
%     \origpageref{\articlelabel{#1}}%
%   }%
%   \let\origcite\cite%
%   \renewcommand*{\cite}[1]{%
%     \origcite{\articlelabel{#1}}%
%   }%
%   \let\origbibitem\cite%
%   \renewcommand*{\bibitem}[1]{%
%     \origbibitem{\articlelabel{#1}}%
%   }%
 \let\oldlabel\label%
 \renewcommand*{\label}[1]{%
   \oldlabel{\articleref{#1}}%
 }%
}
\makeatother

% ----------------------------------------
% Abstract
% ----------------------------------------

 % Package to accentuate the first letter of the text (lettrine)
\RequirePackage{lettrine}
% Fixes the height of the lettrine
\RequirePackage{fix-cm}

\newcommand{\initial}[1]{ % Defines the command and style for the lettrine
	\lettrine[lines=2,nindent=2pt]{% Lettrine takes up 3 lines, the text to the right of it is indented 4pt and further indenting of lines 2+ is stopped
		\color{PrimaryColor}% Lettrine colour
		{#1}% The letter
	}{}%
}

\RequirePackage{xstring} % Required for string manipulation

\newenvironment{abstract}[1]{%
	% % Capture the first letter of the abstract for the lettrine
	\StrLeft{#1}{1}[\firstletter]%
	\initial{\firstletter}
	% Print the abstract with the first letter as a lettrine and the rest in bold
	\bfseries\StrGobbleLeft{#1}{1}
}{		\par\smallskip\hfill\HorRule}

% ----------------------------------------
% Bibliography
% ----------------------------------------

\RequirePackage{chapterbib}
%\RequirePackage{biblatex}
%[backend=bibtex,style=authoryear,natbib=true]{biblatex} % Use the bibtex backend with the authoryear citation style (which resembles APA)

%\addbibresource{example.bib} % The filename of the bibliography

%\RequirePackage[autostyle=true]{csquotes} % Required to generate language-dependent quotes in the bibliography

\usepackage{etoolbox}
\patchcmd{\thebibliography}{\chapter*}{\subsection*}{}{}

% ----------------------------------------
% Other
% ----------------------------------------

\newenvironment{floating}
{\par\medskip\noindent\minipage{\linewidth}}
{\endminipage\par\medskip}

\RequirePackage{multicol}

\newenvironment{content}
{\begin{multicols}{2}}
{\end{multicols}}

% \makeatlette2
% \@addtoreset{figure}{chapter}
% \@addtoreset{table}{chapter}
% \makeatother
% % \numberwithin{figure}{chapter}

\setcounter{tocdepth}{0}
\setcounter{secnumdepth}{0}

% ----------------------------------------
% Definitions
\newcommand{\labri}{Univ. Bordeaux, CNRS, Bordeaux INP, LaBRI, UMR 5800, F-33400 Talence, France}
\newcommand{\labriinria}{Univ. Bordeaux, CNRS, Bordeaux INP, INRIA, LaBRI, UMR 5800, F-33400 Talence, France}
\newcommand{\imb}{Univ. Bordeaux, CNRS, Bordeaux INP, IMB, UMR 5251, F-33400 Talence, France}
\newcommand{\imbinria}{Univ. Bordeaux, CNRS, INRIA, Bordeaux INP, IMB, UMR 5251, F-33400 Talence, France}
