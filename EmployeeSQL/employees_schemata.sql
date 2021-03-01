-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "department" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "dept_name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "titles" (
    "title_id" VARCHAR(5)   NOT NULL,
    "title" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employees" (
    "employee_num" INT   NOT NULL,
    "first_name" VARCHAR(50)   NOT NULL,
    "last_name" VARCHAR(50)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "gender" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    "title_id" VARCHAR(5)   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "employee_num"
     )
);

CREATE TABLE "dept_Managers" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "employee_num" INT   NOT NULL
);

CREATE TABLE "salaries" (
    "salary_id" SERIAL   NOT NULL,
    "emp_num" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "salary_id"
     )
);

-- junctional table
CREATE TABLE "department_employee" (
    "employee_num" INT   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_title_id" FOREIGN KEY("title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_Managers" ADD CONSTRAINT "fk_dept_Managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department" ("dept_no");

ALTER TABLE "dept_Managers" ADD CONSTRAINT "fk_dept_Managers_employee_num" FOREIGN KEY("employee_num")
REFERENCES "employees" ("employee_num");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_num" FOREIGN KEY("emp_num")
REFERENCES "employees" ("employee_num");

ALTER TABLE "department_employee" ADD CONSTRAINT "fk_department_employee_employee_num" FOREIGN KEY("employee_num")
REFERENCES "employees" ("employee_num");

ALTER TABLE "department_employee" ADD CONSTRAINT "fk_department_employee_dept_no" FOREIGN KEY("dept_no")
REFERENCES "department" ("dept_no");

