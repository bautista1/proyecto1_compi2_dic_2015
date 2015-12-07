package fase1;

import java_cup.runtime.Symbol;
import java.util.ArrayList;
//import logica.*;
//import principal.*;
//import tecumhuman_p1compi2_cliente.*;
%%

%public
%class lexicoF1
%cupsym sF1
%cup
%unicode
%line
%column
%char
%ignorecase

%{
//VARIALES Y METODOS DEL SCANER
/*public ArrayList<TokenError> tabla_Errores;

//public void setTablaErrores(ArrayList<TokenError> tabla){
  //  tabla_Errores = tabla;
//}
*/
private void ErrorScan(String simboloEd, String columna, String linea, String descripcion){
//ventanaPrincipal.errorGlobal(simboloEd,columna,linea,"Error lexico"); 
System.err.println("Error lexico "+simboloEd);
}

%}

digito  = [0-9]
caracter=[a-zA-Z]


comentarioMultiple="/"[*] [^*]+[*]"/" 
comentarioLinea="/"{2} ([^\r\n\t])+
path=[\w+\/]+\.\w{3}
//lo utilizado es esto de abajo
num  = {digito}+
ent=[-]?{num}
deci = [-]?{num}+["."]{num}+
decimal = ("-" {deci} | {deci})
id={caracter} ({caracter}|{num}|"_")*
caracterC=["'"]{caracter}["'"]
cadena  =   [\"][^\n\"]*[\"]
comentario=({comentarioMultiple}|{comentarioLinea})
//lo utilizado es esto de arriba

%%

"int"         {return new Symbol(sF1.enteroL, yycolumn+1,yyline+1,new String(yytext()));}
"double"           {return new Symbol(sF1.doubleL, yycolumn+1,yyline+1,new String(yytext()));}
"string"           {return new Symbol(sF1.cadenaL, yycolumn+1,yyline+1,new String(yytext()));}
"char"           {return new Symbol(sF1.caracterL, yycolumn+1,yyline+1,new String(yytext()));}

"bool"           {return new Symbol(sF1.boolL, yycolumn+1,yyline+1,new String(yytext()));}
"void"           {return new Symbol(sF1.vacioL, yycolumn+1,yyline+1,new String(yytext()));}
"class"           {return new Symbol(sF1.clasesL, yycolumn+1,yyline+1,new String(yytext()));}
"new"           {return new Symbol(sF1.nuevo, yycolumn+1,yyline+1,new String(yytext()));}
"print"           {return new Symbol(sF1.imprimir, yycolumn+1,yyline+1,new String(yytext()));}

"false"           {return new Symbol(sF1.falso, yycolumn+1,yyline+1,new String(yytext()));}
"true"           {return new Symbol(sF1.verdadero, yycolumn+1,yyline+1,new String(yytext()));}

"if"           {return new Symbol(sF1.si, yycolumn+1,yyline+1,new String(yytext()));}
"else"           {return new Symbol(sF1.sino, yycolumn+1,yyline+1,new String(yytext()));}
"elseif"           {return new Symbol(sF1.sinosi, yycolumn+1,yyline+1,new String(yytext()));}

"switch"           {return new Symbol(sF1.interruptor, yycolumn+1,yyline+1,new String(yytext()));}
"case"           {return new Symbol(sF1.encaso, yycolumn+1,yyline+1,new String(yytext()));}
"default"           {return new Symbol(sF1.pordefecto, yycolumn+1,yyline+1,new String(yytext()));}
"break"           {return new Symbol(sF1.detener, yycolumn+1,yyline+1,new String(yytext()));}

"continue"           {return new Symbol(sF1.continuar, yycolumn+1,yyline+1,new String(yytext()));}


"while"           {return new Symbol(sF1.mientras, yycolumn+1,yyline+1,new String(yytext()));}
"do"           {return new Symbol(sF1.hacer, yycolumn+1,yyline+1,new String(yytext()));}

"repeat"           {return new Symbol(sF1.repite, yycolumn+1,yyline+1,new String(yytext()));}
"until"           {return new Symbol(sF1.hasta, yycolumn+1,yyline+1,new String(yytext()));}

"for"           {return new Symbol(sF1.para, yycolumn+1,yyline+1,new String(yytext()));}

"loop"           {return new Symbol(sF1.ciclo, yycolumn+1,yyline+1,new String(yytext()));}


"parseint"           {return new Symbol(sF1.casteoInt, yycolumn+1,yyline+1,new String(yytext()));}
"parsedouble"           {return new Symbol(sF1.casteoDouble, yycolumn+1,yyline+1,new String(yytext()));}


"inttostr"           {return new Symbol(sF1.casteoIString, yycolumn+1,yyline+1,new String(yytext()));}
"doubletostr"           {return new Symbol(sF1.casteoDString, yycolumn+1,yyline+1,new String(yytext()));}

"dobletoint"           {return new Symbol(sF1.casteoDI, yycolumn+1,yyline+1,new String(yytext()));}

"return"           {return new Symbol(sF1.retorno, yycolumn+1,yyline+1,new String(yytext()));}

"null"           {return new Symbol(sF1.nulo, yycolumn+1,yyline+1,new String(yytext()));}

"public"           {return new Symbol(sF1.publico, yycolumn+1,yyline+1,new String(yytext()));}
"private"           {return new Symbol(sF1.privado, yycolumn+1,yyline+1,new String(yytext()));}
"protected"           {return new Symbol(sF1.protegido, yycolumn+1,yyline+1,new String(yytext()));}

"import"           {return new Symbol(sF1.importar, yycolumn+1,yyline+1,new String(yytext()));}
"extends"           {return new Symbol(sF1.herencia, yycolumn+1,yyline+1,new String(yytext()));}
"super"           {return new Symbol(sF1.supeL, yycolumn+1,yyline+1,new String(yytext()));}
"<!override!>"           {return new Symbol(sF1.sobreescritura, yycolumn+1,yyline+1,new String(yytext()));}
"this"           {return new Symbol(sF1.este, yycolumn+1,yyline+1,new String(yytext()));}

"\."        {return new Symbol(sF1.punto, yycolumn+1,yyline+1,new String(yytext()));}
"("        {return new Symbol(sF1.parA, yycolumn+1,yyline+1,new String(yytext()));}
")"         {return new Symbol(sF1.parC, yycolumn+1,yyline+1,new String(yytext()));}

"{"        {return new Symbol(sF1.llaveA, yycolumn+1,yyline+1,new String(yytext()));}
"}"         {return new Symbol(sF1.llaveC, yycolumn+1,yyline+1,new String(yytext()));}

"["        {return new Symbol(sF1.corA, yycolumn+1,yyline+1,new String(yytext()));}
"]"         {return new Symbol(sF1.corC, yycolumn+1,yyline+1,new String(yytext()));}

","        {return new Symbol(sF1.coma, yycolumn+1,yyline+1,new String(yytext()));}
":"        {return new Symbol(sF1.dosPuntos, yycolumn+1,yyline+1,new String(yytext()));}
"=>"        {return new Symbol(sF1.asignacion, yycolumn+1,yyline+1,new String(yytext()));}
";"        {return new Symbol(sF1.puntoComa, yycolumn+1,yyline+1,new String(yytext()));}

"¡"        {return new Symbol(sF1.negacion, yycolumn+1,yyline+1,new String(yytext()));}
"&&"        {return new Symbol(sF1.yLogico, yycolumn+1,yyline+1,new String(yytext()));}
"||"        {return new Symbol(sF1.oLogico, yycolumn+1,yyline+1,new String(yytext()));}
"??"        {return new Symbol(sF1.xorLogico, yycolumn+1,yyline+1,new String(yytext()));}

"=="        {return new Symbol(sF1.comparacion, yycolumn+1,yyline+1,new String(yytext()));}
"!="        {return new Symbol(sF1.distinto, yycolumn+1,yyline+1,new String(yytext()));}
">="        {return new Symbol(sF1.mayorIgual, yycolumn+1,yyline+1,new String(yytext()));}
"<="        {return new Symbol(sF1.menorIgual, yycolumn+1,yyline+1,new String(yytext()));}
">"        {return new Symbol(sF1.mayor, yycolumn+1,yyline+1,new String(yytext()));}
"<"        {return new Symbol(sF1.menor, yycolumn+1,yyline+1,new String(yytext()));}

"+"        {return new Symbol(sF1.suma, yycolumn+1,yyline+1,new String(yytext()));}
"-"        {return new Symbol(sF1.resta, yycolumn+1,yyline+1,new String(yytext()));}
"*"        {return new Symbol(sF1.por, yycolumn+1,yyline+1,new String(yytext()));}
"/"        {return new Symbol(sF1.div, yycolumn+1,yyline+1,new String(yytext()));}
"^"        {return new Symbol(sF1.pot, yycolumn+1,yyline+1,new String(yytext()));}
"++"        {return new Symbol(sF1.incremento, yycolumn+1,yyline+1,new String(yytext()));}
"--"        {return new Symbol(sF1.decremento, yycolumn+1,yyline+1,new String(yytext()));}

{ent}    {return new Symbol(sF1.num, yycolumn+1,yyline+1,new String(yytext()));}
{decimal}    {return new Symbol(sF1.decimal, yycolumn+1,yyline+1,new String(yytext()));}
{id}    {return new Symbol(sF1.id, yycolumn+1,yyline+1,new String(yytext()));}
{caracterC}    {return new Symbol(sF1.caracter, yycolumn+1,yyline+1,new String(yytext()));}
{path}    {return new Symbol(sF1.path, yycolumn+1,yyline+1,new String(yytext()));}
{cadena}   {return new Symbol(sF1.cadena, yycolumn+1,yyline+1,new String(yytext()));}
{comentario}   {}


/* BLANCOS */
[" "|\t|\r|\f|\n]+  {}

.                   {
                        System.out.println("Error Lexico -> Simbolo: \""+yytext()+"\" Linea: "+(yyline+1)+" Columna: "+(yycolumn+1) );
                    //    pantallaPincipal.errorLexLienzo(yytext(),""+ yycolumn,""+ yyline, "Lexico");
                     //tabla_Errores.add(new TokenError("Lexico","Lexema no pertenece al lenguaje",yytext(),String.valueOf(yyline+1),String.valueOf(yycolumn+1)));
//ventanaPrincipal.errorGlobal(yytext(),String.valueOf(yychar),String.valueOf(yyline),"Lexico");                      
}
