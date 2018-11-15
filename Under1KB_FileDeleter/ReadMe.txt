Power shell to delete Microsoft Word ~ files less then 1kb cluttering up your server.

Your going to want to change the $files, and $path variables to where you ACATUALY want to look for / delete. The first 12 lines
of code are just searching recursivly though $files and writing everything Over 1KB and Under 1KB to a text file, you can change
where the file is writen by changing "Out-File  C:\Users\Ratajczyk\Desktop\Over1KB.txt" to "Out-File  C:\Users\%YOURNAME%\Desktop\Over1KB.txt"

Then line 13-14 are taking $path and DELETEING all files that appear in the Under1KB.txt.

It searches for file starting with ~ and logging ALL of them in 2 txt documents Over1kb and Under1KB. 
Then it will delete all files starting with ~ that are also less then 1kb. or everything in Under1KB.txt.