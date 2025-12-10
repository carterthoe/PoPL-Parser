grammar Python3;

// -------Parser Rules---------

program
    : (NEWLINE | statement NEWLINE)* statement? NEWLINE* EOF
    ; // each statement must end with a new line except the last one

// Each statement (line)
statement: assignment
    | ifStatement
    | whileStatement
    | forStatement;
    
//reusable indented block
suite
    : (NEWLINE+ TAB+ statement NEWLINE*)+
    ;
    
//for statements
forStatement:
    FOR ID IN expression ':' suite
    ;
    
//while statements
whileStatement:
    WHILE condition ':' suite
    ;
    
    
//if statements
ifStatement:
    IF condition ':' suite 
    elifStatement* 
    elseStatement?
    ;
    
//else if statements
elifStatement
    : NEWLINE* TAB* ELIF condition ':' suite
    ;
    

//else statement
elseStatement
    : NEWLINE* TAB* ELSE ':' suite
    ;
    
    
condition:
    orTest;

orTest: andTest (OR andTest)*;

andTest: notTest(AND notTest)*;

notTest: NOT notTest
    | compareParenthesis;
    
compareParenthesis:comparison 
    | '(' condition ')';

comparison: expression (compareOperator expression)?;

//the compare operators
compareOperator:'=='
    | '!='
    | '<'
    | '<='
    | '>'
    | '>=' ;

// Possible assignments
assignment: ID '=' expression
    | ID '=' array
    | ID assignmentOperator expression;

// Expressions used in assignment
expression: addexpr 
    ;


//grouping for pemdas
addexpr: mulexpr (asoperator mulexpr)*; //AS is grouped second
mulexpr: unary (mdoperator unary)*; //MD is grouped first
unary: '-' unary | first ; //handles negatives

//allows an identifier or the RANGE keyword to be followed by parantheses and optional comma sperated args
functionCall
    : (ID | RANGE) '(' (expression (',' expression)*)? ')'
    ;

first
    : functionCall
    | value
    | '(' expression ')'
    ; //handles parenthesis

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
COMMENT: '#' ~[\r\n]* -> skip;
MULTI_COMMENT: '\'\'\'' ( . | '\r' | '\n' )*? '\'\'\'' -> skip;   // ''' ... ''' ;

BOOL: 'True' | 'False';
AND: 'and';
OR: 'or';
NOT: 'not';

FLOAT: [0-9]+'.'[0-9]+;

INT: [0-9]+;

STRING: '"' (~["\n])* '"'
    | '\'' (~['\n])* '\'';

IF: 'if';
ELIF: 'elif';
ELSE: 'else';
WHILE: 'while';
FOR: 'for';
IN: 'in';
RANGE: 'range';
    
ID: [a-zA-Z_][a-zA-Z0-9_]*;

NEWLINE : '\r'? '\n' ;

TAB: '\t';

WS: [ ]+ -> skip;
