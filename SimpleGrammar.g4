/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
grammar SimpleGrammar;



programa :(funcao|varGlobal)+;


varGlobal:TYPE ID PV;


funcao: TYPE ID '('arglist?')'corpo;




arglist: variavel(','variavel)*;
  
variavel:  TYPE ID;

corpo: '{'celem+'}';


celem: variavel PV
        |lCondicao
        |lCiclo
        |atrib PV;


/**Condições*/
  
lCondicao: 'if' '('cond')' ('then')?corpo ('else'corpo)?;

cond:term (SLOGIC term)*;


atrib:(TYPE)? ID'='exp; 

lCiclo: 'while' '('cond')'corpo;
       
  

/*Para retirar recur à esquera e só um termo */
exp: ID '('funcArg')'(OPR term)*
   |OPR? term OPR ID '('funcArg')'
   |term (OPR term)*;


/**Para algo main(a,1+2)*/
funcArg:exp (',' exp)*;



    
    
        
/*              SIMBOLOS TERMINAIS                  */        

term:NUMBER|ID;

/*Números reais*/
NUMBER: [0-9]+('.')?[0-9]*;

/*Operadores lógicos*/
OPR : ('+'|'-'|'*'|'/');

TYPE : ('int'|'char'|'float');

ID :     ('a'..'z')('a'..'z'|'A'..'Z')*;

/*white space*/
WS:     (' '|'\t'|'\n')+    {skip();};

/*Ponto e virgula*/
PV: ';';
/*Operadores lógicos*/
SLOGIC: ('>'|'<'|'=='|'>='|'<='|'!=');