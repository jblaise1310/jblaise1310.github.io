--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-08-04 15:12:48 MDT

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
-- TOC entry 2 (class 3079 OID 16664)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3756 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 274 (class 1259 OID 16674)
-- Name: admission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admission (
    admins_id integer NOT NULL,
    initial_admission text
);


ALTER TABLE public.admission OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 16679)
-- Name: complication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.complication (
    complication_id integer NOT NULL,
    complication_risk text
);


ALTER TABLE public.complication OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 16684)
-- Name: job; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job (
    job_id integer NOT NULL,
    job_title text
);


ALTER TABLE public.job OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 16689)
-- Name: location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location (
    location_id integer NOT NULL,
    zip integer,
    city text,
    state text,
    county text
);


ALTER TABLE public.location OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 16797)
-- Name: med_data_new; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.med_data_new (
    patient_id text,
    population integer,
    children integer,
    age integer,
    income numeric,
    marital text,
    readmis text,
    gender text,
    highblood text,
    stroke text,
    county text,
    state text,
    highblood_score integer,
    stroke_score integer,
    overweight_score integer,
    arthritis_score integer,
    diabetes_score integer,
    hyperlipidemia_score integer,
    backpain_score integer,
    anxiety_score integer,
    allergic_rhinitis_score integer,
    reflux_esophagitis_score integer,
    asthma_score integer,
    service_count bigint,
    medical_risk_score bigint
);


ALTER TABLE public.med_data_new OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 17349)
-- Name: med_db; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.med_db (
    patient_id character varying(255) NOT NULL,
    state character varying(2) NOT NULL,
    age integer NOT NULL,
    gender character varying(20) NOT NULL,
    marital character varying(20),
    children integer,
    income double precision,
    allergic_rhinitis character varying(3),
    anxiety character varying(3),
    asthma character varying(3),
    arthritis character varying(3),
    backpain character varying(3),
    diabetes character varying(3),
    highblood character varying(3),
    hyperlipidemia character varying(3),
    overweight character varying(3),
    reflux_esophagitis character varying(3),
    stroke character varying(3),
    complication_risk character varying(20),
    readmis character varying(3),
    location_id integer,
    comp_id integer,
    allergic_rhinitis_score integer,
    anxiety_score integer,
    asthma_score integer,
    arthritis_score integer,
    backpain_score integer,
    diabetes_score integer,
    highblood_score integer,
    hyperlipidemia_score integer,
    overweight_score integer,
    reflux_esophagitis_score integer,
    stroke_score integer,
    readmis_score integer,
    complication_risk_score integer,
    medical_risk_score integer
);


ALTER TABLE public.med_db OWNER TO postgres;

--
-- TOC entry 285 (class 1259 OID 16818)
-- Name: new_med_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.new_med_data (
    patient_id text,
    population integer,
    children integer,
    age integer,
    income numeric,
    marital text,
    readmis text,
    gender text,
    highblood text,
    stroke text,
    county text,
    state text,
    highblood_score integer,
    stroke_score integer,
    overweight text,
    arthritis text,
    diabetes text,
    hyperlipidemia text,
    backpain text,
    anxiety text,
    allergic_rhinitis text,
    reflux_esophagitis text,
    asthma text,
    overweight_score integer,
    arthritis_score integer,
    diabetes_score integer,
    hyperlipidemia_score integer,
    backpain_score integer,
    anxiety_score integer,
    allergic_rhinitis_score integer,
    reflux_esophagitis_score integer,
    asthma_score integer,
    service_count bigint,
    readmit_risk_score numeric
);


ALTER TABLE public.new_med_data OWNER TO postgres;

--
-- TOC entry 288 (class 1259 OID 25485)
-- Name: new_med_db; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.new_med_db (
    patient_id character varying(50),
    state character varying(2),
    age integer,
    gender character varying(10),
    marital character varying(20),
    children integer,
    income double precision,
    allergic_rhinitis boolean,
    anxiety boolean,
    asthma boolean,
    arthritis boolean,
    backpain boolean,
    diabetes boolean,
    highblood boolean,
    hyperlipidemia boolean,
    overweight boolean,
    reflux_esophagitis boolean,
    stroke boolean,
    complication_risk character varying(10),
    readmis boolean,
    allergic_rhinitis_score double precision,
    anxiety_score double precision,
    asthma_score double precision,
    arthritis_score double precision,
    backpain_score double precision,
    diabetes_score double precision,
    highblood_score double precision,
    hyperlipidemia_score double precision,
    overweight_score double precision,
    reflux_esophagitis_score double precision,
    stroke_score double precision,
    readmis_score double precision,
    complication_risk_score double precision,
    medical_risk_score integer
);


ALTER TABLE public.new_med_db OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 16768)
-- Name: new_sdoh_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.new_sdoh_data (
    state character varying(2),
    county text,
    totalpopulation integer,
    measure character varying(255),
    data_value double precision,
    "SDOH Factors" character varying(255),
    sdoh_score numeric
);


ALTER TABLE public.new_sdoh_data OWNER TO postgres;

--
-- TOC entry 289 (class 1259 OID 25488)
-- Name: new_sdoh_db; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.new_sdoh_db (
    state character varying(2),
    total_population integer,
    measure character varying(255),
    data_value double precision,
    sdoh_factors character varying(255),
    sdoh_score double precision
);


