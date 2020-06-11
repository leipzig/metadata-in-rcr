FROM rocker/tidyverse:latest

MAINTAINER Jeremy Leipzig <leipzig@gmail.com>

# Set one or more individual labels
LABEL com.example.version="0.0.1-beta"
LABEL com.example.release-date="2020-06-11"
LABEL com.example.version.is-production="FALSE"


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