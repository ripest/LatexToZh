lexer grammar CommonLexerRules;

import SpecialSymbolRules;

//空白字符和跳过规则
WS: [ \t\r\n]+ -> skip;
DOLLAR_SIGN: '\\$' -> skip;
STYPE: '\\,' -> skip;

//四则运算
ADD: '+';
SUB: '-';
MUL: '*' | '×';
DIV: '/' | '\\over' | '÷';
PM: '±';

//( ) [ ] { } 括号类
L_PAREN: '(';
R_PAREN: ')';
L_GROUP: '\\lgroup';
R_GROUP: '\\rgroup';
L_BRACE: '{';
R_BRACE: '}';
L_BRACE_VISUAL: '\\{';
R_BRACE_VISUAL: '\\}';
L_BRACE_CMD: '\\lbrace';
R_BRACE_CMD: '\\rbrace';
L_BRACKET: '[';
R_BRACKET: ']';
L_BRACK: '\\lbrack';
R_BRACK: '\\rbrack';

//| || ⌊⌋ ⌈⌉ 角括号、竖线、上下取整等
BAR: '|';
L_VERT: '\\lvert';
R_VERT: '\\rvert';
VERT: '\\vert';
NORM: '\\|';
L_FLOOR: '\\lfloor';
R_FLOOR: '\\rfloor';
LL_CORNER: '\\llcorner';
LR_CORNER: '\\lrcorner';
L_CEIL: '\\lceil';
R_CEIL: '\\rceil';
UL_CORNER: '\\ulcorner';
UR_CORNER: '\\urcorner';

L_LEFT: '\\left';
R_RIGHT: '\\right';
ML_LEFT: '\\mleft';
MR_RIGHT: '\\mright';

//函数名命令
FUNC_LIM:  '\\lim';
LIM_APPROACH_SYM: '\\to' | '\\rightarrow' | '\\Rightarrow' | '\\longrightarrow' | '\\Longrightarrow';
FUNC_INT:  '\\int';
FUNC_SUM:  '\\sum';
FUNC_PROD: '\\prod';

FUNC_LOG:  '\\log';
FUNC_LN:   '\\ln';
FUNC_EXP: '\\exp';
FUNC_SIN:  '\\sin';
FUNC_COS:  '\\cos';
FUNC_TAN:  '\\tan';
FUNC_CSC:  '\\csc';
FUNC_SEC:  '\\sec';
FUNC_COT:  '\\cot';


FUNC_ARCSIN: '\\arcsin';
FUNC_ARCCOS: '\\arccos';
FUNC_ARCTAN: '\\arctan';
FUNC_ARCCSC: '\\arccsc';
FUNC_ARCSEC: '\\arcsec';
FUNC_ARCCOT: '\\arccot';

FUNC_SINH: '\\sinh';
FUNC_COSH: '\\cosh';
FUNC_TANH: '\\tanh';
FUNC_ARSINH: '\\arsinh';
FUNC_ARCOSH: '\\arcosh';
FUNC_ARTANH: '\\artanh';
FUNC_ARCSINH: '\\arcsinh';
FUNC_ARCCOSH: '\\arccosh';
FUNC_ARCTANH: '\\arctanh';

FUNC_ARSINH_NAME: 'arsinh';
FUNC_ARCSINH_NAME: 'arcsinh';
FUNC_ARCOSH_NAME: 'arcosh';
FUNC_ARCCOSH_NAME: 'arccosh';
FUNC_ARTANH_NAME: 'artanh';
FUNC_ARCTANH_NAME: 'arctanh';
FUNC_GCD_NAME: 'gcd';
FUNC_LCM_NAME: 'lcm';
FUNC_FLOOR_NAME: 'floor';
FUNC_CEIL_NAME: 'ceil';

FUNC_SQRT: '\\sqrt';
FUNC_GCD: '\\gcd';
FUNC_LCM: '\\lcm';
FUNC_FLOOR: '\\floor';
FUNC_CEIL: '\\ceil';
FUNC_MAX: '\\max';
FUNC_MIN: '\\min';

FUNC_DET: '\\det';

FUNC_EYE_NAME: 'eye';
FUNC_ZEROS_NAME: 'zeros';
FUNC_ONES_NAME: 'ones';
FUNC_COLS_NAME: 'cols';
FUNC_ROWS_NAME: 'rows';
FUNC_DIAG_NAME: 'diag';
FUNC_NORM_NAME: 'norm';
FUNC_RANK_NAME: 'rank';
FUNC_TRACE_NAME: 'trace' | 'tr';
FUNC_RREF_NAME: 'rref';
FUNC_HSTACK_NAME: 'hstack';
FUNC_VSTACK_NAME: 'vstack';
FUNC_ORTHOGONALIZE_NAME: 'orth' | 'ortho' | 'orthogonal' | 'orthogonalize';
FUNC_NULLSPACE_NAME: 'nullspace';
FUNC_DIAGONALIZE_NAME: 'eig' | 'eigen' | 'diagonalize';
FUNC_EIGENVALS_NAME: 'eigenvals' | 'eigenvalues';
FUNC_EIGENVECTORS_NAME: 'eigenvects' | 'eigenvectors';
FUNC_SVD_NAME: 'svd' | 'SVD';
FUNC_TRIANGLE: '\\triangle';

