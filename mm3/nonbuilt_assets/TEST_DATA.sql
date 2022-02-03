-- This SQL file inserts test data into the database

INSERT INTO person
    (first_name,
     last_name,
     role,
     phone)
VALUES
    ('Marie',
     'Smith',
     'Doctor',
     '000-000-0000');

INSERT INTO person
    (first_name,
     last_name,
     role,
     phone)
VALUES
    ('Stephanie',
     'Jones',
     'Home Nurse',
     '000-000-0000');

INSERT INTO person
    (first_name,
     last_name,
     role,
     phone)
VALUES
    ('Robert',
     'Workman',
     'Patient',
     '000-000-0000');

INSERT INTO person
    (first_name,
     last_name,
     role,
     phone)
VALUES
    ('',
     'ACME Medication Manufacturer',
     'Medicine Manufacturer',
     '000-000-0000');

INSERT INTO medication
    (batch_no,
     active,
     long_name,
     short_name,
     rx_no, 
     rx_expire_date,
     fill_date,
     qty_filled,
     remaining_avail,
     barcode,
     manufacturer,
     mfr_batch,
     patient,
     prescriber)
VALUES
    (1,
        1,
        'Acetaminophen Tabs',
        'Acet Tabs',
        '0111',
        '01-JAN-2017',
        '22-FEB-2016',
        '12',
        '24',
        'AAA',
         4,
         '01246',
         3,
         1);

INSERT INTO medication
    (batch_no,
     active,
     long_name,
     short_name,
     rx_no, 
     rx_expire_date,
     fill_date,
     qty_filled,
     remaining_avail,
     barcode,
     manufacturer,
     mfr_batch,
     patient,
     prescriber)
VALUES
    (1,
        1,
        'NSAID Tabs',
        'NSAID Tabs',
        '0112',
        '01-JAN-2017',
        '22-FEB-2016',
        '16',
        '32',
        'BBB',
         4,
         '01246',
         3,
         1);

