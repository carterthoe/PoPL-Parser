grammar Python3;

// -------Parser Rules---------
program: NEWLINE* (statement NEWLINE+)* statement? EOF; // each statement must end with a new line except the last one

// Each statement (line)
statement: assignment;

// Possible assignments
assignment: ID '=' expression
    | ID '=' array
    | ID assignmentOperator expression;

// Expressions used in assignment
expression: value
    | '-' expression // Handle negative expressions
    | addexpr 
    ;
    
addexpr: mulexpr (asoperator mulexpr)*; //AS is grouped second
mulexpr: value (mdoperator value)*; //MD is grouped first

// Operators used in assignment (PEMDAS)

asoperator: '+' //Add and Subtract from PEMDAS
    | '-' ;
    
mdoperator: '*' //Mult Div and Mod from PEMDAS
    | '/'
    | '%';

// Assignment operators
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
array: '[' (expression (',' expression)*)? ']';



// -------Lexer Rules---------
BOOL: 'True' | 'False';

FLOAT: [0-9]+'.'[0-9]+;

INT: [0-9]+;

STRING: '"' (~["\n])* '"'
    | '\'' (~['\n])* '\'';
    
ID: [a-zA-Z_][a-zA-Z0-9_]*;

NEWLINE: '\n';

WS: [ \t]+ -> skip;
