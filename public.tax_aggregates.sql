-- Table: public.tax_aggregates

-- DROP TABLE public.tax_aggregates;

CREATE TABLE public.tax_aggregates
(
    id integer NOT NULL DEFAULT nextval('tax_aggregates_id_seq'::regclass),
    area double precision,
    aggregate_level character varying(255) COLLATE pg_catalog."default",
    land_2014 bigint,
    land_2013 bigint,
    land_2012 bigint,
    land_2011 bigint,
    land_2010 bigint,
    land_2009 bigint,
    land_2008 bigint,
    land_2007 bigint,
    land_2006 bigint,
    building_2014 bigint,
    building_2013 bigint,
    building_2012 bigint,
    building_2011 bigint,
    building_2010 bigint,
    building_2009 bigint,
    building_2008 bigint,
    building_2007 bigint,
    building_2006 bigint,
    zone_name character varying(255) COLLATE pg_catalog."default",
    name character varying(255) COLLATE pg_catalog."default",
    sub_area double precision,
    tax_coord integer,
    parent_id integer,
    neighbourhood integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    geometry geometry(MultiPolygon,4617) NOT NULL,
    centroid geometry(Point,4617) NOT NULL,
    year integer,
    tax_2006 integer,
    tax_2007 integer,
    tax_2008 integer,
    tax_2009 integer,
    tax_2010 integer,
    tax_2011 integer,
    tax_2012 integer,
    tax_2013 integer,
    tax_2014 integer,
    flag integer DEFAULT 0,
    children_count integer NOT NULL DEFAULT 0,
    heritage integer DEFAULT 0,
    property_count integer NOT NULL DEFAULT 0,
    unit_count integer NOT NULL DEFAULT 0,
    aggregation_level integer NOT NULL DEFAULT 0,
    tax_2015 integer,
    land_2015 bigint,
    building_2015 bigint,
    tax_2016 bigint,
    land_2016 bigint,
    building_2016 bigint,
    first_tax_year integer,
    first_land bigint,
    first_building bigint,
    lu_code character varying(255) COLLATE pg_catalog."default",
    lu_flag integer DEFAULT 0,
    building_footprint geometry(MultiPolygon,4617),
    fs double precision DEFAULT 0,
    site_id integer,
    duplicate integer DEFAULT 0,
    dissemination_area_id integer,
    angle double precision,
    year_improved integer,
    tax_2017 bigint,
    land_2017 bigint,
    building_2017 bigint,
    geo geometry(MultiPolygon,3857),
    areai integer,
    land_2018 bigint,
    building_2018 bigint,
    CONSTRAINT tax_aggregates_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.tax_aggregates
    OWNER to mountainmath;

GRANT SELECT ON TABLE public.tax_aggregates TO louie;

GRANT ALL ON TABLE public.tax_aggregates TO mountainmath;

GRANT SELECT ON TABLE public.tax_aggregates TO readonly;

GRANT SELECT ON TABLE public.tax_aggregates TO reilly;

-- Index: index_tax_aggregates_on_aggregation_level_and_geometry

-- DROP INDEX public.index_tax_aggregates_on_aggregation_level_and_geometry;

CREATE INDEX index_tax_aggregates_on_aggregation_level_and_geometry
    ON public.tax_aggregates USING gist
    (aggregation_level, geometry)
    TABLESPACE pg_default;

-- Index: index_tax_aggregates_on_centroid

-- DROP INDEX public.index_tax_aggregates_on_centroid;

CREATE INDEX index_tax_aggregates_on_centroid
    ON public.tax_aggregates USING gist
    (centroid)
    TABLESPACE pg_default;

-- Index: index_tax_aggregates_on_dissemination_area_id

-- DROP INDEX public.index_tax_aggregates_on_dissemination_area_id;

CREATE INDEX index_tax_aggregates_on_dissemination_area_id
    ON public.tax_aggregates USING btree
    (dissemination_area_id)
    TABLESPACE pg_default;

-- Index: index_tax_aggregates_on_geometry

-- DROP INDEX public.index_tax_aggregates_on_geometry;

CREATE INDEX index_tax_aggregates_on_geometry
    ON public.tax_aggregates USING gist
    (geometry)
    TABLESPACE pg_default;

-- Index: index_tax_aggregates_on_lu_code

-- DROP INDEX public.index_tax_aggregates_on_lu_code;

CREATE INDEX index_tax_aggregates_on_lu_code
    ON public.tax_aggregates USING btree
    (lu_code COLLATE pg_catalog."default")
    TABLESPACE pg_default;

-- Index: index_tax_aggregates_on_parent_id

-- DROP INDEX public.index_tax_aggregates_on_parent_id;

CREATE INDEX index_tax_aggregates_on_parent_id
    ON public.tax_aggregates USING btree
    (parent_id)
    TABLESPACE pg_default;

-- Index: index_tax_aggregates_on_site_id

-- DROP INDEX public.index_tax_aggregates_on_site_id;

CREATE INDEX index_tax_aggregates_on_site_id
    ON public.tax_aggregates USING btree
    (site_id)
    TABLESPACE pg_default;