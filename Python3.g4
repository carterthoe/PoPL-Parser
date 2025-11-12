grammar Python3;

// -------Parser Rules---------
program: (statement NEWLINE+)* statement? EOF; // each statement must end with a new line except the last one

// Each statement (line)
statement: assignment;

// Possible assignments
assignment: ID '=' expression
    | ID '=' array
    | ID assignmentOperator expression;

// Expressions used in assignment
expression: value
    | '-' expression // Handle negative expressions
    | expression operator expression; // Handle multiple expressions

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