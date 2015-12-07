SET JAVA_HOME="C:\Program Files\Java\jdk1.8.0_05\bin"
SET PATH=%JAVA_HOME%;%PATH%
SET CLASSPATH=%JAVA_HOME%;
cd C:\Users\Alberth\Documents\NetBeansProjects\proyecto1_compi2_dic_2015\src\fase1
java -classpath C:\Fuentes1\ java_cup.Main -parser sintacticoF1 -symbols sF1 parser.cup
pause