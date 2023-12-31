BEGIN;


CREATE TABLE IF NOT EXISTS public."Card"
(
    card_name character varying(50),
    card_type character varying(50),
    hp integer,
    rarity character varying(50),
    move1 character varying(50),
    move2 character varying(50),
    card_id integer,
    PRIMARY KEY (card_id)
);

CREATE TABLE IF NOT EXISTS public."Pack"
(
    set_name character varying(50),
    pack_id integer,
    price integer,
    PRIMARY KEY (pack_id)
);

CREATE TABLE IF NOT EXISTS public."Store"
(
    store_id integer,
    store_name character varying,
    total_packs integer,
    packs_sold integer,
    PRIMARY KEY (store_id)
);

CREATE TABLE IF NOT EXISTS public."Factory"
(
    factory_id integer,
    factory_name character varying(50),
    packs_made integer,
    PRIMARY KEY (factory_id)
);

CREATE TABLE IF NOT EXISTS public."Employee"
(
    employee_id integer,
    factory_name character varying(50),
    emp_name character varying(50),
    salary integer,
    PRIMARY KEY (employee_id)
);

ALTER TABLE IF EXISTS public."Pack"
    ADD FOREIGN KEY (pack_id)
    REFERENCES public."Card" (card_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Store"
    ADD FOREIGN KEY (store_id)
    REFERENCES public."Pack" (pack_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Factory"
    ADD FOREIGN KEY (factory_id)
    REFERENCES public."Store" (store_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Employee"
    ADD FOREIGN KEY (employee_id)
    REFERENCES public."Factory" (factory_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Employee"
    ADD FOREIGN KEY (factory_name)
    REFERENCES public."Factory" (factory_name) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;
