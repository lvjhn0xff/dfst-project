# --- declare arguments --- #
ARG PROJECT_BACKEND_HTTP_SERVER_IMAGE
ARG LOCAL_UID
ARG LOCAL_GID

# --- download project back-end image --- # 
FROM $PROJECT_BACKEND_HTTP_SERVER_IMAGE

# --- fix folder permissions --- #
RUN mkdir /.cache/
RUN chown -R $LOCAL_UID:$GLOBAL_UID /.cache/