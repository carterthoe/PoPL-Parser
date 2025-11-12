grammar Python3;

program: statement* EOF;

// Parser
statement: assignment NEWLINE*;

assignment: ID '=' value
    | ID '=' array
    | ID '=' value operator value
    | ID assignmentOperator value;
    
operator: '+'
    | '-'
    | '*'
    | '-'
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
    
array: '['value(','value)*']';

// Lexer
BOOL: 'True' | 'False';
FLOAT: [0-9]+'.'[0-9]+;
INT: [0-9]+;
STRING: '"' [a-zA-Z0-9]* '"' | '\'' [a-zA-Z0-9]* '\'';
ID: [a-zA-Z_][a-zA-Z0-9_]*;
NEWLINE: '\r'? '\n';
WS: [\t]+ -> skip;