# src: https://github.com/davidgasquez/dbt-docker/blob/master/Dockerfile

FROM python:3.8.5

# Update and install system packages
RUN apt-get update -y && \
  apt-get install --no-install-recommends -y -q \
  git libpq-dev python-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install DBT
RUN pip install -U pip
RUN pip install dbt-core==1.4.4
RUN pip install dbt-postgres==1.4.4
RUN pip install dbt-redshift==1.4.1

# Set environment variables
ENV DBT_DIR /dbt

# Set working directory
WORKDIR $DBT_DIR

# Run dbt
# CMD ["dbt"]