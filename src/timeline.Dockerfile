FROM rocker/tidyverse:latest

MAINTAINER Jeremy Leipzig <leipzig@gmail.com>

# Set one or more individual labels
LABEL com.example.version="0.0.1-beta"
LABEL com.example.release-date="2020-06-11"
LABEL com.example.version.is-production="FALSE"


RUN Rscript -e "install.packages(c('ggthemes','ggpubr'), repo = '$CRAN')"

WORKDIR /
ADD src/timeline.Rmd src/timeline.Rmd
# get the git commit
ADD .git .git

ENTRYPOINT ["/usr/local/bin/Rscript", "-e"]

CMD ["rmarkdown::render('src/timeline.Rmd', output_file='/report/timeline.html', intermediates_dir='/tmp')"]

#/usr/local/bin/Rscript -e "rmarkdown::render('src/timeline.Rmd', output_file='/report/timeline.html', intermediates_dir='/tmp')"