FROM python:3.14-slim

ARG MULTIQC_VERSION=v1.35
ARG MULTIQC_PLUGIN_VERSION=v0.1.0

LABEL author="Leon Wang" \
      description="MultiQC ${MULTIQC_VERSION} with AbPreP plugin" \
      maintainer="wang.leo@wehi.edu.au"

# Install MultiQC and your plugin together
WORKDIR /app

# Copy your plugin source
COPY . /app/

# Install MultiQC + your plugin in one layer
# This ensures compatibility between the two
# RUN pip install --no-cache-dir multiqc . 
RUN pip install --no-cache-dir multiqc==${MULTIQC_VERSION} ./abprep_plugin/

ENTRYPOINT [ "multiqc" ]
CMD [ "." ]