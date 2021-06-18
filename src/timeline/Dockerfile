FROM rocker/tidyverse:latest

MAINTAINER Jeremy Leipzig <leipzig@gmail.com>
#usage: docker run -v report:/tmp/report leipzig/metadata-in-rcr-timeline:v0.4

#https://github.com/opencontainers/image-spec/blob/master/annotations.md
LABEL org.opencontainers.image.created="2020-06-12T11:28:47Z"
LABEL org.opencontainers.image.title = "timeline"
LABEL org.opencontainers.image.description = "This generates the ARR timeline plot"
LABEL org.opencontainers.image.revision = "25cab28f82751df9df4f9115da3e829e5169f15d"
LABEL org.opencontainers.image.url = "https://github.com/leipzig/metadata-in-rcr"

RUN apt-get install -y --no-install-recommends libxt6

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