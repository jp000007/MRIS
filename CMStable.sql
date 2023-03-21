-- Hospital Table
CREATE TABLE HOSPITAL
(
    HOSP_NAME VARCHAR2(30)  PRIMARY KEY,
    COUNTRY VARCHAR2(30),
    ADDRESS VARCHAR2(50)
);

-- MedicineTable
CREATE TABLE MEDICINE
(
    REG_NO NUMBER PRIMARY KEY,
    MED_NAME VARCHAR2(20) NOT NULL,
    PRICE NUMBER(4, 3),
    EXP_DATE DATE
);

-- Doctor Table
CREATE TABLE DOCTOR
(
    DOC_ID NUMBER PRIMARY KEY,
    DNAME VARCHAR2(30),
    GENDER CHAR(1),
    QUALIFICATION VARCHAR2(30),
    JOB_SPECIFICATION VARCHAR2(30),
    HOSP_NAME VARCHAR2(30),
    FOREIGN KEY (HOSP_NAME) REFERENCES HOSPITAL(HOSP_NAME)
);

-- Nurse Table
CREATE TABLE NURSE
(
    NURSE_ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(30),
    GENDER CHAR(1),
    DOC_ID NUMBER,
    HOSP_NAME VARCHAR2(30),
    FOREIGN KEY (DOC_ID) REFERENCES DOCTOR (DOC_ID),
    FOREIGN KEY (HOSP_NAME) REFERENCES HOSPITAL (HOSP_NAME)
);

-- Patient Table
CREATE TABLE PATIENT
(
    SSN NUMBER PRIMARY KEY,
    FNAME VARCHAR2(30),
    LNAME VARCHAR2(30),
    AGE INTEGER,
    GENDER CHAR(1),
    NURSE_ID NUMBER,
    REC_ID NUMBER(30),
    FOREIGN KEY (NURSE_ID) REFERENCES NURSE(NURSE_ID),
    FOREIGN KEY (REC_ID) REFERENCES RECEPTION(REC_ID)
);

INSERT INTO HOSPITAL VALUES
("King Hamad University Hospital", "Kingdom of Bahrain", "Sheikh Isa bin Salman Bridge, Al Sayh, Busaiteen, Bahrain"),
("Mayo Clinic", "United States", "4500 San Pablo Road, US"),
("Bahrain Defence Force Hospital", "Kingdom of Bahrain", "Waly Alahed Avenue, West Riffa, Bahrain"),
("Salamaniya Hospital", "Kindgom of Bahrain", "Salmaniya Medical Complex, Manama, Bahrain"),
("St Thomas' Hospital London", "United Kingdom", "Westminster Bridge Rd, London"),
("King Faisal Specialist Hospital & Research Centre", "Kingdom of Saudi Arabia", "Al Mathar Ash Shamali, Riyadh 11564, Saudi Arabia"),
("Al-Hilal Hospital", "Kingdom of Bahrain", "Al-Hilal Hospital, Muharraq, Bahrain"),
("Emirates Hospital", "United Arab Emirates", "Jumeirah Beach Rd, Dubai, UAE"),
("American Mission Hospital","Kingdom of Bahrain", "Sheikh Essa Road, Manama, Bahrain"),
("Dar Al Shifa Hospital", "Kuwait", "Beirut Street, Hawally, Kuwait");

INSERT INTO MEDICINE VALUES
(020, "Adol Syrup", 0.300, '15/05/2023'),
(021, "Amoxil Capsules", 0.700, '10/03/2023'),
(022, "Aspirin", 1.000, '09/12/2023'),
(023, "Bonjela Gel", 0.400, '23/09/2024'),
(024, "Paracetamol", 1.200, '17/05/2024'),
(025, "Atorvastatin", 1.500, '15/06/2023'),
(026, "Coversyl", 1.000, '15/05/2023'),
(027, "Diamicron", 0.900, '03/02/2024'),
(028, "Lipitor", 1.400, '12/03/2025'),
(029, "Glucophage", 1.700, '19/07/2024');

INSERT INTO PATIENT VALUES
(100000001, "Sara", "Majeed", 27, 'F', 07, 046),
(100000002, "Ahmed", "Jamaal", 59, 'M', 03, 043),
(100000003, "Abdulla", "Hameed", 45, 'M', 09, 048),
(100000004, "Mariam", "Muhammad", 40, 'F', 01, 041),
(100000005, "Fatema", "Hasan", 64, 'F', 06, 047),
(100000006, "Zainab", "Abdulla", 55, 'F', 02, 049),
(100000007, "Khalil", "Ibrahim", 35, 'M', 08, 044),
(100000008, "Alyaa", "Husain", 57, 'F', 05, 042),
(100000009, "Khalid", "Ahmed", 60, 'M', 04, 050),
(100000010, "Jawad", "Ali", 20, 'M', 10, 045);
