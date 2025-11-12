grammar Python3;

// -------Parser Rules---------
program: statement* EOF;

// Each statement (line + newlines)
statement: assignment NEWLINE*;

// Possible assignments
assignment: ID '=' expression
    | ID '=' array
    | ID assignmentOperator expression;

// Expressions used in assignment
expression: value
    | '-' expression // handle negative expressions
    | expression operator expression; // handle multiple expressions

// Operators used in assignment (PEMDAS)
operator: '*'
    | '/'
    | '%'
    | '+'
    | '-';

// Assignment operators (PEMDAS)
assignmentOperator: '*='
    | '/='
    | '%='
    | '+='
    | '-=';

// Values
value: BOOL
    | FLOAT
    | INT
    | STRING
    | ID;

// Array
array: '[' expression (',' expression)* ']';



// -------Lexer Rules---------
BOOL: 'True' | 'False';

FLOAT: [0-9]+'.'[0-9]+;

INT: [0-9]+;

STRING: '"' (~["\n])* '"'
    | '\'' (~['\n])* '\'';
    
ID: [a-zA-Z_][a-zA-Z0-9_]*;

NEWLINE: '\n';

WS: [ \t]+ -> skip;