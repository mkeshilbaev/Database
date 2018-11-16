CREATE DATABASE lab9;


CREATE FUNCTION sum_of_two_numbers(m int, n int)
RETURNS int AS $$
     BEGIN
           RETURN m + n;
     end;
$$ LANGUAGE plpgsql;

SELECT sum_of_two_numbers(10, 50);

CREATE FUNCTION fun_to_test () RETURNS double precision
  AS $TEST$
  BEGIN
   RETURN 4.295945126E-29;
  END;
  $TEST$ LANGUAGE plpgsql;

SELECT fun_to_test();

CREATE FUNCTION today_is() RETURNS CHAR(22) AS '
BEGIN
  RETURN ''Today''''is ''|| CAST(CURRENT_DATE AS CHAR(10));
end;
'
  LANGUAGE PLPGSQL;

SELECT today_is();