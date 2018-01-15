
select * from property_tax_report
limit 100


create table "property_tax_report" (
    "pid" text,
    "legal_type" text,
    "folio" text,
    "land_coordinate" text,
    "zone_name" text,
    "zone_category" text,
    "lot" text,
    "block" text,
    "plan" text,
    "district_lot" text,
    "from_civic_number" text,
    "to_civic_number" text,
    "street_name" text,
    "property_postal_code" text,
    "narrative_legal_line1" text,
    "narrative_legal_line2" text,
    "narrative_legal_line3" text,
    "narrative_legal_line4" text,
    "narrative_legal_line5" text,
    "current_land_value" text,
    "current_improvement_value" text,
    "tax_assessment_year" text,
    "previous_land_value" text,
    "previous_improvement_value" text,
    "year_built" text,
    "big_improvement_year" text,
    "tax_levy" text,
    "neighbourhood_code" text
);

COPY mytable FROM '/path/to/csv/file' WITH CSV HEADER;


SELECT ST_AsMVT(q, 'test', 4096, 'geom') FROM (SELECT 1 AS c1,
    ST_AsMVTGeom(ST_GeomFromText('POLYGON ((35 10, 45 45, 15 40, 10 20, 35 10), (20 30, 35 35, 30 20, 20 30))'),
    ST_MakeBox2D(ST_Point(0, 0), ST_Point(4096, 4096)), 4096, 0, false) AS geom) AS q;
    
select *, box2d(geom) from van_parcels limit 10;


With dupes as (
select geom, count(*) from van_parcels vp
group by geom
having count(*) > 1
)
select * from dupes d
join van_parcels vp on d.geom = vp.geom
order by d.geom, vp.civic_no

select * from van_parcels_for_export
limit 10;

CREATE OR REPLACE VIEW public.van_parcels_for_export AS
 SELECT vp.id,
        vp.civic_no || ' ' || vp.streetname address,
        ST_Area(ST_Transform(geom, utmzone(ST_Centroid(geom)))) area_sq_metres,
        vp.geom
 FROM van_parcels vp;

ALTER TABLE public.van_parcels_for_export
    OWNER TO docker;



SELECT *, 
ST_Area(
ST_Transform(geom, utmzone(ST_Centroid(geom))
)) AreaSquareMetres


SELECT ST_AsMVT(tile) 
FROM 
(SELECT id, name, 
 ST_AsMVTGeom(geom, 
              ST_Makebox2d(ST_transform(ST_SetSrid(ST_MakePoint(%s,%s),4326),3857),ST_transform(ST_SetSrid(ST_MakePoint(%s,%s),4326),3857)), 
              4096, 0, false) AS geom FROM van_parcels) AS tile
              
select ST_Makebox2d(ST_transform(ST_SetSrid(ST_MakePoint(-123.1787,49.23912),4326),3857),
                                 ST_transform(ST_SetSrid(ST_MakePoint(-123.1348,49.21042),4326),3857))
              
              
              
select * from van_parcels
where geom && ST_Makebox2d(ST_transform(ST_SetSrid(ST_MakePoint(-123.1787,49.25346),4326),3857),
                           ST_transform(ST_SetSrid(ST_MakePoint(-123.1567,49.2678),4326),3857))
                           

select * from van_parcels
where geom && ST_Makebox2d(ST_MakePoint(-123.1787,49.25346),
                           ST_MakePoint(-123.1567,49.2678))