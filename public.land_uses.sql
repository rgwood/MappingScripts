-- Table: public.land_uses

-- DROP TABLE public.land_uses;

CREATE TABLE public.land_uses
(
    id integer NOT NULL,
    lu_code character varying(255) COLLATE pg_catalog."default",
    lu_des character varying(255) COLLATE pg_catalog."default",
    muni character varying(255) COLLATE pg_catalog."default",
    muni_num integer,
    muni_code character varying(255) COLLATE pg_catalog."default",
    area integer,
    display integer,
    area_st double precision,
    length_st double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    geometry geometry(Geometry,4617) NOT NULL,
    centroid geometry(Point,4617) NOT NULL,
    CONSTRAINT land_uses_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.land_uses
    OWNER to docker;

GRANT SELECT ON TABLE public.land_uses TO louie;

GRANT ALL ON TABLE public.land_uses TO mountainmath;

GRANT SELECT ON TABLE public.land_uses TO readonly;

GRANT SELECT ON TABLE public.land_uses TO reilly;

-- Index: index_land_uses_on_centroid

-- DROP INDEX public.index_land_uses_on_centroid;

CREATE INDEX index_land_uses_on_centroid
    ON public.land_uses USING gist
    (centroid)
    TABLESPACE pg_default;

-- Index: index_land_uses_on_geometry

-- DROP INDEX public.index_land_uses_on_geometry;

CREATE INDEX index_land_uses_on_geometry
    ON public.land_uses USING gist
    (geometry)
    TABLESPACE pg_default;