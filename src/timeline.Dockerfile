FROM rocker/tidyverse:latest

MAINTAINER Jeremy Leipzig <leipzig@gmail.com>

#label-schema see http://label-schema.org/rc1/
LABEL org.label-schema.build-date="2020-06-12T11:28:47Z"
LABEL org.label-schema.name = "timeline"
LABEL org.label-schema.description = "This generates the ARR timeline plot"
LABEL org.label-schema.schema-version = "1.0"
LABEL org.label-schema.docker.cmd= "docker run -v report:/tmp/report leipzig/metadata-in-rcr-timeline:v0.4"

RUN Rscript -e "install.packages(c('ggthemes','ggpubr'), repo = '$CRAN')"

WORKDIR /tmp
ADD src/timeline.Rmd /usr/local/bin/timeline.Rmd
ADD src/timelinehelper.R /usr/local/bin/timelinehelper.R
RUN chmod +x /usr/local/bin/timelinehelper.R
# get the git commit for version stamping the report
ADD .git /.git

# we engage a simple helper script to conform to CWL, which wants typical space-separated arguments. ENTRYPOINT wreaks havoc on CWL, so we avoid that
# for CWL the basecommand is timelinehelper.R and the first argument is the output html path relative to tmp on the container side
CMD ["timelinehelper.R","report/timeline.html"]