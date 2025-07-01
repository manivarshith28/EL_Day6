

Table : Employee

CREATE TABLE emp (
  eid INT PRIMARY KEY,
  ename VARCHAR(50),
  address VARCHAR(100)
);


Table : Department

CREATE TABLE dept (
  did VARCHAR(10) PRIMARY KEY,
  dname VARCHAR(50),
  eid INT,
  FOREIGN KEY (eid) REFERENCES emp(eid)
);


Table : Student

CREATE TABLE student (
  sid INT PRIMARY KEY,
  sname VARCHAR(50),
  role VARCHAR(50),
  intern_salary INT
);
