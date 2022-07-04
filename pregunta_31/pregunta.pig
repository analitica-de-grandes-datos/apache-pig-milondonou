/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
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
Fecha = FOREACH Text GENERATE SUBSTRING(date,0,4);
Agrupar = GROUP Fecha BY $0;
Contar = FOREACH Agrupar GENERATE $0, COUNT($1);
STORE Contar INTO 'output' USING PigStorage(',');
