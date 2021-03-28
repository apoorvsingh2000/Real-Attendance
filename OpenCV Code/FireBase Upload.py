import pandas as pd
import firebase_admin
from firebase_admin import credentials, firestore

cred = credentials.Certificate('winhacks21-firebase-adminsdk-rk6q7-b476589000.json')
firebase_admin.initialize_app(cred,
{
'databaseURL': 'https://winhacks21.firebaseio.com/'
})
db = firestore.client()
doc_ref = db.collection(u'attendance')
# Import data
df = pd.read_csv('Attendance_Stats.csv')
tmp = df.to_dict(orient='records')
list(map(lambda x: doc_ref.add(x), tmp))