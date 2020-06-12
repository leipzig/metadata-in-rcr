#!/usr/local/bin/Rscript

args <- commandArgs(TRUE)

rmarkdown::render('/usr/local/bin/timeline.Rmd', output_file=paste0("/tmp/",args[1]), intermediates_dir='/tmp')

#if read-only then R will not be able to start from anything but /tmp, and throws an error
#the temp files also need to be created in /tmp and seem to involve even more than just intermediates_dir
file.copy(paste0("/tmp/",args[1]), args[1])