import csv

#take country codes as input
code1, code2 = input().split()
flag = False
#empty list to store country names
data = []
#open csv file and store data in a dictionary
with open(r"CSV_FILE_PATH_GOES_IN_HERE") as file:
    reader = csv.DictReader(file)
    #add country names in between the two country codes
    for row in reader:
        if row["Code"] == code1 or row["Code"] == code2:
            flag = not flag
            continue
        if flag == True:
            data.append(row["Name"])
#print country names in sorted order
for item in sorted(data):
    print(item)
