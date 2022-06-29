FROM jupyter/scipy-notebook

RUN pip install joblib


USER root
RUN apt-get update && apt-get install -y jq

RUN mkdir model raw_data processed_data results


ENV RAW_DATA_DIR=/home/athaul/raw_data
ENV PROCESSED_DATA_DIR=/home/athaul/processed_data
ENV MODEL_DIR=/home/athaul/model
ENV RESULTS_DIR=/home/athaul/results
ENV RAW_DATA_FILE=adult.csv


COPY adult.csv ./raw_data/adult.csv
COPY preprocessing.py ./preprocessing.py
COPY train.py ./train.py
COPY test.py ./test.py
