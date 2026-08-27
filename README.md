# **Depression diagnostic assistant platform**

> This project is still a proof of concept, it is relatively "barebone".

This project aims at providing a platform to assist specialists in diagnosing the depression in their patients.
The platform could also be used by individuals willing to get a pre-diagnostic.

## **Prerequisites**
Softwares to install :
- [Docker](https://www.docker.com/) installed

## **Setup**
Files to modify :
  - Copy [`.env_TEMPLATE`](.env_TEMPLATE), rename it `.env` and replace :
    - "DB_USERNAME" with your own superuser name
    - "DB_PASSWORD" with your own superuser password
   
## **Build**
  1. Open a terminal.
  2. Change its working directory to [`. (root)`](.), in the project.
  3. Run the command :
     ```
     docker compose up --build
     ```
  4. Wait for the containers to be created.

## **Entrypoint**
The entrypoint of the application is its website, running in the container `website_frontend`.
By default, it can be accessed at this address : [http://localhost:5173/](http://localhost:5173/).

## **Usage**

> - Every field is required
> - Follow the data formatting used to validate data inserted in the database ([`./database/parts/init_db_table.sql`](./database/parts/init_db_table.sql).
> - On the website, placeholders are already displayed to help in understanding the format of the input.

In its current state, the platform consists in a single webpage divided into 3 sections:
  1. **Send data to the predictor and get its prediction**
     1. API call to the "Predictor" container, for the model to make an inference.
     2. Display the inference.
     3. Insert the information and the inference into the database.
  2. **Insert an entry into the database**
     - Manually insert an entry into the database.
  3. **Fetch an entry from the database**
     - Fetch an entry (by its `id`) from the database
