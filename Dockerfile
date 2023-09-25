FROM ubuntu:20.04
EXPOSE 22
RUN apt update 
RUN apt-get install -y python3-pip python3 python3-dev bash wget
RUN pip3 install --upgrade pip
RUN pip3 install duckdb
RUN pip3 install dbt-core dbt-duckdb
ENTRYPOINT ["bash"]