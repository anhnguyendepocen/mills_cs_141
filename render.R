library(rmarkdown)

setwd("~/Dropbox (Personal)/Mills/Mills Website/")

#Render the site
render_site()

#Creates a PDF of the syllabus
dir.create("./_site/pdfs/")
rmarkdown::render("syllabus.Rmd", "pdf_document",output_file="./_site/pdfs/syllabus.pdf", output_options = list(linkcolor = "blue"))

#Inserts a download link to the PDF syllabus
conn<-file("./_site/syllabus.html")
text <- readLines(conn)
close(conn)
insert_position <- which(stringr::str_detect(text, ".*Last Updated.*")) + 1
d_link <- "<li><i class='fa fa-download' aria-hidden='true'></i><a href='pdfs/syllabus.pdf'> Download Syllabus (pdf)</a></li>"
text_new <- c(text[1:insert_position],d_link,text[(insert_position+1):length(text)])
write(text_new, file = "./_site/syllabus.html")

