FROM rocker/tidyverse:latest

MAINTAINER Jeremy Leipzig <leipzig@gmail.com>

# System dependencies for required R packages
RUN  rm -f /var/lib/dpkg/available \
  && rm -rf  /var/cache/apt/* \
  && apt-get update -qq \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    git

# Pre-compiled pandoc required by rmarkdown
# Version from: https://github.com/metacran/r-builder/blob/master/pkg-build.sh
# Scripts from: https://github.com/jangorecki/dockerfiles/blob/master/r-pkg/Dockerfile
RUN PANDOC_VER="1.17.2" \
  && PANDOC_DIR="/opt/pandoc" \
  && PANDOC_URL="https://s3.amazonaws.com/rstudio-buildtools/pandoc-${PANDOC_VER}.zip" \
  && mkdir -p "${PANDOC_DIR}" \
  && wget --no-check-certificate -O /tmp/pandoc-${PANDOC_VER}.zip ${PANDOC_URL} \
  && unzip -j /tmp/pandoc-${PANDOC_VER}.zip "pandoc-${PANDOC_VER}/linux/debian/x86_64/pandoc" -d "${PANDOC_DIR}" \
  && chmod +x "${PANDOC_DIR}/pandoc" \
  && ln -s "${PANDOC_DIR}/pandoc" /usr/local/bin \
  && unzip -j /tmp/pandoc-${PANDOC_VER}.zip "pandoc-${PANDOC_VER}/linux/debian/x86_64/pandoc-citeproc" -d "${PANDOC_DIR}" \
  && chmod +x "${PANDOC_DIR}/pandoc-citeproc" \
  && ln -s "${PANDOC_DIR}/pandoc-citeproc" /usr/local/bin \
  && rm -f /tmp/pandoc-${PANDOC_VER}.zip

RUN Rscript -e "install.packages(c('devtools','BiocManager','knitr','rmarkdown','shiny','RCurl'), repos = 'https://cran.rstudio.com')"

RUN mkdir /liftrroot/
WORKDIR /liftrroot/
