% 一般学术论文格式模板
% 使用 XeLaTeX 编译
% 临江仙

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{solitairemiya-art}[Custom article template.]

% ctexart
% 小四号
\LoadClass[zihao=-4,oneside]{ctexart}

% 包导入
\RequirePackage{amsmath,amssymb,amsfonts,amsthm} % 数学环境
\RequirePackage{mathrsfs} % mathscr 数学字体
\RequirePackage{esint} % 积分号优化
\RequirePackage{extarrows} % 扩展箭头
\RequirePackage{enumitem} % 扩展列表环境
\RequirePackage{color} % 颜色
\RequirePackage[
    pagebackref,
    hidelinks,
    colorlinks=true,
    citecolor=blue,
    linkcolor=black,
    plainpages=false,
    pdfpagelabels,
    hypertexnames=false
]{hyperref} % 交叉引用链接
\RequirePackage{geometry} % 页面设置
\RequirePackage{fancyhdr} % 设置页眉页脚
\RequirePackage{graphicx} % 插入图片
\RequirePackage{multirow} % 分栏
\RequirePackage{array}
\RequirePackage[version=4]{mhchem} % 有机化学作图
\RequirePackage{siunitx} % 物理化学带单位量
\RequirePackage{enumitem} % 自定义列表格式
\RequirePackage{caption} % 自定义浮动窗口标题格式
\RequirePackage[linesnumbered,ruled,vlined]{algorithm2e} % 伪代码
\RequirePackage{booktabs}
\RequirePackage{listings} % 源码插入
\RequirePackage{fontspec} % 字体设置
\RequirePackage{floatrow} % 浮动体格式设置
\RequirePackage{ifthen} % LaTeX 逻辑判断
\RequirePackage[most]{tcolorbox} % 自定义盒子样式
\RequirePackage{lastpage} % 获取总页数，用于页码显示
\RequirePackage{varwidth} % 可变宽度的盒子，用于标题页排版
\RequirePackage{setspace} % 调整行距
\RequirePackage{etoolbox} % 用于调整行间公式的行距
\RequirePackage{tikz} % 用于导入图片
\RequirePackage{booktabs} % 用于调整术语表分栏
\RequirePackage[
    record,
    abbreviations,
    symbols,
    postdot,
    stylemods={longextra}, 
    postpunc=dot,         
]{glossaries-extra} % 用于生成术语表
\RequirePackage{longtable}
\RequirePackage{abstract} % 调整摘要样式

% glossaries-extra
\GlsXtrLoadResources[
  src={glossary},        % 术语表文件
  sort={en},             % 按英文排序
  selection={all},       % 显示所有条目
  group={letter},        % 开启字母分组
  type={main}
]
% 重新定义 long-booktabs 样式的环境列设置
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
\setglossarystyle{long-booktabs} % 术语表使用 long-booktabs 样式
% 重新定义表头内容
\renewcommand*{\entryname}{外文术语}
\renewcommand*{\descriptionname}{中文术语}
% 重新定义表格的列宽
\renewenvironment{theglossary}%
  {\begin{longtable}{@{\hspace{2em}} L{0.42\textwidth} L{0.42\textwidth} @{\hspace{2em}}}}% 控制左右两列各占 45% 宽度
  {\end{longtable}}

% geometry
\geometry{
    a4paper,
    % 页边距设置
    left=1.5cm,
    right=1.5cm,
    top=3cm,
    bottom=3.5cm,
    % 页眉、页脚和正文区之间的间距
    headsep=1cm,
    footskip=2cm
}

% 设置页眉页脚
% 正文页面风格
\fancypagestyle{main}{
    \fancyhf{}
    \fancyhead[L]{
        \zihao{5}
        \textcolor{black}{\rule[-3.5pt]{7pt}{1.3em}}
        \textcolor{black!60}{\rule[-3.5pt]{5pt}{1.3em}}
        \textcolor{black!20}{\rule[-3.5pt]{3pt}{1.3em}}
        \quad\fangsong\@title
    }
    \fancyfoot[R]{
        \zihao{5}\fangsong 第 \thepage 页（共 \pageref{LastPage} 页）\quad
        \textcolor{black!20}{\rule[-3.5pt]{3pt}{1.3em}}
        \textcolor{black!60}{\rule[-3.5pt]{5pt}{1.3em}}
        \textcolor{black}{\rule[-3.5pt]{7pt}{1.3em}}
    }
    \renewcommand{\headrulewidth}{0pt}
    \setlength{\headheight}{15pt}
}

% 标题页面风格，通过重定义 plain 样式实现
\fancypagestyle{plain}{
    \fancyhf{}
    \fancyfoot[R]{
        \zihao{5}\fangsong 第 \thepage 页（共 \pageref{LastPage} 页）\quad
        \textcolor{black!20}{\rule[-3.5pt]{3pt}{1.3em}}
        \textcolor{black!60}{\rule[-3.5pt]{5pt}{1.3em}}
        \textcolor{black}{\rule[-3.5pt]{7pt}{1.3em}}
    }
    \renewcommand{\headrulewidth}{0pt}
}

% 补充不自带粗体的中文字体
% 仿宋及其粗体
\setCJKfamilyfont{fangsong}[AutoFakeBold = {2.17}]{FangSong}
\renewcommand*{\fangsong}{\CJKfamily{fangsong}}

% 设置摘要环境
\renewcommand{\abstractnamefont}{\bfseries\songti\zihao{-4}}
\renewcommand{\abstracttextfont}{\songti\zihao{-4}}

% 用于直接调用的样式生成命令
% 标题生成命令
\renewcommand{\maketitle}{
    \pagestyle{main}
    \thispagestyle{plain}

    {
        \bfseries\centering
        \zihao{2}\@title
        
        \vspace{1em}

        \zihao{-4}\@author

        \vspace{1em}

    }
}

% 中文定理环境
\theoremstyle{definition}
\newtheorem{theorem}{定理}[section]
\newtheorem*{theorem*}{定理}
\newtheorem{lemma}[theorem]{引理}
\newtheorem*{lemma*}{引理}
\newtheorem{proposition}[theorem]{命题}
\newtheorem*{proposition*}{命题}
\newtheorem{corollary}[theorem]{推论}
\newtheorem*{corollary*}{推论}
\newtheorem{definition}[theorem]{定义}
\newtheorem*{definition*}{定义}
\newtheorem{example}[theorem]{例题}
\newtheorem*{example*}{例题}
\newtheorem{remark}[theorem]{注释}
\newtheorem*{remark*}{注释}
\newtheorem{exercise}{习题}[section]
\newtheorem*{exercise*}{习题}
% 临时定理环境
\newtheorem*{genericthm}{\thmtitle}
\newcommand{\thmtitle}{Theorem} % 默认值
\newcommand{\thmbase}[2]{%
    \renewcommand{\thmtitle}{#1}% 更新标题
    \begin{genericthm}
        #2
    \end{genericthm}
}% 重定义 proof 标题的字体格式
\makeatletter
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \bfseries #1\@addpunct{.}]\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}
\makeatother

% enumitem
\setlist{nosep} % 取消列表项间的行距

% ctex
% 各级标题格式设置
\ctexset{
    section = {
        format = {\centering\zihao{4}\bfseries},
    },
    subsection = {
        format = {\zihao{-4}\bfseries},
    },
}

% fontspec
% 默认英文字体设置为 Times New Roman
\setmainfont{Times New Roman}
