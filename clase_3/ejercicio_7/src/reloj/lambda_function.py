"""Publica la hora UTC en el topic SNS indicado por el entorno."""

import os
from datetime import datetime, timezone

import boto3


def lambda_handler(event, context):
    topic_arn = os.environ["SNS_TOPIC_ARN"]
    identificador = os.environ["IDENTIFICADOR_ALUMNO"]
    ahora = datetime.now(timezone.utc).strftime("%Y-%m-%d %H:%M:%S UTC")
    mensaje = f"Son las {ahora} el pdf subido al campus virtual no es el que estais enseñando en clase"

    boto3.client("sns").publish(
        TopicArn=topic_arn,
        Message=mensaje,
        Subject=f"Aviso curso UCM - {identificador}",
    )

    return {"statusCode": 200, "body": mensaje}
