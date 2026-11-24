--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    abbreviation character varying(10) NOT NULL,
    star_id integer,
    hemisphere character varying(50) NOT NULL,
    is_zodiac boolean NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    galaxy_type character varying(50),
    age_in_million_of_years bigint,
    distance_from_earth double precision,
    has_supermassive_black_hole boolean
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter_in_km numeric(10,2),
    is_spherical boolean,
    discovered_year integer,
    atmosphere_composition text
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(50),
    has_life boolean,
    has_rings boolean,
    distance_from_star double precision,
    orbital_period_in_days numeric(10,2)
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
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(50),
    temperature_in_kelvin integer,
    age_in_million_of_years integer,
    is_visible_to_naked_eye boolean
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'Ori', 3, 'Equatorial', false);
INSERT INTO public.constellation VALUES (2, 'Canis Majoris', 'CMa', 2, 'Southern', false);
INSERT INTO public.constellation VALUES (3, 'Andromeda', 'And', 4, 'Northern', false);
INSERT INTO public.constellation VALUES (4, 'Triangulum', 'Tri', 5, 'Northern', false);
INSERT INTO public.constellation VALUES (5, 'Virgo', 'Vir', NULL, 'Equatorial', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The home galaxy of our Solar System.', 'Barred Spiral', 13610, 0, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The closest major galaxy of the Milky Way.', 'Spiral', 10010, 2537000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'The third-largest galaxy in the Local Group.', 'Spiral', 10000, 2730000, false);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'A giant elliptical galaxy famous for the first direct image of a black hole.', 'Elliptical', 12340, 53490000, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Features a bright nucleus and a thick dust lane resembling a sombrero.', 'Spiral', 13250, 29350000, true);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'A satellite galaxy orbitting the Milky Way', 'Irregular', 1101, 158200, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474.80, true, NULL, 'None (Exosphere only)');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22.53, false, 1877, 'None');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12.40, false, 1877, 'None');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643.20, true, 1610, 'Sulfur dioxide');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3121.60, true, 1610, 'Oxygen');
INSERT INTO public.moon VALUES (6, 'Callisto', 5, 4820.60, true, 1610, 'Carbon dioxide, Oxygen');
INSERT INTO public.moon VALUES (7, 'Amalthea', 5, 167.00, false, 1892, 'None');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5149.50, true, 1655, 'Nitrogen, Methane');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 504.20, true, 1789, 'Water vapor, Nitrogen, Carbon dioxide');
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 396.40, true, 1789, 'None');
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 1527.60, true, 1672, 'Oxygen, Carbon dioxide');
INSERT INTO public.moon VALUES (12, 'Dione', 6, 1122.80, true, 1684, 'Oxygen ions');
INSERT INTO public.moon VALUES (13, 'Iapetus', 6, 1469.00, true, 1671, 'None');
INSERT INTO public.moon VALUES (14, 'Hyperion', 6, 270.00, false, 1848, 'None');
INSERT INTO public.moon VALUES (15, 'Titania', 7, 1576.80, true, 1787, 'Carbon dioxide');
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 1522.80, true, 1787, 'None');
INSERT INTO public.moon VALUES (17, 'Miranda', 7, 471.60, true, 1948, 'None');
INSERT INTO public.moon VALUES (18, 'Triton', 8, 2706.80, true, 1846, 'Nitrogen, Methane');
INSERT INTO public.moon VALUES (19, 'Charon', 9, 1212.00, true, 1987, 'None');
INSERT INTO public.moon VALUES (20, 'Ganymede', 5, 5268.20, true, 1610, 'Oxygen');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', false, false, 0.39, 88.00);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', false, false, 0.72, 224.70);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', true, false, 1, 365.25);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', false, false, 1.52, 687.00);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', false, true, 5.2, 4333.00);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', false, true, 9.58, 10759.00);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', false, true, 19.22, 30687.00);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', false, true, 30.05, 60190.00);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 'Dwarf', false, false, 39.48, 90560.00);
INSERT INTO public.planet VALUES (10, 'Ceres', 1, 'Dwarf', false, false, 2.77, 1680.00);
INSERT INTO public.planet VALUES (11, 'Sirius Ab', 2, 'Gas Giant', false, false, 2.1, 850.50);
INSERT INTO public.planet VALUES (12, 'Betelgeuse b', 3, 'Gas Giant', false, true, 4.5, 1200.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type Main Sequence', 5778, 4600, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-type Main Sequence', 9940, 242, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red Supergiant', 3500, 10, true);
INSERT INTO public.star VALUES (4, 'Alpheratz', 2, 'B-type Subgiant', 13800, 60, true);
INSERT INTO public.star VALUES (5, 'M3-013406.63', 3, 'O-type Supergiant', 30000, 3, false);
INSERT INTO public.star VALUES (6, 'S Doradus', 6, 'Luminous Blue Variable', 20000, 5, false);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 5, true);


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
-- Name: constellation constellation_abbreviation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_abbreviation_key UNIQUE (abbreviation);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: constellation constellation_brightest_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_brightest_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

