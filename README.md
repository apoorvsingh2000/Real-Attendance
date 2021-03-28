# winhacks_21
## Design Link
https://a360.co/3ruFXul

## Design screenshots
![hack busters pi cam v2](https://user-images.githubusercontent.com/58786316/112756383-8a539580-9002-11eb-8132-c51748babe0b.png)
![WhatsApp Image 2021-03-28 at 8 18 40 PM](https://user-images.githubusercontent.com/58786316/112756467-ed452c80-9002-11eb-803b-d8ba15d4a377.jpeg)


## Inspiration
Teachers  of every school/university have often come across the problem of students entering fake attendances or students claiming for attendance even after their absence in the class. 
This practice is unfair towards the students attending the lectures sincerely and it is also tedious work for the professors to keep track of the attendance of every student enrolled in their course.
The aim of our project is to make the process of attendance more fair to students as well as hands-free for the  professors

## What it does
The project has been thought out for the case where students attend lectures in-person.
When a student A enters the class he is supposed to stand in front of  a camera at the class entrance. The camera captures the students face and runs it through a face recognition deep learning model to recognize the student as student A.
Now, the roll number and the name of the student is stored in an excel sheet and he will be assigned a seat.

There will be a second camera in front of the student which will capture his activity throughout the lecture and store the time of his inattentiveness. The inattentive factor is calculated by the total time  a students head is down in a lecture. This code will also create an excel sheet and store the values of how much time student A was attentive in a lecture along with the other details.

Using OpenCV we are detecting the face of the students and we have marked the locations of the tables prerequisite in the class and then we are checking whether the face of student is within the desk area or not.
If the face of the student is near to the table it depicts that the head of the student is down and hence he is not attentive in the class.

Both of these excel files are then uploaded to firestore database to be used by the app created using Flutter which based upon the data of the students marks their attendance and displays it to the professor.
The app even has a login and password feature such that every teacher can keep track of the attendance of their multiple lectures.

This project also helps the university management to check how well a professor is teaching in the class i.e. if more number of students are inactive in class it depicts that teachers are not doing well.

Now the professors need not worry about fair attendance issues as this will be handled by the software and they can now solely focus on teaching.

## How we built it

The CAD design of camera is made using software name fusion 360 by using some basics features of software

The face recognition model was built using Python and OpenCV on Jupyter notebook.
We have used the built in cannaro and caer libraries for creating the deep learning model> This model was trained with 400 images. The image for prediction is captured through the web camera. 
The name and roll no of the student is stored in an excel sheet.

We have used OpenCV and face recognition library to detect faces of the students.

## App screenshots
![WhatsApp Image 2021-03-28 at 8 04 05 PM](https://user-images.githubusercontent.com/58786316/112756169-9c810400-9001-11eb-99cc-3f7555106ad7.jpeg)
![WhatsApp Image 2021-03-28 at 8 04 05 PM (1)](https://user-images.githubusercontent.com/58786316/112756186-b0c50100-9001-11eb-84f4-a4af773177de.jpeg)
![WhatsApp Image 2021-03-28 at 8 04 55 PM](https://user-images.githubusercontent.com/58786316/112756270-0dc0b700-9002-11eb-8fa0-b05aa81f95b1.jpeg)
![WhatsApp Image 2021-03-28 at 8 04 55 PM (1)](https://user-images.githubusercontent.com/58786316/112756279-174a1f00-9002-11eb-85f4-315dbf61a500.jpeg)


## Challenges we ran into
In a real life scenario, only one image per student is obtained for training set. The challenge was to augment a given image to produce 100 more images and yet maintain the accuracy of the deep learning model.

The other challenge faced was issue in the clarity of face detection. Even though there was a face visible in the window the software was sometimes unable to detect it sometimes. This issue was faced due to low quality camera.

## Accomplishments that we're proud of
Successfully generated a design of project model
Successfully collected data using OpenCV and sent it over the internet to the user to be displayed on app.

## What we learned
Image Augmentation
Working on data on Firebase

## What's next for Third Eye
Further using even advanced face recognition algorithms/ deep learning algorithms, the emotions of a students face can be captured and this data can help recognize how well the student is able to grasp the concepts taught in the lecture.