//命令宏
CMD_TIMES: '\\times';
CMD_CDOT:  '\\cdot';
CMD_DIV:   '\\div';
CMD_FRAC:  '\\frac';
CMD_BINOM: '\\binom' | '\\tbinom' | '\\dbinom';
CMD_CHOOSE: '\\choose';
CMD_MOD: '\\mod';
CMD_PM: '\\pm';
CMD_TEXT: '\\text';
CMD_MATHIT: '\\mathit';

CMD_OPERATORNAME: '\\operatorname';

//matrix test
MATRIX_TYPE_MATRIX: 'matrix';
MATRIX_TYPE_PMATRIX: 'pmatrix';
MATRIX_TYPE_BMATRIX: 'bmatrix';
MATRIX_TYPE_DET: 'vmatrix';
MATRIX_TYPE_CASES: 'cases';
MATRIX_TYPES: MATRIX_TYPE_MATRIX | MATRIX_TYPE_PMATRIX | MATRIX_TYPE_BMATRIX;
CMD_MATRIX_START: '\\begin' L_BRACE MATRIX_TYPES R_BRACE;
CMD_MATRIX_END: '\\end' L_BRACE MATRIX_TYPES R_BRACE;
CMD_DET_START: '\\begin' L_BRACE MATRIX_TYPE_DET R_BRACE;
CMD_DET_END: '\\end' L_BRACE MATRIX_TYPE_DET R_BRACE;
CMD_CASES_START: '\\begin' L_BRACE MATRIX_TYPE_CASES R_BRACE;
CMD_CASES_END: '\\end' L_BRACE MATRIX_TYPE_CASES R_BRACE;
MATRIX_DEL_COL: '&';
MATRIX_DEL_ROW: '\\\\';

//下标、上标、标点
UNDERSCORE: '_';
CARET: '^';
COLON: ':';
SEMICOLON: ';';
COMMA: ',';
PERIOD: '.';

fragment WS_CHAR: [ \t\r\n];
DIFFERENTIAL: 'd' WS_CHAR*? ([a-zA-Z] | '\\' [a-zA-Z]+);

// 字符
EXP_E: 'e' | '\\exponentialE';
E_NOTATION_E: 'E';
LETTER_NO_E: [a-df-zA-DF-Z]; // exclude e for exponential function and e notation
fragment LETTER: [a-zA-Z];
fragment CHINESE : [\u4e00-\u9fa5]+ ;
fragment DIGIT: [0-9];
TRIANGLE_LETTER: LETTER+;
TEXT_LETTER: (LETTER|CHINESE)+;


MATRIX_XRIGHTARROW: '\\xrightarrow' | '\\xRightarrow';
TRANSFORM_EXCHANGE: '<->' | '<=>' | '\\leftrightarrow' | '\\Leftrightarrow';

NUMBER:
    DIGIT+ (COMMA DIGIT DIGIT DIGIT)*
    | DIGIT* (COMMA DIGIT DIGIT DIGIT)* PERIOD DIGIT+;

E_NOTATION: NUMBER E_NOTATION_E (SUB | ADD)? DIGIT+;

IN: '\\in';
ASSIGNMENT: '=';
EQUAL: '==' | '\\equiv';
LT: '<';
LTE: '\\leq' | '\\le' | '\\leqslant' | '<=';
GT: '>';
GTE: '\\geq' | '\\ge' | '\\geqslant' | '>=';
UNEQUAL: '!=' | '!==' | '\\ne' | '\\neq' | '\\not\\equiv';
AROUND: '≈' | '\\approx' | '\\thickapprox';

BANG: '!';

fragment PERCENT_SIGN: '\\%' | '%';
PERCENT_NUMBER: NUMBER PERCENT_SIGN;

fragment PI: '\\pi';
fragment INFTY_CMD: '\\infty';
fragment PARTIAL_CMD: '\\partial';
fragment INFTY: INFTY_CMD | DOLLAR_SIGN INFTY_CMD | INFTY_CMD PERCENT_SIGN;
fragment EMPTYSET: '\\emptyset';
fragment CIRC: '\\circ';
SYMBOL: PI | PARTIAL_CMD | INFTY | EMPTYSET | CIRC;

fragment VARIABLE_CMD: '\\variable';
fragment VARIABLE_SYMBOL: (GREEK_CMD | OTHER_SYMBOL_CMD | LETTER | DIGIT)+ (UNDERSCORE ((L_BRACE (GREEK_CMD | OTHER_SYMBOL_CMD | LETTER | DIGIT | COMMA)+ R_BRACE) | (GREEK_CMD | OTHER_SYMBOL_CMD | LETTER | DIGIT)))?;
VARIABLE: VARIABLE_CMD L_BRACE VARIABLE_SYMBOL R_BRACE PERCENT_SIGN?;


