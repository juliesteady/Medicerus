-- Medication table:

-- The Medication Table stores information about the various medications.
-- Each row represents one particular fill for one prescription.  So, when
--    prescription is refilled, a new row is generated here.
-- This table can also store directions for periodic tasks, i.e. "take blood
--     pressure every night at 9pm"
-- This table can also store PRN medications- it would be designed so that every
--     time a new bottle of medication is opened, that bottle could be put in here
--     for tracking of batches.

CREATE TABLE medication (
    publicid           TEXT,   -- uuid primary key
    batch_no        INT,    -- One particular instance of one fill for this medication
    active          INT,    -- Is this medication active?
    long_name       TEXT,   -- The long (descriptive) name (incl. brand name and generic if exists)
    short_name      TEXT,   -- The short name of the med
    directions      TEXT,   -- The directions on how to take this medication or what to do at this time
    ndc_id          TEXT,   -- The NDC number of the medication
    rx_no           TEXT,   -- Prescription Number
    rx_expire_date  TEXT,   -- Prescription Expire Date
    fill_date       TEXT,   -- The fill date of this particular fill of this medication
    qty_filled      REAL,   -- For this fill, the quantity used of the available refills
    days_filled     REAL,   -- Number of days this fill is for
    remaining_avail REAL,   -- The remaining number of refills available on this prescription
    safe_delay      INT,    -- How many hours apart does this need to be taken?
    barcode         TEXT,   -- The barcode on the medicine bottle
    nfc_id          TEXT,   -- The NFC token ID of the sticker on the medicine bottle2
    manufacturer    TEXT REFERENCES person(publicid),   -- The manufacturer of this medication
    mfr_batch       TEXT,   -- Manufacturer's Batch Number
    patient         TEXT REFERENCES person(publicid),   -- Which patient this is for
    prescriber      TEXT REFERENCES person(publicid),   -- Which person prescribed this medication
    last_admin      TEXT DEFAULT CURRENT_TIMESTAMP  -- When this was last administered
);

-- Medication schedule header table: stores the schedule headers of medications.
-- These two schedule tables reflect how medication ought to be taken, NOT
-- actual instances of medication administration.

CREATE TABLE med_schedule_hdr (
    med_publicid        TEXT,    -- Medication ID number
    active              INT,    -- Is this schedule active?
    sched_directions    TEXT,   -- Directions as to scheduling
    comments            TEXT    -- Comments (updated on close of schedule)
);

-- Medication schedule detail table: One row for each instance of a required time;
-- for example, a medication that needs to be taken twice a day for 7 days will have
-- 14 rows in this table, each row contains a timestamp as to when the med needs to be
-- taken.

CREATE TABLE med_schedule_dtl (
    hdr_publicid                TEXT,    -- The schedule this corresponds to)
    due_timestamp               TEXT,   -- The timestamp that this is due on
    admin_timestamp             TEXT,   -- The timestamp this was administered on
    active                      INT     -- This schedule item is deactivated when the med is
                                        --    administered
);

create table med_note (
    med_publicid        TEXT REFERENCES medication(publicid), -- What medication it belongs to
    title               TEXT,            -- Title of this note
    body_content        TEXT             -- Content of the note
)

-- Person table:

-- The Person Table: Information on the patient, family, caregivers.  One
--    row for each person.

CREATE TABLE person (
    publicid        TEXT,   -- UUID primary key of the person record
    first_name      TEXT,   -- Self Explanatory
    last_name       TEXT,   -- Self Explanatory
    pers_           TEXT,   -- One of: Patient, Nurse, Caregiver, Doctor, Family, Manufacturer, Other
    phone           TEXT,   -- Phone number of this person
    created_on      TEXT DEFAULT CURRENT_TIMESTAMP  -- Self Explanatory
);

-- The Company table: companies involved in care (hospitals, drug manufacturers, etc)

CREATE TABLE company (
    publicid        TEXT,   -- UUID primary key of company record
    company_name    TEXT,   -- Self Explanatory
    location_id     TEXT,   -- Location ID (i.e. store number, etc.)
    role            TEXT    -- One of: Manufacturer, Distributor, Pharmacy, Home Health Company
)

n_co_pers (
    publicid        TEXT,   -- UUID primary key
    effective_date  TEXT,   -- Effective Date
    companyid       TEXT REFERENCES company(publicid),
    personid        TEXT REFERENCES person(publicid)
)

-- Mix Header table:

-- The Mix Header table contains information on mixes.  If medications are
--    mixed together for a particular instance, information about the mix
--    goes here.  Each row in this table represents one instance of a mix;
--    so, if a mix is administered every day, then a new row is created
--    every day.  Batch number Zero is defined as the "recipe" for a
--    particular mix.

CREATE TABLE mix_headers (
    batch_no        INT,    -- This particular mix batch
    patient         TEXT REFERENCES person (publicid),    -- What patient this belongs to
    active          INT,    -- Is it active?
    mix_descr       TEXT,   -- Description
    create_date     TEXT DEFAULT CURRENT_TIMESTAMP, -- When Created
    created_by      TEXT REFERENCES person (publicid) -- Created by whom?
);

-- Mix Details table:
-- The Mix Details table is a n-to-n join that joins the medications to
--    the mixes.  Each row is one instance of a medication in a mix; like
--    with the header table, batch number zero is one medication in the
--    "recipe" for this mix.

CREATE TABLE mix_details (
    mix_hdr_id         TEXT REFERENCES mix_headers(publicid),   -- Row number of the mix header
    --mh_batch_no     INT REFERENCES mix_headers(batch_no),   -- Row number of the mix header batch number
    med_id             TEXT REFERENCES medication(publicid)     -- Row number of the medication
)

-- Event table:
-- The Event Table: a new row is generated whenever anything occurs:
--    Medication administered, med refilled, information on person added, etc

CREATE TABLE event (
    med_id          TEXT REFERENCES medication(publicid),
    mix_id          TEXT REFERENCES mix_headers(publicid),
    quantity        REAL,
    person_rownum   TEXT REFERENCES person(publicid),
    description     TEXT,
    timestamp       TEXT DEFAULT CURRENT_TIMESTAMP
);

-- Fast List table:
-- This table drive the FastList screen.  It's designed so that you can
-- quickly pull up the list of PRN medications and glance to see if
-- a particular medication is able to be given again.  Until the prn_med_rules
-- table is implemented, we do a simple "# of doses allowed in X time span"
-- formula.

CREATE TABLE fast_list (
    med_id          TEXT REFERENCES medication(publicid),
    amt_allowed     REAL,           -- AMT currently allowed
    last_updated    TEXT            -- When this was last updated
)

-- PRN Med Rules table:
-- TODO / FOR FUTURE USE
-- This table describes medication rules for PRN medications, for example
-- "tylenol maximum 1 gram every 6 hours".  At any given time we should
-- be able to run the query stored in rule_formula to determine if it is
-- safe to administer this medication.

CREATE TABLE prn_med_rules(
    med_id          TEXT REFERENCES medication(publicid),
    rule_formula    TEXT
)

-- Config table:

CREATE TABLE config (
    schema_version  INT,
    active          INT,
    date_initialized   TEXT
);
