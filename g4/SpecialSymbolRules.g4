lexer grammar SpecialSymbolRules;

//特殊字符，比如：★ ⧓  ∅x △
fragment OTHER_SYMBOL:
    '\\Bbbk'  |
    '\\wp'  |
    '\\nabla'  |
    '\\bigstar'  |
    '\\angle'  |
    '\\nexists'  |
    '\\diagdown'  |
    '\\measuredangle'  |
    '\\eth'  |
    '\\emptyset'  |
    '\\diagup'  |
    '\\sphericalangle'  |
    '\\clubsuit'  |
    '\\varnothing'  |
    '\\Diamond'  |
    '\\complement'  |
    '\\diamondsuit'  |
    '\\imath'  |
    '\\Finv'  |
    '\\triangledown'  |
    '\\heartsuit'  |
    '\\jmath'  |
    '\\Game'  |
    '\\spadesuit'  |
    '\\ell'  |
    '\\hbar'  |
    '\\vartriangle'  |
    '\\hslash'  |
    '\\blacklozenge'  |
    '\\lozenge'  |
    '\\blacksquare'  |
    '\\mho'  |
    '\\blacktriangle'  |
    '\\sharp'  |
    '\\prime'  |
    '\\Im'  |
    '\\flat'  |
    '\\square'  |
    '\\backprime'  |
    '\\Re'  |
    '\\natural'  |
    '\\surd'  |
    '\\circledS';
OTHER_SYMBOL_CMD: OTHER_SYMBOL [ ]?;


// 希腊字母定义
fragment GREEK_LETTER:
    '\\char"000391' | //Alpha
    '\\alpha' |
    '\\char"000392' | //Beta
    '\\beta' |
    '\\Gamma' |
    '\\gamma' |
    '\\Delta' |
    '\\delta' |
    '\\char"000190' | //Epsilon
    '\\epsilon' |
    '\\varepsilon' |
    '\\char"000396' | //Zeta
    '\\zeta' |
    '\\char"000397' | //Eta
    '\\eta' |
    '\\Theta' |
    '\\theta' |
    '\\vartheta' |
    '\\char"000399' | //Iota
    '\\iota' |
    '\\char"00039A' | //Kappa
    '\\kappa' |
    '\\Lambda' |
    '\\lambda' |
    '\\char"00039C' | //Mu
    '\\mu' |
    '\\char"00039D' | //Nu
    '\\nu' |
    '\\Xi' |
    '\\xi' |
    '\\char"00039F' | //Omicron
    '\\omicron' |
    '\\Pi' |
    '\\varpi' |
    '\\char"0003A1' | //Rho
    '\\rho' |
    '\\varrho' |
    '\\Sigma' |
    '\\sigma' |
    '\\varsigma' |
    '\\char"0003A4' | //Tau
    '\\tau' |
    '\\Upsilon' |
    '\\upsilon' |
    '\\Phi' |
    '\\phi' |
    '\\varphi' |
    '\\char"0003A7' | //Chi
    '\\chi' |
    '\\Psi' |
    '\\psi' |
    '\\Omega' |
    '\\omega';

GREEK_CMD: GREEK_LETTER [ ]?;


//重音符号
ACCENT_SYMBOL: '\\acute'  |
        '\\bar'  |
        '\\overline'  |
        '\\breve'  |
        '\\check'  |
        '\\widecheck'  |
        '\\dot'  |
        '\\ddot'  |
        '\\grave'  |
        '\\hat'  |
        '\\tilde'  |
        '\\widetilde'  |
        '\\vec'  |
        '\\overrightarrow'  |
        '\\bm'  |
        '\\boldsymbol'  |
        '\\textit'  |
        '\\mathbb'  |
        '\\mathbin'  |
        '\\mathbf'  |
        '\\mathcal'  |
        '\\mathclap'  |
        '\\mathclose'  |
        '\\mathellipsis'  |
        '\\mathfrak'  |
        '\\mathinner'  |
        '\\mathnormal'  |
        '\\mathop'  |
        '\\mathopen'  |
        '\\mathord'  |
        '\\mathpunct'  |
        '\\mathrel'  |
        '\\mathring'  |
        '\\mathrlap'  |
        '\\mathrm'  |
        '\\mathscr'  |
        '\\mathsf'  |
        '\\mathsterling'  |
        '\\mathtt';
