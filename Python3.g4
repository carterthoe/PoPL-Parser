grammar Python3;

// Parser Rules
program: statement* EOF;

statement: assignment NEWLINE*;

assignment: ID '=' expression
    | ID '=' array
    | ID assignmentOperator expression;

expression: expression operator expression
    | value;

operator: '+'
    | '-'
    | '*'
    | '/'
    | '%';

assignmentOperator: '+='
    | '-='
    | '*='
    | '/=';

value: BOOL
    | FLOAT
    | INT
    | STRING
    | ID;

array: '[' expression (',' expression)* ']';

// Lexer Rules
BOOL: 'True' | 'False';
FLOAT: [0-9]+'.'[0-9]+;
INT: [0-9]+;
STRING: '"' (~["\r\n])* '"' | '\'' (~['\r\n])* '\'';
ID: [a-zA-Z_][a-zA-Z0-9_]*;
NEWLINE: '\n';
WS: [ \t]+ -> skip;