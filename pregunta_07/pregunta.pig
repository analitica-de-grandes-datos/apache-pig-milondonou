/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
Texto = LOAD 'data.tsv' using PigStorage('\t') AS (B1:chararray,B2:bag{},B3:[]);
Cantidad = FOREACH Texto GENERATE B1, COUNT(B2) as B2, SIZE(B3) as B3;
Orden = ORDER Cantidad by B1,B2,B3;
STORE Orden INTO './output' USING PigStorage(',');