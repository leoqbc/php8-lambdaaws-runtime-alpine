FROM php:8.0.7-alpine3.13

ENV LAMBDA_TASK_ROOT=/var/task
ENV LAMBDA_RUNTIME_DIR=/var/runtime

RUN mkdir /var/task

COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY aws-lambda-rie /usr/local/bin/aws-lambda-rie

COPY runtime ${LAMBDA_RUNTIME_DIR}

RUN chmod +x /docker-entrypoint.sh \
    && chmod +x /usr/local/bin/aws-lambda-rie \
    && chmod 0755 -R ${LAMBDA_RUNTIME_DIR} \
    && chmod 0755 -R ${LAMBDA_TASK_ROOT}

WORKDIR ${LAMBDA_TASK_ROOT}

COPY php.ini /usr/local/etc/php/php.ini

COPY task ${LAMBDA_TASK_ROOT}

ENTRYPOINT [ "/docker-entrypoint.sh" ]