ALTER TABLE public.new_sdoh_db OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 16694)
-- Name: patient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patient (
    patient_id text NOT NULL,
    lat numeric,
    lng numeric,
    population integer,
    children integer,
    age integer,
    income numeric,
    marital text,
    readmis text,
    gender text,
    initial_days numeric,
    totalcharge numeric,
    additional_charges numeric,
    vitd_levels numeric,
    doc_visits integer,
    full_meals integer,
    vitd_supp integer,
    soft_drink text,
    highblood text,
    stroke text,
    job_id integer,
    compl_id integer,
    admis_id integer,
    location_id integer
);


ALTER TABLE public.patient OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 16812)
-- Name: pt_medical; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pt_medical (
    patient_id text,
    population integer,
    children integer,
    age integer,
    income numeric,
    marital text,
    readmis text,
    gender text,
    highblood text,
    stroke text,
    county text,
    state text,
    highblood_score integer,
    stroke_score integer,
    overweight_score integer,
    arthritis_score integer,
    diabetes_score integer,
    hyperlipidemia_score integer,
    backpain_score integer,
    anxiety_score integer,
    allergic_rhinitis_score integer,
    reflux_esophagitis_score integer,
    asthma_score integer,
    service_count bigint,
    medical_risk_score bigint
);


ALTER TABLE public.pt_medical OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 16745)
-- Name: sdoh_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sdoh_data (
    year character varying(9),
    stateabbr character varying(2),
    statedesc character varying(255),
    locationname character varying(255),
    datasource character varying(255),
    category character varying(255),
    measure character varying(255),
    data_value_unit character varying(50),
    data_value_type character varying(50),
    data_value double precision,
    moe double precision,
    totalpopulation integer,
    locationid integer,
    categoryid character varying(50),
    measureid character varying(50),
    datavaluetypeid character varying(50),
    short_question_text character varying(255),
    geolocation point
);


ALTER TABLE public.sdoh_data OWNER TO postgres;

--
-- TOC entry 287 (class 1259 OID 17369)
-- Name: sdoh_db; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sdoh_db (
    state character varying(2),
    total_population integer,
    measure character varying(255),
    data_value double precision,
    sdoh_factors character varying(255),
    sdoh_score double precision
);


ALTER TABLE public.sdoh_db OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 16699)
-- Name: servicesaddon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicesaddon (
    patient_id text NOT NULL,
    services text,
    overweight text,
    arthritis text,
    diabetes text,
    hyperlipidemia text,
    backpain text,
    anxiety text,
    allergic_rhinitis text,
    reflux_esophagitis text,
    asthma text
);


ALTER TABLE public.servicesaddon OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 16704)
-- Name: survey_responses_addon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.survey_responses_addon (
    patient_id text NOT NULL,
    item1 integer,
    item2 integer,
    item3 integer,
    item4 integer,
    item5 integer,
    item6 integer,
    item7 integer,
    item8 integer
);


ALTER TABLE public.survey_responses_addon OWNER TO postgres;

--
-- TOC entry 3586 (class 2606 OID 16710)
-- Name: admission admission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admission
    ADD CONSTRAINT admission_pkey PRIMARY KEY (admins_id);


--
-- TOC entry 3588 (class 2606 OID 16712)
-- Name: complication complication_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.complication
    ADD CONSTRAINT complication_pkey PRIMARY KEY (complication_id);


--
-- TOC entry 3590 (class 2606 OID 16714)
-- Name: job job_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job
    ADD CONSTRAINT job_pkey PRIMARY KEY (job_id);


--
-- TOC entry 3592 (class 2606 OID 16716)
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (location_id);


--
-- TOC entry 3600 (class 2606 OID 17353)
-- Name: med_db med_db_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.med_db
    ADD CONSTRAINT med_db_pkey PRIMARY KEY (patient_id);


--
-- TOC entry 3594 (class 2606 OID 16718)
-- Name: patient patient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (patient_id);


--
-- TOC entry 3596 (class 2606 OID 16720)
-- Name: servicesaddon servicesaddon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicesaddon
    ADD CONSTRAINT servicesaddon_pkey PRIMARY KEY (patient_id);


--
-- TOC entry 3598 (class 2606 OID 16722)
-- Name: survey_responses_addon survey_responses_addon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.survey_responses_addon
    ADD CONSTRAINT survey_responses_addon_pkey PRIMARY KEY (patient_id);


--
-- TOC entry 3605 (class 2606 OID 17359)
-- Name: med_db med_db_comp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.med_db
    ADD CONSTRAINT med_db_comp_id_fkey FOREIGN KEY (comp_id) REFERENCES public.complication(complication_id);


--
-- TOC entry 3606 (class 2606 OID 17354)
-- Name: med_db med_db_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.med_db
    ADD CONSTRAINT med_db_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(location_id);


--
-- TOC entry 3607 (class 2606 OID 17364)
-- Name: med_db med_db_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.med_db
    ADD CONSTRAINT med_db_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.servicesaddon(patient_id);


--
-- TOC entry 3601 (class 2606 OID 16723)
-- Name: patient patient_admis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_admis_id_fkey FOREIGN KEY (admis_id) REFERENCES public.admission(admins_id);


--
-- TOC entry 3602 (class 2606 OID 16728)
-- Name: patient patient_compl_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_compl_id_fkey FOREIGN KEY (compl_id) REFERENCES public.complication(complication_id);


--
-- TOC entry 3603 (class 2606 OID 16733)
-- Name: patient patient_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.job(job_id);


--
-- TOC entry 3604 (class 2606 OID 16738)
-- Name: patient patient_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(location_id);


-- Completed on 2024-08-04 15:12:48 MDT

--
-- PostgreSQL database dump complete
--

