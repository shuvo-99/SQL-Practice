SELECT C.NAME FROM CITY C INNER JOIN COUNTRY CUN ON C.COUNTRYCODE = CUN.CODE WHERE CUN.CONTINENT = 'AFRICA';
