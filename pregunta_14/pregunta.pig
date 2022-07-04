/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       color 
   FROM 
       u 
   WHERE 
       color NOT LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/
Text = LOAD 'data.csv' USING PigStorage(',')
    AS (
            Id:int,
            Name:chararray,
            last_name:chararray,
            date:chararray,
            colour:chararray,
            count1:int
    );
specific_columns = FOREACH Text GENERATE colour;
simpleFilter = FILTER specific_columns BY NOT(colour MATCHES '^[b].*');
STORE simpleFilter INTO 'output';
