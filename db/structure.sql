SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cargos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargos (
    id bigint NOT NULL,
    truck_id bigint,
    delivery_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cargos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cargos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cargos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cargos_id_seq OWNED BY public.cargos.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities (
    id bigint NOT NULL,
    name character varying,
    state character varying,
    country character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cities_distances_collections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities_distances_collections (
    id bigint NOT NULL,
    json_data jsonb DEFAULT '"{}"'::jsonb NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cities_distances_collections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cities_distances_collections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cities_distances_collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cities_distances_collections_id_seq OWNED BY public.cities_distances_collections.id;


--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: deliveries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.deliveries (
    id bigint NOT NULL,
    picking_time_id bigint,
    load_time_id bigint,
    transportation_time_id bigint,
    receive_time_id bigint,
    storage_time_id bigint,
    delivery_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    total_duration integer
);


--
-- Name: deliveries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.deliveries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: deliveries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.deliveries_id_seq OWNED BY public.deliveries.id;


--
-- Name: distribution_methods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.distribution_methods (
    id bigint NOT NULL,
    name character varying,
    short_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: distribution_methods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.distribution_methods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: distribution_methods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.distribution_methods_id_seq OWNED BY public.distribution_methods.id;


--
-- Name: distribution_methods_parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.distribution_methods_parameters (
    id bigint NOT NULL,
    distribution_method_id bigint,
    distribution_parameter_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: distribution_methods_parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.distribution_methods_parameters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: distribution_methods_parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.distribution_methods_parameters_id_seq OWNED BY public.distribution_methods_parameters.id;


--
-- Name: distribution_parameters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.distribution_parameters (
    id bigint NOT NULL,
    name character varying,
    symbol character varying,
    uppercase boolean,
    meaning character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: distribution_parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.distribution_parameters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: distribution_parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.distribution_parameters_id_seq OWNED BY public.distribution_parameters.id;


--
-- Name: drivers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.drivers (
    id bigint NOT NULL,
    name character varying,
    age integer,
    contact character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: drivers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.drivers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: drivers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.drivers_id_seq OWNED BY public.drivers.id;


--
-- Name: load_times; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.load_times (
    id bigint NOT NULL,
    duration_time integer,
    event boolean,
    load_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    start_time timestamp without time zone
);


--
-- Name: load_times_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.load_times_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: load_times_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.load_times_id_seq OWNED BY public.load_times.id;


--
-- Name: picking_times; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.picking_times (
    id bigint NOT NULL,
    duration_time integer,
    start_time timestamp without time zone,
    number_of_items integer,
    number_of_items_type integer,
    picking_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    event boolean DEFAULT false
);


--
-- Name: picking_times_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.picking_times_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: picking_times_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.picking_times_id_seq OWNED BY public.picking_times.id;


--
-- Name: receive_times; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.receive_times (
    id bigint NOT NULL,
    duration_time integer,
    event boolean,
    received_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    start_time timestamp without time zone
);


--
-- Name: receive_times_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.receive_times_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: receive_times_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.receive_times_id_seq OWNED BY public.receive_times.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: simulate_deliveries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.simulate_deliveries (
    id bigint NOT NULL,
    label character varying,
    simulation_data jsonb,
    steps jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: simulate_deliveries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.simulate_deliveries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: simulate_deliveries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.simulate_deliveries_id_seq OWNED BY public.simulate_deliveries.id;


--
-- Name: storage_times; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.storage_times (
    id bigint NOT NULL,
    duration_time integer,
    event boolean,
    storage_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    start_time timestamp without time zone
);


--
-- Name: storage_times_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.storage_times_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: storage_times_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.storage_times_id_seq OWNED BY public.storage_times.id;


--
-- Name: transportation_times; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transportation_times (
    id bigint NOT NULL,
    duration_time integer,
    event boolean,
    transportation_date timestamp without time zone,
    origin_city_id bigint,
    destination_city_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    start_time timestamp without time zone,
    distance integer
);


--
-- Name: transportation_times_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transportation_times_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transportation_times_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transportation_times_id_seq OWNED BY public.transportation_times.id;


--
-- Name: trucks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trucks (
    id bigint NOT NULL,
    driver_id bigint,
    model character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: trucks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trucks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trucks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trucks_id_seq OWNED BY public.trucks.id;


--
-- Name: cargos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargos ALTER COLUMN id SET DEFAULT nextval('public.cargos_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: cities_distances_collections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities_distances_collections ALTER COLUMN id SET DEFAULT nextval('public.cities_distances_collections_id_seq'::regclass);


--
-- Name: deliveries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deliveries ALTER COLUMN id SET DEFAULT nextval('public.deliveries_id_seq'::regclass);


--
-- Name: distribution_methods id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_methods ALTER COLUMN id SET DEFAULT nextval('public.distribution_methods_id_seq'::regclass);


--
-- Name: distribution_methods_parameters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_methods_parameters ALTER COLUMN id SET DEFAULT nextval('public.distribution_methods_parameters_id_seq'::regclass);


--
-- Name: distribution_parameters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_parameters ALTER COLUMN id SET DEFAULT nextval('public.distribution_parameters_id_seq'::regclass);


--
-- Name: drivers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.drivers ALTER COLUMN id SET DEFAULT nextval('public.drivers_id_seq'::regclass);


--
-- Name: load_times id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.load_times ALTER COLUMN id SET DEFAULT nextval('public.load_times_id_seq'::regclass);


--
-- Name: picking_times id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.picking_times ALTER COLUMN id SET DEFAULT nextval('public.picking_times_id_seq'::regclass);


--
-- Name: receive_times id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.receive_times ALTER COLUMN id SET DEFAULT nextval('public.receive_times_id_seq'::regclass);


--
-- Name: simulate_deliveries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.simulate_deliveries ALTER COLUMN id SET DEFAULT nextval('public.simulate_deliveries_id_seq'::regclass);


--
-- Name: storage_times id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.storage_times ALTER COLUMN id SET DEFAULT nextval('public.storage_times_id_seq'::regclass);


--
-- Name: transportation_times id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transportation_times ALTER COLUMN id SET DEFAULT nextval('public.transportation_times_id_seq'::regclass);


--
-- Name: trucks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trucks ALTER COLUMN id SET DEFAULT nextval('public.trucks_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: cargos cargos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargos
    ADD CONSTRAINT cargos_pkey PRIMARY KEY (id);


--
-- Name: cities_distances_collections cities_distances_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities_distances_collections
    ADD CONSTRAINT cities_distances_collections_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: deliveries deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT deliveries_pkey PRIMARY KEY (id);


--
-- Name: distribution_methods_parameters distribution_methods_parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_methods_parameters
    ADD CONSTRAINT distribution_methods_parameters_pkey PRIMARY KEY (id);


--
-- Name: distribution_methods distribution_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_methods
    ADD CONSTRAINT distribution_methods_pkey PRIMARY KEY (id);


--
-- Name: distribution_parameters distribution_parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_parameters
    ADD CONSTRAINT distribution_parameters_pkey PRIMARY KEY (id);


--
-- Name: drivers drivers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.drivers
    ADD CONSTRAINT drivers_pkey PRIMARY KEY (id);


--
-- Name: load_times load_times_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.load_times
    ADD CONSTRAINT load_times_pkey PRIMARY KEY (id);


--
-- Name: picking_times picking_times_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.picking_times
    ADD CONSTRAINT picking_times_pkey PRIMARY KEY (id);


--
-- Name: receive_times receive_times_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.receive_times
    ADD CONSTRAINT receive_times_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: simulate_deliveries simulate_deliveries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.simulate_deliveries
    ADD CONSTRAINT simulate_deliveries_pkey PRIMARY KEY (id);


--
-- Name: storage_times storage_times_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.storage_times
    ADD CONSTRAINT storage_times_pkey PRIMARY KEY (id);


--
-- Name: transportation_times transportation_times_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transportation_times
    ADD CONSTRAINT transportation_times_pkey PRIMARY KEY (id);


--
-- Name: trucks trucks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trucks
    ADD CONSTRAINT trucks_pkey PRIMARY KEY (id);


--
-- Name: cities_dist_coll_destination_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cities_dist_coll_destination_id ON public.cities_distances_collections USING btree (((json_data ->> 'destination_id'::text)));


--
-- Name: cities_dist_coll_destination_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cities_dist_coll_destination_name ON public.cities_distances_collections USING btree (((json_data ->> 'destination_name'::text)));


--
-- Name: cities_dist_coll_distance_value; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cities_dist_coll_distance_value ON public.cities_distances_collections USING btree (((json_data ->> 'distance_value'::text)));


--
-- Name: cities_dist_coll_origin_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cities_dist_coll_origin_id ON public.cities_distances_collections USING btree (((json_data ->> 'origin_id'::text)));


--
-- Name: cities_dist_coll_origin_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX cities_dist_coll_origin_name ON public.cities_distances_collections USING btree (((json_data ->> 'origin_name'::text)));


--
-- Name: index_cargos_on_delivery_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cargos_on_delivery_id ON public.cargos USING btree (delivery_id);


--
-- Name: index_cargos_on_truck_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cargos_on_truck_id ON public.cargos USING btree (truck_id);


--
-- Name: index_cities_distances_collections_on_json_data; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cities_distances_collections_on_json_data ON public.cities_distances_collections USING gin (json_data);


--
-- Name: index_deliveries_on_load_time_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_deliveries_on_load_time_id ON public.deliveries USING btree (load_time_id);


--
-- Name: index_deliveries_on_picking_time_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_deliveries_on_picking_time_id ON public.deliveries USING btree (picking_time_id);


--
-- Name: index_deliveries_on_receive_time_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_deliveries_on_receive_time_id ON public.deliveries USING btree (receive_time_id);


--
-- Name: index_deliveries_on_storage_time_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_deliveries_on_storage_time_id ON public.deliveries USING btree (storage_time_id);


--
-- Name: index_deliveries_on_transportation_time_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_deliveries_on_transportation_time_id ON public.deliveries USING btree (transportation_time_id);


--
-- Name: index_distribution_methods_parameters_on_distribution_method_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_distribution_methods_parameters_on_distribution_method_id ON public.distribution_methods_parameters USING btree (distribution_method_id);


--
-- Name: index_distribution_methods_parameters_on_distribution_param_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_distribution_methods_parameters_on_distribution_param_id ON public.distribution_methods_parameters USING btree (distribution_parameter_id);


--
-- Name: index_transportation_times_on_destination_city_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transportation_times_on_destination_city_id ON public.transportation_times USING btree (destination_city_id);


--
-- Name: index_transportation_times_on_origin_city_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transportation_times_on_origin_city_id ON public.transportation_times USING btree (origin_city_id);


--
-- Name: index_trucks_on_driver_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_trucks_on_driver_id ON public.trucks USING btree (driver_id);


--
-- Name: deliveries fk_rails_006d56e5b4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT fk_rails_006d56e5b4 FOREIGN KEY (storage_time_id) REFERENCES public.storage_times(id);


--
-- Name: transportation_times fk_rails_032c7214c9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transportation_times
    ADD CONSTRAINT fk_rails_032c7214c9 FOREIGN KEY (origin_city_id) REFERENCES public.cities(id);


--
-- Name: distribution_methods_parameters fk_rails_05f58e2456; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_methods_parameters
    ADD CONSTRAINT fk_rails_05f58e2456 FOREIGN KEY (distribution_method_id) REFERENCES public.distribution_methods(id);


--
-- Name: deliveries fk_rails_3fbc1f60a9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT fk_rails_3fbc1f60a9 FOREIGN KEY (transportation_time_id) REFERENCES public.transportation_times(id);


--
-- Name: distribution_methods_parameters fk_rails_552ce28228; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.distribution_methods_parameters
    ADD CONSTRAINT fk_rails_552ce28228 FOREIGN KEY (distribution_parameter_id) REFERENCES public.distribution_parameters(id);


--
-- Name: deliveries fk_rails_67a574375d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT fk_rails_67a574375d FOREIGN KEY (picking_time_id) REFERENCES public.picking_times(id);


--
-- Name: trucks fk_rails_77c8babecf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trucks
    ADD CONSTRAINT fk_rails_77c8babecf FOREIGN KEY (driver_id) REFERENCES public.drivers(id);


--
-- Name: deliveries fk_rails_7d5ede56bf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT fk_rails_7d5ede56bf FOREIGN KEY (load_time_id) REFERENCES public.load_times(id);


--
-- Name: cargos fk_rails_7f64af6cb1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargos
    ADD CONSTRAINT fk_rails_7f64af6cb1 FOREIGN KEY (delivery_id) REFERENCES public.deliveries(id);


--
-- Name: cargos fk_rails_7fee432ebc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargos
    ADD CONSTRAINT fk_rails_7fee432ebc FOREIGN KEY (truck_id) REFERENCES public.trucks(id);


--
-- Name: transportation_times fk_rails_d45a734b89; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transportation_times
    ADD CONSTRAINT fk_rails_d45a734b89 FOREIGN KEY (destination_city_id) REFERENCES public.cities(id);


--
-- Name: deliveries fk_rails_ef50f59024; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deliveries
    ADD CONSTRAINT fk_rails_ef50f59024 FOREIGN KEY (receive_time_id) REFERENCES public.receive_times(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20180403193932'),
('20180403193933'),
('20180403193934'),
('20180403193935'),
('20180403193936'),
('20180403193937'),
('20180403193939'),
('20180403193940'),
('20180403193941'),
('20180403193943'),
('20180408032219'),
('20180419203422'),
('20180531183110'),
('20180602215511'),
('20180603033923'),
('20180616204541'),
('20191215200030'),
('20191215200031'),
('20191215200034'),
('20200102035245');


