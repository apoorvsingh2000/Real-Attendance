import cv2
import face_recognition as fc
import csv
from datetime import datetime
cap  = cv2.VideoCapture(0)
path = "Resources/haarcascades/haarcascade_frontalface_default.xml"
table = [[450,290,150,400]]
faceCascade= cv2.CascadeClassifier(path)
Names = []
Rollno = []


def getData():
    with open('Resources/Student Details.csv', 'r+') as f:
        DataList = f.readlines()
        for line in DataList:
            entry = line.split(',')
            Rollno.append(entry[0])
            Names.append(entry[1])

getData()
print(Rollno)
print(Names)


def Table(table,img):
    for i in table:
        x1, y1, x2, y2 = i
        cv2.rectangle(img,(x1,y1),(x2,y2),(255,0,0),2)

def StudentActivity(names):
    for name in names:
        with open(f'{name}_Activity.csv', 'w', newline='') as f:
            f.write('Date,Activity,Time')
    with open('Attendance_Stats.csv', 'w', newline='') as f:
        f.write('Time,Student_Absent,Strenght')

StudentActivity(Names)

def AttendanceChecker(names,marker,table,rollno,img):
    for i, b, name, c in zip(marker, table,names,rollno):
        x, y = i
        x1, y1, x2, y2 = b
        Attn = []
        with open('Attendance_Stats.csv', 'a') as f:
            if(x<b[0] and x>b[2] and y<b[3] and y>0):
                if(name in Attn):
                    Attn.pop(c-1)
            else:
                if(name not in Attn):
                    Attn.append(name)
                for e in Attn:
                    now = datetime.now()
                    Dtime = now.strftime('%H:%M:%S')
                    g = len(Names) - len(Attn)
                    f.write(f'\n{Dtime},{e},{g}')
            print(Attn)
        cv2.rectangle(img,(x1,0),(x2,y2),(255,0,0),4)
        cv2.putText(img,name,(x2,50),cv2.FONT_HERSHEY_PLAIN,4,(255,0,0),4)


def activity(markers,names,table):
    for i, b, name in zip(markers,table,names):
        x, y = i
        Name =f'{name}_Activity.csv'
        print(name)
        if(x<b[0] and x>b[2] and y<b[3] and y>b[1]):
            with open(f'{Name}', 'a') as f:
                writer = csv.writer(f)
                now = datetime.now()
                Dtime = now.strftime('%H:%M:%S')
                Date = now.date()
                writer.writerow([f'{Date}','Head Down', f'{Dtime}'])
            print('Heads down')

        else:
            with open(f'{Name}', 'a') as f:
                now = datetime.now()
                Dtime = now.strftime('%H:%M:%S')
                Date = now.date()
                f.write(f'\n{Date},Head Up, {Dtime}')
            print('Heads up')

while(True):
    success, img = cap.read()
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    CurFrameLocation = fc.face_locations(img)
    markers = []
    for Loc in CurFrameLocation:
        y1, x2, y2, x1 = Loc
        # y1, x2, y2, x1 = y1*4 , x2*4, y2*4, x1*4
        cv2.rectangle(img, (x1, y1), (x2, y2), (255, 0, 0), 1)
        cv2.circle(img,(x1+int((x2-x1)/2),y1+int((y2-y1)/2)),4,(255,0,0),cv2.FILLED)
        markers.append([x1+int((x2-x1)/2),y1+int((y2-y1)/2)])
        print((x1+int((x2-x1)/2),y1+int((y2-y1)/2)))
    Table(table,img)
    activity(markers,Names,table)
    AttendanceChecker(Names,markers,table,Rollno,img)
    img = cv2.cvtColor(img,cv2.COLOR_RGB2BGR)
    cv2.imshow("Result", img)
    cv2.waitKey(1)