from django.db import models

# Create your models here.
class Login(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    type=models.CharField(max_length=100)


class Category(models.Model):
    name=models.CharField(max_length=100)


class Workers(models.Model):
    worker_name=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    city=models.CharField(max_length=100)
    state=models.CharField(max_length=100)
    pin=models.CharField(max_length=100)
    CATEGORY=models.ForeignKey(Category,default=1,on_delete=models.CASCADE)
    phone_number=models.CharField(max_length=100)
    photo=models.CharField(max_length=100)
    status=models.CharField(max_length=100)
    gender=models.CharField(max_length=100)
    LOGIN=models.ForeignKey(Login,default=1,on_delete=models.CASCADE)


class Users(models.Model):
    uname=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    city=models.CharField(max_length=100)
    state=models.CharField(max_length=100)
    pin=models.CharField(max_length=100)
    photo=models.CharField(max_length=500)
    gender=models.CharField(max_length=100)
    phone=models.CharField(max_length=100)
    LOGIN=models.ForeignKey(Login,default=1,on_delete=models.CASCADE)


class Feedback(models.Model):
    feedback=models.CharField(max_length=100)
    USER=models.ForeignKey(Users, default=1, on_delete=models.CASCADE)
    date=models.CharField(max_length=100)

class Complaints(models.Model):
    complaints=models.CharField(max_length=100)
    USER=models.ForeignKey(Users, default=1, on_delete=models.CASCADE)
    date=models.CharField(max_length=100)
    replay=models.CharField(max_length=100)
    status=models.CharField(max_length=100)

class Evstation(models.Model):
    station_name=models.CharField(max_length=100)
    place=models.CharField(max_length=100)
    email=models.CharField(max_length=100)
    city=models.CharField(max_length=100)
    state=models.CharField(max_length=100)
    pin=models.CharField(max_length=100)
    photo=models.CharField(max_length=300)
    status=models.CharField(max_length=100)
    phone_number=models.CharField(max_length=100)
    LOGIN=models.ForeignKey(Login,default=1,on_delete=models.CASCADE)




class EvComplaints(models.Model):
    complaints=models.CharField(max_length=100)
    USER=models.ForeignKey(Users, default=1, on_delete=models.CASCADE)
    EVSTATION=models.ForeignKey(Evstation, default=1, on_delete=models.CASCADE)
    date=models.CharField(max_length=100)
    replay=models.CharField(max_length=100)
    status=models.CharField(max_length=100)

class Charger(models.Model):
    EV_STATION=models.ForeignKey(Evstation,on_delete=models.CASCADE)
    unit=models.CharField(max_length=100)
    amount=models.CharField(max_length=100)

class Slots(models.Model):
    EV_STATION=models.ForeignKey(Evstation, default=2, on_delete=models.CASCADE)
    date=models.DateField()
    charges=models.CharField(max_length=100,default="")
    free_slot=models.CharField(max_length=100,default="")
    unit=models.CharField(max_length=100,default="")

class BookingSlot(models.Model):
    SLOT_ID=models.ForeignKey(Slots, default=1, on_delete=models.CASCADE)
    USER=models.ForeignKey(Users, default=1, on_delete=models.CASCADE)
    date=models.DateField()
    status=models.CharField(max_length=100)

class Reveiw(models.Model):
    reveiw=models.CharField(max_length=100)
    LOGIN=models.ForeignKey(Login, default=1, on_delete=models.CASCADE)
    USER=models.ForeignKey(Users, default=1, on_delete=models.CASCADE)
    date=models.CharField(max_length=100)
    type=models.CharField(max_length=100)

class StationReview(models.Model):
    reveiw=models.CharField(max_length=100)
    USER=models.ForeignKey(Users, default=1, on_delete=models.CASCADE)
    date=models.CharField(max_length=100)
    # type=models.CharField(max_length=100)
    EV_STATION=models.ForeignKey(Evstation, default=1, on_delete=models.CASCADE)

class Chat(models.Model):
    FROMID=models.ForeignKey(Login, default=1, on_delete=models.CASCADE,related_name="fuser")
    TOID=models.ForeignKey(Login, default=1, on_delete=models.CASCADE,related_name="tuser")
    date=models.CharField(max_length=100)
    messages=models.CharField(max_length=100)

class Service(models.Model):
    services=models.CharField(max_length=100)
    WORKERS=models.ForeignKey(Workers,default=1,on_delete=models.CASCADE)


class BookingService(models.Model):
    SERVICE_ID=models.ForeignKey(Service, default=1, on_delete=models.CASCADE)
    USER=models.ForeignKey(Users, default=1, on_delete=models.CASCADE)
    date=models.DateField()
    status=models.CharField(max_length=100)

