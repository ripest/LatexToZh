grammar Latex;
import CommonLexerRules;

options {
    language=Python3;
}

formula: relation | relation_list;

transpose: '^T' | '^{T}' |  '^{\\top}' | '\'';

transform_atom: LETTER_NO_E UNDERSCORE (NUMBER | L_BRACE NUMBER R_BRACE);
transform_scale: (expr | group | ADD | SUB) transform_atom;
transform_swap: transform_atom TRANSFORM_EXCHANGE transform_atom;
transform_assignment: transform_atom transform_scale;
elementary_transform: transform_assignment | transform_scale | transform_swap;
elementary_transforms: elementary_transform (COMMA elementary_transform)*;

matrix:
    CMD_MATRIX_START
    matrix_row (MATRIX_DEL_ROW matrix_row)* MATRIX_DEL_ROW?
    CMD_MATRIX_END
    (MATRIX_XRIGHTARROW (L_BRACKET elementary_transforms R_BRACKET)? L_BRACE elementary_transforms R_BRACE)?;

det:
    CMD_DET_START
    matrix_row (MATRIX_DEL_ROW matrix_row)* MATRIX_DEL_ROW?
    CMD_DET_END;

cases:
    CMD_CASES_START
    matrix_row (MATRIX_DEL_ROW matrix_row)* MATRIX_DEL_ROW?
    CMD_CASES_END;

matrix_row:
    relation (MATRIX_DEL_COL relation)*  # matrixRow;

relation:
    relation (IN | ASSIGNMENT | EQUAL | LT | LTE | GT | GTE | UNEQUAL | AROUND) relation
    | expr;

relation_list:
    relation_list_content
    | L_BRACKET relation_list_content R_BRACKET
    | L_BRACE relation_list_content R_BRACE
    | L_BRACE_VISUAL relation_list_content R_BRACE_VISUAL
    | L_LEFT L_BRACKET relation_list_content R_RIGHT R_BRACKET
    | L_LEFT L_BRACE_VISUAL relation_list_content R_RIGHT R_BRACE_VISUAL
    | ML_LEFT L_BRACKET relation_list_content MR_RIGHT R_BRACKET
    | ML_LEFT L_BRACE_VISUAL relation_list_content MR_RIGHT R_BRACE_VISUAL;

relation_list_content:
    relation COMMA relation (COMMA relation)*
    | relation SEMICOLON relation (SEMICOLON relation)*;

equality:
    expr (EQUAL | ASSIGNMENT) expr;

expr: additive;

additive:
    additive (ADD | SUB | CMD_PM) additive
    | mp;

// mult part
mp:
    mp (MUL | CMD_TIMES | CMD_CDOT | CMD_CDOTS | DIV | CMD_DIV | COLON | CMD_MOD) mp
    | unary;

mp_nofunc:
    mp_nofunc (MUL | CMD_TIMES | CMD_CDOT | DIV | CMD_DIV | COLON | CMD_MOD) mp_nofunc
    | unary_nofunc;

unary:
    (ADD | SUB | PM) unary
    | postfix+;

unary_nofunc:
    (ADD | SUB) unary_nofunc
    | postfix postfix_nofunc*;

postfix: exp postfix_op*;
postfix_nofunc: exp_nofunc postfix_op*;
postfix_op: BANG | eval_at | transpose;

eval_at:
    BAR (eval_at_sup | eval_at_sub | eval_at_sup eval_at_sub);

eval_at_sub:
    UNDERSCORE L_BRACE
    (expr | equality)
    R_BRACE;

eval_at_sup:
    CARET L_BRACE
    (expr | equality)
    R_BRACE;

exp:
    exp CARET (atom | L_BRACE expr R_BRACE) subexpr?
    | comp;

exp_nofunc:
    exp_nofunc CARET (atom | L_BRACE expr R_BRACE) subexpr?
    | comp_nofunc;

triangle: FUNC_TRIANGLE TRIANGLE_LETTER;

comp:
    group
    | norm_group
    | abs_group
    | floor_group
    | ceil_group
    | func
    | atom
    | frac
    | binom
    | matrix
    | det
    | cases;

comp_nofunc:
    group
    | norm_group
    | abs_group
    | floor_group
    | ceil_group
    | atom
    | frac
    | binom
    | matrix
    | det;

