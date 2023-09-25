# DBT Duckdb Stack

A simple pipeline to experiment around dbt and duckdb features based one [this implmentation](https://docs.getdbt.com/blog/kimball-dimensional-model
)[1]

## Initial Steps

This setup is works with docker

1. Setup dbt and duck - by running  `bash jenkins-runner.sh`
2. Initialize the `dbt project` as `adventureworks` using `dbt init`
2. Download duckdb from [duckdb website](https://duckdb.org/docs/installation/)  
3. Clone [this repo](https://github.com/Data-Engineer-Camp/dbt-dimensional-modelling/tree/main/adventureworks) and copy off the seed directory in the dbt project seeds folder

## Description

I followed the implmentation from the [1] blog will give a clear steps in building a data warehouse | repository using dbt.  I can describe the steps as follows:

* 1 - Seed the data in the dbt project using `dbt init
* 2 - Build models and schemas for dimensions 
* 3 - Build Models and scehmas for facts
* 4 - Apply test for dimensions and facts columns
* 5 - [TBD] Add a quick bi tool and build OBT facts for reporting (Superset or Metabase)

## Advantages of duckdb

[DuckDB vs Postgres](https://www.vantage.sh/blog/querying-aws-cost-data-duckdb)


## References

[1] - DWH Modelling - [getdbt devblog](https://docs.getdbt.com/blog/kimball-dimensional-model)