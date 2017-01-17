library(rmarkdown)

setwd("~/Dropbox (Personal)/Mills/Mills Website/")

#Render the site
render_site()

#Creates a PDF of the syllabus
rmarkdown::render("syllabus.Rmd", "pdf_document",output_file="./syllabus.pdf")

#Shell Script to copy files and move update git
system("bash git.sh")