group:
    L_PAREN expr R_PAREN
    | L_GROUP expr R_GROUP
    | L_BRACE expr R_BRACE
    | L_BRACE_VISUAL expr R_BRACE_VISUAL
    | L_BRACE_CMD expr R_BRACE_CMD
    | L_BRACKET expr R_BRACKET
    | L_BRACK expr R_BRACK
    | L_LEFT L_PAREN expr R_RIGHT R_PAREN
    | L_LEFT L_GROUP expr R_RIGHT R_GROUP
    | L_LEFT L_BRACE expr R_RIGHT R_BRACE
    | L_LEFT L_BRACE_VISUAL expr R_RIGHT R_BRACE_VISUAL
    | L_LEFT L_BRACE_CMD expr R_RIGHT R_BRACE_CMD
    | L_LEFT L_BRACKET expr R_RIGHT R_BRACKET
    | L_LEFT L_BRACK expr R_RIGHT R_BRACK
    | ML_LEFT L_PAREN expr MR_RIGHT R_PAREN
    | ML_LEFT L_GROUP expr MR_RIGHT R_GROUP
    | ML_LEFT L_BRACE expr MR_RIGHT R_BRACE
    | ML_LEFT L_BRACE_VISUAL expr MR_RIGHT R_BRACE_VISUAL
    | ML_LEFT L_BRACE_CMD expr MR_RIGHT R_BRACE_CMD
    | ML_LEFT L_BRACKET expr MR_RIGHT R_BRACKET
    | ML_LEFT L_BRACK expr MR_RIGHT R_BRACK;


norm_group:
    NORM expr NORM
    | L_LEFT NORM expr R_RIGHT NORM
    | ML_LEFT NORM expr MR_RIGHT NORM;


abs_group:
    BAR expr BAR
    | L_VERT expr R_VERT
    | VERT expr VERT
    | L_LEFT BAR expr R_RIGHT BAR
    | L_LEFT L_VERT expr R_RIGHT R_VERT
    | L_LEFT VERT expr R_RIGHT VERT
    | ML_LEFT BAR expr MR_RIGHT BAR
    | ML_LEFT L_VERT expr MR_RIGHT R_VERT
    | ML_LEFT VERT expr MR_RIGHT VERT;


floor_group:
    L_FLOOR expr R_FLOOR
    | LL_CORNER expr LR_CORNER
    | L_LEFT L_FLOOR expr R_RIGHT R_FLOOR
    | L_LEFT LL_CORNER expr R_RIGHT LR_CORNER
    | ML_LEFT L_FLOOR expr MR_RIGHT R_FLOOR
    | ML_LEFT LL_CORNER expr MR_RIGHT LR_CORNER;


ceil_group:
    L_CEIL expr R_CEIL
    | UL_CORNER expr UR_CORNER
    | L_LEFT L_CEIL expr R_RIGHT R_CEIL
    | L_LEFT UL_CORNER expr R_RIGHT UR_CORNER
    | ML_LEFT L_CEIL expr MR_RIGHT R_CEIL
    | ML_LEFT UL_CORNER expr MR_RIGHT UR_CORNER;


// 重音
accent:
    ACCENT_SYMBOL
    L_BRACE base=expr R_BRACE;

atom_expr_no_supexpr: ( LETTER_NO_E | GREEK_CMD |  accent) subexpr?;
atom_expr:  (LETTER_NO_E | GREEK_CMD |  accent) (supexpr subexpr | subexpr supexpr | subexpr | supexpr)? # atomExpr;
atom: atom_expr | SYMBOL | NUMBER | PERCENT_NUMBER | E_NOTATION | DIFFERENTIAL | mathit | VARIABLE | text | triangle;

mathit: CMD_MATHIT L_BRACE mathit_text R_BRACE;
mathit_text: (LETTER_NO_E | E_NOTATION_E | EXP_E)+;
text: CMD_TEXT '{' TEXT_LETTER '}';

frac:
    CMD_FRAC L_BRACE
    upper=expr
    R_BRACE L_BRACE
    lower=expr
    R_BRACE;

//a binomial expression
binom:
    L_BRACE upper=expr CMD_CHOOSE lower=expr R_BRACE
    | CMD_BINOM L_BRACE upper=expr R_BRACE L_BRACE lower=expr R_BRACE;

func_normal_functions_single_arg:
    FUNC_LOG | FUNC_LN | FUNC_EXP
    | FUNC_SIN | FUNC_COS | FUNC_TAN
    | FUNC_CSC | FUNC_SEC | FUNC_COT
    | FUNC_ARCSIN | FUNC_ARCCOS | FUNC_ARCTAN
    | FUNC_ARCCSC | FUNC_ARCSEC | FUNC_ARCCOT
    | FUNC_SINH | FUNC_COSH | FUNC_TANH
    | FUNC_ARSINH | FUNC_ARCOSH | FUNC_ARTANH
    | FUNC_ARCSINH | FUNC_ARCCOSH | FUNC_ARCTANH
    | FUNC_FLOOR | FUNC_CEIL | FUNC_DET;

