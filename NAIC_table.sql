-- Hospital Table
CREATE TABLE INSURANCE_PROVIDER
(
    PROV_NAME VARCHAR2(30)  PRIMARY KEY,
    COUNTRY VARCHAR2(30),
    ADDRESS VARCHAR2(50)
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

-- policy Table
CREATE TABLE POLICIES
(
    POLICY_TYPE NUMBER PRIMARY KEY,
    POLICY_ID VARCHAR2(30),
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
    POLICY_ID NUMBER,
    PROV_NAME VARCHAR2(30),
    FOREIGN KEY (POLICY_ID) REFERENCES POLICIES(POLICY_ID),
    FOREIGN KEY (PROV_NAME) REFERENCES INSURANCE_PROVIDER(PROV_NAME)
);

INSERT INTO INSURANCE_PROVIDER VALUES
("Alamo life insurance", "Kingdom of Bahrain", "Sheikh Isa bin Salman Bridge, Al Sayh, Busaiteen, Bahrain"),
("Met life", "United States", "4500 San Pablo Road, US"),
("USAA", "Kingdom of Bahrain", "Waly Alahed Avenue, West Riffa, Bahrain"),
("International Life", "Kindgom of Bahrain", "Salmaniya Medical Complex, Manama, Bahrain"),
("Veterans health insurance", "United Kingdom", "Westminster Bridge Rd, London"),
("summersville life insurance", "Kingdom of Saudi Arabia", "Al Mathar Ash Shamali, Riyadh 11564, Saudi Arabia"),
("South florida life insurance", "Kingdom of Bahrain", "Al-Hilal Hospital, Muharraq, Bahrain"),
("Calloway insurance", "United Arab Emirates", "Jumeirah Beach Rd, Dubai, UAE"),
("Auto Life and health","Kingdom of Bahrain", "Sheikh Essa Road, Manama, Bahrain"),
("Geico", "Kuwait", "Beirut Street, Hawally, Kuwait");


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
