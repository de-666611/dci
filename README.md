Inorder to run the dbt in your local system follow the below steps

1. **Install DBT:**
   - You will need Python installed on your computer. DBT is a command line tool that is installed with pip. You can install it using the command: `pip install dbt`
2. Install Postgresql database and make sure you have the following four tables dummy_contacts, dummy_courses, dummy_associations, dummy_deals.
	create these tables as mentiondedf from the sample csv files
	
```
	CREATE TABLE dummy_contacts(id INTEGER,created_at TIMESTAMP,
 mql_date TEXT, -- change these to TEXT for now
    -- change these to TEXT for now
    type VARCHAR(255),
    sel_date TEXT, 
    email VARCHAR(255),
    phone VARCHAR(255),
    sales_region VARCHAR(255)
);COPY dummy_contacts
FROM 'path/dummy_contacts.csv'
DELIMITER ',' 
CSV HEADER;

CREATE TABLE dummy_courses(id VARCHAR(255),
    course_start_date DATE,
    course_end_date DATE,
    course_type VARCHAR(255),
    classification VARCHAR(255),
    course_number INTEGER,
    course_name VARCHAR(255),
    max_participants INTEGER
);COPY dummy_courses
FROM '/path/dummy_courses.csv'
DELIMITER ',' 
CSV HEADER;


CREATE TABLE dummy_deals(id VARCHAR(255),
    created_at TIMESTAMP,
    deal_stage VARCHAR(255),
    offer_sent_at TIMESTAMP,
    verbal_order_at TIMESTAMP,
    approved_at TIMESTAMP,
    drop_out_at TIMESTAMP,
    course_id VARCHAR(255),
    direct_entry BOOLEAN
);COPY dummy_deals
FROM '/path/dummy_deals.csv'
DELIMITER ',' 
CSV HEADER;


CREATE TABLE dummy_associations(from_type  VARCHAR(255),
    from_id VARCHAR(255),
    to_type  VARCHAR(255),
    to_id VARCHAR(255)
);COPY dummy_associations
FROM '/path/dummy_associations.csv'
DELIMITER ',' 
CSV HEADER;
```
3. Clone the repository 
	git clone  git@github.com:de-666611/dci.git
4.  The `profiles.yml` file is where you tell dbt how to connect to your database. It will be created in a hidden directory: `~/.dbt/`
   - The `profiles.yml` file should look something like this (the following example is for a PostgreSQL database):
   
   
```yaml
default:
  target: dev
  outputs:
    dev:
      type: postgres
      host: localhost
      user: user_name
      password: password
      port: 5432
      dbname: database
      schema: public

```
5. **Run Your DBT Project:**
   - In your terminal, navigate to your dbt project directory.
   - To run your dbt project, use the following command: `dbt run`

6. **Generate Documentation:**
   - DBT can automatically generate documentation for your project.
   - To generate the documentation, use the following command: `dbt docs generate`
   - To view the documentation, use the following command: `dbt docs serve`
