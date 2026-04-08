%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Style des articles pour PFIA 
% Auteur : Dominique.Longin@irit.fr
% Date : 05/12/2019
% Version : V1.0
% Modification : création
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pfia}

\LoadClass[10pt,twocolumn]{article}

% ---------------------------------
% PACKAGES
% ---------------------------------

\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{calc}
\usepackage{xspace}
\usepackage{times}
\usepackage{geometry}
\usepackage{titlesec}
\usepackage{babel}

% ---------------------------------
% LAYOUT
% ---------------------------------



\flushbottom

\setlength{\baselineskip}{12pt}

% taille du papier et de la zone de texte
% hauteur contient un nombre entier de lignes
\geometry{a4paper,text={17.6cm,58\baselineskip},centering}

% espacement entre les colonnes
\setlength{\columnsep}{1cm}

% pas d'indentation des paragraphes
\setlength{\parindent}{0em}

% style des pages
\pagestyle{empty}

% gestion automatique des dépassements dans les marges
\sloppy

% ---------------------------------
% INSERTS
% ---------------------------------

% espacement des sections
\titlespacing{\section}% command
{0em}% left
{*1}% before
{*1}% after
[0em]% right-sep margin increasing

% espacement des sous-sections
\titlespacing{\subsection}% command
{0em}% left
{*1}% before
{*0.7}% after
[0em]% right-sep margin increasing

% espacement des sous-sous-sections
\titlespacing{\subsubsection}% command
{0em}% left
{*0.8}% before
{*0.5}% after
[0em]% right-sep margin increasing

% espacement des sous-sous-sections
\titlespacing{\paragraph}% command
{0em}% left
{*0.5}% before
{*0.5}% after
[0em]% right-sep margin increasing

% résumé en français
\newenvironment{resume}{%
    \thispagestyle{empty}%
    \subsection*{Résumé}\em}{}

% mots-clés en français
\newenvironment{motscles}{\subsection*{Mots-clés}\em}{}

% résumé en anglais
\renewenvironment{abstract}{\subsection*{Abstract}\em}{}

% mots-clés en français
\newenvironment{keywords}{\subsection*{Keywords}\em}{}

