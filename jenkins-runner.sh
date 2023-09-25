#!/bin/bash
#Set of Commands to run into Jenkins build
#Adjust mounts according to your local

PROJECT_NAME_PROD='dbt-duckdb-pipelines'
PROJECT_HOME='D:\\base\\repos' ## Physical path of your repos

PROJECT_NAME_PROD_IMAGE=$PROJECT_NAME_PROD'_image:latest'
INPUT_PATH=$PROJECT_HOME'\\'$PROJECT_NAME_PROD

#To-do
#Enable consumption from config files

VOLUME_1_IN='D:\\base\\repos\\dbt-duckdb-pipelines\\data'
VOLUME_1_OUT='/data'
VOLUME_2_IN='D:\\base\\repos\\dbt-duckdb-pipelines\\src'
VOLUME_2_OUT='/src'
VOLUME_3_IN='D:\\base\\repos\\dbt-duckdb-pipelines\\ref'
VOLUME_3_OUT='/ref'
VOLUME_4_IN='D:\\base\apps'
VOLUME_4_OUT='/apps'

#editable
#PORT_FWD='-p 8888:8888'

# FOLDER_1='notebooks'
# VOLUME_1_IN=$INPUT_PATH"/$FOLDER_1"
# VOLUME_1_OUT="/scripts/$FOLDER_1"

# FOLDER_2='offline_scala'
# VOLUME_2_IN=$INPUT_PATH"/$FOLDER_2"
# VOLUME_2_OUT="/scripts/$FOLDER_2"


if (docker ps -a|grep $PROJECT_NAME_PROD)
then
echo 'Killing prod and bringing it back..'
docker stop $PROJECT_NAME_PROD
docker rm $PROJECT_NAME_PROD
docker image rm $PROJECT_NAME_PROD_IMAGE
fi

docker build -t  $PROJECT_NAME_PROD_IMAGE .

VOLUME_FWD="-v $VOLUME_1_IN:$VOLUME_1_OUT -v $VOLUME_2_IN:$VOLUME_2_OUT -v $VOLUME_3_IN:$VOLUME_3_OUT -v $VOLUME_4_IN:$VOLUME_4_OUT"

docker run $PORT_FWD $VOLUME_FWD -dit --name $PROJECT_NAME_PROD $PROJECT_NAME_PROD_IMAGE