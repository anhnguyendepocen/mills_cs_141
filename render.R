library(rmarkdown)

setwd("~/Dropbox (Personal)/Mills/Mills Website/")

#Render the site
render_site()

#Creates a PDF of the syllabus
rmarkdown::render("syllabus.Rmd", "pdf_document",output_file="./_site/syllabus.pdf")