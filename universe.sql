--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying NOT NULL,
    type character varying,
    orbital_period numeric,
    closest_approach_date date,
    has_tail boolean DEFAULT true
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    description text,
    has_life boolean DEFAULT false
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    age_in_millions_of_years integer,
    has_atmosphere boolean DEFAULT false NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer,
    has_life boolean DEFAULT false NOT NULL,
    planet_types text,
    distance_from_star numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    distance_from_earth numeric,
    is_spherical boolean DEFAULT true NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 'Periodic', 76, '2061-07-28', true);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'Non-Periodic', 2533, '2024-04-11', true);
INSERT INTO public.comet VALUES (3, 'Swift-Tuttle', 'Periodic', 133, '2126-07-04', true);
INSERT INTO public.comet VALUES (4, 'Encke', 'Periodic', 3.3, '2023-10-16', true);
INSERT INTO public.comet VALUES (5, 'Biela', 'Periodic', 6.6, '2025-01-17', true);
INSERT INTO public.comet VALUES (6, 'Hyakutake', 'Non-Periodic', 17000, '1996-03-25', true);
INSERT INTO public.comet VALUES (7, 'Lovejoy', 'Non-Periodic', 11, '2021-01-01', true);
INSERT INTO public.comet VALUES (8, 'Lulin', 'Non-Periodic', 88, '2023-06-22', true);
INSERT INTO public.comet VALUES (9, 'Neowise', 'Non-Periodic', 6800, '2020-07-23', true);
INSERT INTO public.comet VALUES (10, 'Kohoutek', 'Non-Periodic', 75, '2024-04-06', true);
INSERT INTO public.comet VALUES (11, 'C/2019 Y4', 'Non-Periodic', 13800, '2024-04-14', true);
INSERT INTO public.comet VALUES (12, 'C/2020 F3', 'Non-Periodic', 6800, '2020-07-23', true);
INSERT INTO public.comet VALUES (13, 'C/2017 K2', 'Non-Periodic', 24000, '2022-12-31', true);
INSERT INTO public.comet VALUES (14, 'C/2021 A1', 'Non-Periodic', 2400, '2023-02-15', true);
INSERT INTO public.comet VALUES (15, 'C/2018 W2', 'Non-Periodic', 3500, '2025-03-29', true);
INSERT INTO public.comet VALUES (16, 'C/2013 R1', 'Non-Periodic', 2175, '2024-05-10', true);
INSERT INTO public.comet VALUES (17, 'C/2022 E3', 'Non-Periodic', 6800, '2023-02-01', true);
INSERT INTO public.comet VALUES (18, 'C/2014 Q2', 'Non-Periodic', 5000, '2025-04-22', true);
INSERT INTO public.comet VALUES (19, 'C/2009 P1', 'Non-Periodic', 1400, '2022-11-12', true);
INSERT INTO public.comet VALUES (20, 'C/2011 L4', 'Non-Periodic', 2150, '2024-06-10', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13000, 'Our galaxy', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 'Nearest galaxy', false);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 8000, 'Spiral galaxy', false);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 3000, 'Triangle galaxy', false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 4000, 'Interacting galaxies', false);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 6000, 'Radio galaxy', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 4500, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 450, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 450, false);
INSERT INTO public.moon VALUES (4, 'Europa', 3, 3000, true);
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, 3000, true);
INSERT INTO public.moon VALUES (6, 'Callisto', 3, 3000, false);
INSERT INTO public.moon VALUES (7, 'Titan', 2, 1000, true);
INSERT INTO public.moon VALUES (8, 'Enceladus', 1, 1000, false);
INSERT INTO public.moon VALUES (9, 'Miranda', 2, 500, false);
INSERT INTO public.moon VALUES (10, 'Ariel', 2, 500, false);
INSERT INTO public.moon VALUES (11, 'Umbriel', 2, 500, false);
INSERT INTO public.moon VALUES (12, 'Oberon', 2, 500, false);
INSERT INTO public.moon VALUES (13, 'Titania', 2, 500, false);
INSERT INTO public.moon VALUES (14, 'Phoebe', 2, 450, false);
INSERT INTO public.moon VALUES (15, 'Iapetus', 2, 450, false);
INSERT INTO public.moon VALUES (16, 'Mimas', 1, 1000, false);
INSERT INTO public.moon VALUES (17, 'Rhea', 2, 1000, false);
INSERT INTO public.moon VALUES (18, 'Dione', 2, 1000, false);
INSERT INTO public.moon VALUES (19, 'Tethys', 2, 1000, false);
INSERT INTO public.moon VALUES (20, 'Hyperion', 2, 1000, false);
INSERT INTO public.moon VALUES (21, 'Janus', 2, 1000, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 'Terrestrial', 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, 'Terrestrial', 1.5);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, false, 'Gas Giant', 5.2);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, false, 'Gas Giant', 9.5);
INSERT INTO public.planet VALUES (5, 'Neptune', 1, false, 'Gas Giant', 30);
INSERT INTO public.planet VALUES (6, 'Venus', 1, false, 'Terrestrial', 0.72);
INSERT INTO public.planet VALUES (7, 'Mercury', 1, false, 'Terrestrial', 0.39);
INSERT INTO public.planet VALUES (8, 'Titan', 2, false, 'Moon', 1);
INSERT INTO public.planet VALUES (9, 'Ganymede', 3, false, 'Moon', 1);
INSERT INTO public.planet VALUES (10, 'Io', 3, false, 'Moon', 1);
INSERT INTO public.planet VALUES (11, 'Europa', 3, false, 'Moon', 1);
INSERT INTO public.planet VALUES (12, 'Callisto', 3, false, 'Moon', 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 0, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 8.6, true);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 2, 4.24, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 3, 642, true);
INSERT INTO public.star VALUES (5, 'Alpha Centauri', 2, 4.37, true);
INSERT INTO public.star VALUES (6, 'Rigel', 3, 863, true);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 20, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

