-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/LoddCV
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Employee" (
    "emp_no" int   NOT NULL,
    "emp_title_id" varchar(64)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(32)   NOT NULL,
    "last_name" varchar(32)   NOT NULL,
    "sex" varchar(3)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Department_employee" (
    "emp_no" int   NOT NULL,
	"dept_no" varchar(16)   NOT NULL
);

CREATE TABLE "Department" (
    "dept_no" varchar(16)   NOT NULL,
    "dept_name" varchar(64)   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Title" (
    "title_id" varchar(64)   NOT NULL,
    "title" varchar(64)   NOT NULL,
    CONSTRAINT "pk_Title" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Salary" (
    "emp_no" int   NOT NULL,
    "salary" float   NOT NULL
);

CREATE TABLE "Dept_managers" (
    "dept_no" varchar(16)   NOT NULL,
    "emp_no" int   NOT NULL
);

ALTER TABLE "Employee" ADD CONSTRAINT "fk_Employee_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Title" ("title_id");

ALTER TABLE "Department_employee" ADD CONSTRAINT "fk_Department_employee_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "Department_employee" ADD CONSTRAINT "fk_Department_employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

ALTER TABLE "Salary" ADD CONSTRAINT "fk_Salary_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

ALTER TABLE "Dept_managers" ADD CONSTRAINT "fk_Dept_managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "Dept_managers" ADD CONSTRAINT "fk_Dept_managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

