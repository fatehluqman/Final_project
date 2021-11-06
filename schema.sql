-- Table: public.cy_stats

-- DROP TABLE public.cy_stats;

CREATE TABLE IF NOT EXISTS public.stats
(
    index bigint,
    "Position" bigint,
    "Season" text COLLATE pg_catalog."default",
    "Tm" text COLLATE pg_catalog."default",
    "G" bigint,
    "W" bigint,
    "L" bigint,
    "Win_pct" double precision,
    "MOV" double precision,
    "SOS" double precision,
    "SRS" double precision,
    "Pace" double precision,
    "ORtg" double precision,
    "DRtg" double precision,
    "eFG_pct" double precision,
    "TS_pct" double precision,
    "TOV_pct" double precision,
    "ORB_pct" double precision,
    "FT_FGA" double precision,
    "Opp_eFG_pct" double precision,
    "Opp_TS_pct" double precision,
    "Opp_TOV_pct" double precision,
    "Opp_ORB_pct" double precision,
    "Opp_FT_FGA" double precision
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.stats
    OWNER to postgres;
-- Index: ix_stats_index

-- DROP INDEX public.ix_stats_index;

CREATE INDEX ix_stats_index
    ON public.stats USING btree
    (index ASC NULLS LAST)
    TABLESPACE pg_default;

CREATE TABLE IF NOT EXISTS public.cy_stats
(
    index bigint,
    "Position" bigint,
    "Season" text COLLATE pg_catalog."default",
    "Tm" text COLLATE pg_catalog."default",
    "G" bigint,
    "W" bigint,
    "L" bigint,
    "Win_pct" double precision,
    "MOV" double precision,
    "SOS" double precision,
    "SRS" double precision,
    "Pace" double precision,
    "ORtg" double precision,
    "DRtg" double precision,
    "eFG_pct" double precision,
    "TS_pct" double precision,
    "TOV_pct" double precision,
    "ORB_pct" double precision,
    "FT_FGA" double precision,
    "Opp_eFG_pct" double precision,
    "Opp_TS_pct" double precision,
    "Opp_TOV_pct" double precision,
    "Opp_ORB_pct" double precision,
    "Opp_FT_FGA" double precision
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.cy_stats
    OWNER to postgres;
-- Index: ix_cy_stats_index

-- DROP INDEX public.ix_cy_stats_index;

CREATE INDEX ix_cy_stats_index
    ON public.cy_stats USING btree
    (index ASC NULLS LAST)
    TABLESPACE pg_default;