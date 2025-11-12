grammar Python3;

// -----PARSER-----

// ---Start---
program
 : (NEWLINE | statement NEWLINE)* statement? NEWLINE* EOF
 ;

// ---Statements---
statement
 : assignment
 | expression
 ;
    
assignment
 : ID (ASSIGN | ADD_ASSIGN | SUB_ASSIGN | MUL_ASSIGN | DIV_ASSIGN) expression
 ;
    
// --- Expressions ---
expression
 : term ((PLUS | MINUS) term)*
 ;

term
 : factor ((MULT | DIV | MOD) factor)*
 ;
 
factor
 : MINUS factor
 | atom
 ;
 
atom
 : value
 | array
 | LPAREN expression RPAREN
 ;
 
value
 : INT
 | FLOAT
 | STRING
 | BOOL
 | ID
 ;
 
array
 : LBRACK (expression(COMMA expression)*)? RBRACK
 ;


// -----LEXER-----


// --- Operators---
ASSIGN : '=' ;
ADD_ASSIGN : '+=' ;
SUB_ASSIGN : '-=' ;
MUL_ASSIGN : '*=' ;
DIV_ASSIGN : '/=' ;

PLUS : '+' ;
MINUS : '-' ;
MULT : '*' ;
DIV : '/' ;
MOD : '%' ;

LPAREN : '(' ;
RPAREN : ')' ;
LBRACK : '[' ;
RBRACK : ']' ;
COMMA  : ',' ;

// --- Names/Numbers---
ID      : [A-Za-z_] [A-Za-z_0-9]* ;

FLOAT   : DIGITS '.' DIGITS ;
INT     : DIGITS ;
fragment DIGITS : [0-9]+ ;

// ---String---

STRING
: '"' ~["\r\n]* '"'
| '\'' ~['\r\n]* '\''
;

// ---Bool---
BOOL    : 'True' | 'False' ;

// ---Newlines/Ignores---
NEWLINE : ('\r'? '\n')+ ;

WS      : [ \t\f]+ -> skip ;
COMMENT : '#' ~[\r\n]* -> skip;