func_normal_functions_multi_arg:
    FUNC_GCD | FUNC_LCM | FUNC_MAX | FUNC_MIN;

func_operator_names_single_arg:
    FUNC_ARSINH_NAME | FUNC_ARCOSH_NAME | FUNC_ARTANH_NAME
    | FUNC_ARCSINH_NAME | FUNC_ARCCOSH_NAME | FUNC_ARCTANH_NAME
    | FUNC_FLOOR_NAME | FUNC_CEIL_NAME | FUNC_EYE_NAME | FUNC_RANK_NAME | FUNC_TRACE_NAME
    | FUNC_RREF_NAME | FUNC_NULLSPACE_NAME | FUNC_DIAGONALIZE_NAME | FUNC_NORM_NAME
    | FUNC_EIGENVALS_NAME | FUNC_EIGENVECTORS_NAME | FUNC_SVD_NAME | FUNC_COLS_NAME | FUNC_ROWS_NAME;

func_operator_names_multi_arg:
    FUNC_GCD_NAME | FUNC_LCM_NAME | FUNC_ZEROS_NAME | FUNC_ORTHOGONALIZE_NAME
    | FUNC_ONES_NAME | FUNC_DIAG_NAME | FUNC_HSTACK_NAME | FUNC_VSTACK_NAME;

func_normal_single_arg:
    (func_normal_functions_single_arg)
    |
    (CMD_OPERATORNAME L_BRACE func_operator_name=func_operator_names_single_arg R_BRACE);

func_normal_multi_arg:
    (func_normal_functions_multi_arg)
    |
    (CMD_OPERATORNAME L_BRACE func_operator_name=func_operator_names_multi_arg R_BRACE);

func:
    func_normal_single_arg
    (subexpr? supexpr? | supexpr? subexpr?)
    (L_LEFT? L_PAREN func_single_arg R_RIGHT? R_PAREN | ML_LEFT? L_PAREN func_single_arg MR_RIGHT? R_PAREN | func_single_arg_noparens)

    | func_normal_multi_arg
    (subexpr? supexpr? | supexpr? subexpr?)
    (L_LEFT? L_PAREN func_multi_arg R_RIGHT? R_PAREN | ML_LEFT? L_PAREN func_multi_arg MR_RIGHT? R_PAREN | func_multi_arg_noparens)

    | atom_expr_no_supexpr supexpr?
    L_LEFT? (L_PAREN | L_BRACKET) func_common_args (R_PAREN | R_BRACKET) R_RIGHT?
    | atom_expr_no_supexpr supexpr?
    L_BRACE L_LEFT? (L_PAREN | L_BRACKET) func_common_args (R_PAREN | R_BRACKET) R_RIGHT? R_BRACE

    | FUNC_INT
    (subexpr supexpr | supexpr subexpr | (UNDERSCORE L_BRACE R_BRACE) (CARET L_BRACE R_BRACE) | (CARET L_BRACE R_BRACE) (UNDERSCORE L_BRACE R_BRACE) )?
    (additive? DIFFERENTIAL | frac | additive)

    | FUNC_SQRT
    (L_BRACKET root=expr R_BRACKET)?
    L_BRACE base=expr R_BRACE

    | (FUNC_SUM | FUNC_PROD)
    (subeq supexpr | supexpr subeq)
    mp
    | FUNC_LIM limit_sub mp
    | EXP_E supexpr?; //Exponential function e^x

args: (expr ',' args) | expr;

func_common_args: atom | (expr ',') | (expr ',' args);

limit_sub:
    UNDERSCORE L_BRACE
    (LETTER_NO_E | GREEK_CMD)
    LIM_APPROACH_SYM
    expr (CARET L_BRACE (ADD | SUB) R_BRACE)?
    R_BRACE;

func_single_arg: expr;
func_single_arg_noparens: mp_nofunc;

func_multi_arg: expr | (expr ',' func_multi_arg);
func_multi_arg_noparens: mp_nofunc;

subexpr: UNDERSCORE (atom | L_BRACE (expr | args) R_BRACE);
supexpr: CARET (atom | L_BRACE expr R_BRACE);

subeq: UNDERSCORE L_BRACE equality R_BRACE;
supeq: UNDERSCORE L_BRACE equality R_BRACE;

