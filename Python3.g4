grammar Python3;

program : (statement NEWLINE)* statement? EOF ;

//Parser
statement : assignment | expr ;

assignment
  : ID '=' expr
  | ID assignmentOperator expr
  ;

assignmentOperator : '+='
    | '-=' 
    | '*=' 
    | '/=' 
    ;

/*one term that can be chained with + or -
eg: 1 + 2*3, (a+1) - x/2 etc*/
expr  : term (('+' | '-') term)* 
    ;
    
/*factor possibly chained with *, /, %
eg: 3*7, x/2 etc*/
term  : factor (('*' | '/' | '%') factor)* 
    ;
    
/*either an atom or a minus sign attached to everything 
eg: -(x + 3)*/
factor: '-' factor | atom 
    ;
    
/*smallest thing in the expression,
eg: a num 5 or a name x or a (expr)*/
atom  : value | array | '(' expr ')' 
    ;

value : BOOL | FLOAT | INT | STRING | ID 
    ;
    
array : '[' value (',' value)* ']' 
    ;

// Lexer
BOOL    : 'True' | 'False' ;
FLOAT   : [0-9]+ '.' [0-9]+ ;
INT     : [0-9]+ ;
STRING  : '"' [a-zA-Z0-9]* '"' | '\'' [a-zA-Z0-9]* '\'' ;
ID      : [a-zA-Z_][a-zA-Z0-9_]* ;
NEWLINE : ('\r'? '\n')+ ;
WS      : [ \t]+ -> skip ;
COMMENT : '#' ~[\r\n]* -> skip ;
