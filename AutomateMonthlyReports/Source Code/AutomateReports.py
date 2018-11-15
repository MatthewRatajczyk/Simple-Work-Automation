from tkinter import filedialog
from tkinter import *
import tkinter.simpledialog
import pandas
root = Tk()

# initialdir is where we wrtie the file to
csv_file =  filedialog.askopenfilename(initialdir = "",title = "Select Disk Utilization.CSV",filetypes=[("CSV Files",".csv")])              
inputData = pandas.read_csv(csv_file, skiprows=2)

excel_file =  filedialog.askopenfilename(initialdir = "",title = "Select The Report.XML")              

writeToFile = filedialog.askopenfilename(initialdir = "",title = "Where will the finsihed data be written to?")              
date = tkinter.simpledialog.askstring("Report Month","Type in the month that this report is for ")
date = date.title()

root.destroy()
outputData = pandas.read_excel(excel_file, skiprows=49, skipcols=1)

outputData = outputData.drop(columns=['Unnamed: 0'])
outputData = outputData[:-67]
outputData.columns = ['a', 'b','January','February','March','April','May','June','July','August','September','October','November','December','o']
outputDataIndex = outputData.drop(columns=[ 'b','January','February','March','April','May','June','July','August','September','October','November','December','o'])
inputDataIndex = inputData.drop(columns=[ 'Disk','Size','% Used', 'Avg','Last Poll' ])
Total = 0


for Value in range(len(outputData.index)):
    serverValue = 0
    x = (str(outputData.iloc[Value]['a']))
    for index, row in inputData.iterrows():
        y = row['Device']
        if x.lower() == y.lower():
            serverValue = serverValue + int(row[('Max')])/1000000000
    print("Final value for " + str(x) + ' Max Size ' + str(serverValue))
    outputData.set_value(Value, date, serverValue)
    

#http://pandas.pydata.org/pandas-docs/stable/generated/pandas.DataFrame.to_excel.html    
writer = pandas.ExcelWriter(writeToFile, engine='xlsxwriter')
outputData.to_excel(writer, sheet_name='Sheet1', header=False, index=False)
writer.save()



print("Where good")


