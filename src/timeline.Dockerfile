FROM rocker/tidyverse:latest

MAINTAINER Jeremy Leipzig <leipzig@gmail.com>


#label-schema see http://label-schema.org/rc1/
LABEL org.label-schema.build-date="2020-06-12T11:28:47Z"
LABEL org.label-schema.name = "timeline"
LABEL org.label-schema.description = "This generates the ARR timeline plot"
LABEL org.label-schema.schema-version = "1.0"
LABEL org.label-schema.docker.cmd= "docker run -d -p 5000:5000 -v config.json:/etc/config.json myapp"

RUN Rscript -e "install.packages(c('ggthemes','ggpubr'), repo = '$CRAN')"

WORKDIR /tmp
ADD src/timeline.Rmd /usr/local/bin/timeline.Rmd
ADD src/timelinehelper.R /usr/local/bin/timelinehelper.R
RUN chmod +x /usr/local/bin/timelinehelper.R
# get the git commit for version stamping the report
ADD .git /.git

#ENTRYPOINT wreaks havoc on CWL
#https://github.com/common-workflow-language/common-workflow-language/issues/522
#this is the command without the helperscript
#CMD ["/usr/local/bin/Rscript", "-e", "rmarkdown::render('timeline.Rmd', output_file='/report/timeline.html', intermediates_dir='/tmp')"]

# we engage a simple helper script to conform to CWL, which wants typical space-separated arguments
CMD ["timelinehelper.R","report/timeline.html"]