-- SELECT * FROM generate_series(1,5); 
-- SELECT * FROM generate_series(0,100,25); 
-- SELECT d 
--     FROM generate_series(
--         DATE '2019-01-01',
--         DATE '2019-01-05',
--         INTERVAL '1 day'
--     ) g(d);
-- DROP TABLE IF EXISTS dw.dim_date CASCADE;
-- CREATE TABLE dw.dim_date(
--     date_sk INTEGER PRIMARY KEY,
--     full_date DATE NOT NULL UNIQUE,
--     day SMALLINT NOT NULL,
--     month SMALLINT NOT NULL,
--     month_name VARCHAR(15) NOT NULL,
--     quarter SMALLINT NOT NULL,
--     year SMALLINT NOT NULL,
--     day_of_week VARCHAR(15) NOT NULL,
--     is_weekend BOOLEAN NOT NULL);

INSERT INTO dw.dim_date
SELECT 
    CAST(TO_CHAR(d, 'YYYYMMDD') AS INTEGER),
    d::DATE,
    EXTRACT(DAY FROM d)::SMALLINT,
    EXTRACT(MONTH FROM d)::SMALLINT,
    TO_CHAR(d, 'TMMonth'),
    EXTRACT(QUARTER FROM d)::SMALLINT,
    EXTRACT(YEAR FROM d)::SMALLINT,
    TO_CHAR(d, 'TMDay'),
    EXTRACT(DOW FROM d) IN(0, 6)
    -- o TMDay - transofrma primeira letra maiuscula se fose TMDAY seria tudo maiusculo
FROM generate_series(
    DATE '2019-01-01', DATE '2019-12-31', INTERVAL '1 day'
) g(d);
-- essa g nome do select e d nome da coluna

SELECT * FROM dw.dim_date