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
    name character varying(255) NOT NULL,
    size integer,
    is_halley_type boolean NOT NULL,
    discovery_year integer,
    discoverer_name character varying(255)
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
    name character varying(255) NOT NULL,
    size numeric,
    has_black_hole boolean NOT NULL,
    luminosity integer,
    spiral_arm_count integer
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
    name character varying(255) NOT NULL,
    size integer,
    is_inhabited boolean NOT NULL,
    planet_id integer,
    surface_temperature integer,
    orbital_period integer
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
    name character varying(255) NOT NULL,
    type text,
    distance_from_star integer,
    has_ring boolean NOT NULL,
    star_id integer,
    atmospheric_pressure integer,
    has_moons boolean
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
    name character varying(255) NOT NULL,
    temperature integer,
    mass integer NOT NULL,
    is_supernova boolean NOT NULL,
    galaxy_id integer,
    luminosity integer,
    is_binary_system boolean
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

INSERT INTO public.comet VALUES (1, 'Halley''s Comet', 15, true, 1705, 'Edmond Halley');
INSERT INTO public.comet VALUES (2, 'Comet NEOWISE', 5, false, 2020, 'NEOWISE');
INSERT INTO public.comet VALUES (3, 'Comet Hale-Bopp', 40, false, 1995, 'Alan Hale and Thomas Bopp');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Triangulum', 50000, false, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 2000000, true, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 120000, false, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 90000, false, NULL, NULL);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000000, true, 500000, 2);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 800000, false, 300000, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (3, 'Europa', 3138, false, 3, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Titan', 5150, false, 4, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Ganymede', 5262, false, 4, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Callisto', 4820, false, 4, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Io', 3660, false, 3, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Enceladus', 252, false, 4, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Triton', 2706, false, 6, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Titania', 1580, false, 7, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Oberon', 1522, false, 7, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Miranda', 235, false, 8, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Deimos', 12, false, 2, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Charon', 1207, false, 9, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Lysithea', 36, false, 1, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Phoebe', 106, false, 4, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Rhea', 1527, false, 4, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Dione', 1123, false, 4, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Mimas', 396, false, 4, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Tethys', 1075, false, 4, NULL, NULL);
INSERT INTO public.moon VALUES (1, 'Luna', 3475, false, 1, -233, 27);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, false, 2, -10, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas Giant', 778, true, 1, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Gas Giant', 1427, true, 1, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Venus', 'Terrestrial', 108, false, 1, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Neptune', 'Ice Giant', 4503, true, 1, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', 2872, true, 1, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Mercury', 'Terrestrial', 58, false, 1, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 'Exoplanet', 490, false, 2, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 'Exoplanet', 207, false, 2, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'HD 209458b', 'Exoplanet', 150, false, 3, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', 'Exoplanet', 38, false, 4, NULL, NULL);
INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 147, false, 1, 101, true);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 228, false, 1, 7, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Betelgeuse', 3500, 13000000, false, 4, NULL, NULL);
INSERT INTO public.star VALUES (4, 'Sirius', 9940, 2000000, false, 1, NULL, NULL);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 3042, 12300, false, 1, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Antares', 3400, 11200000, false, 1, NULL, NULL);
INSERT INTO public.star VALUES (1, 'Sun', 5778, 1989000, false, 1, 50000, false);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 5790, 2545000, false, 1, 70000, true);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


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

