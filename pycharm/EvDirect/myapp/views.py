from django.core.files.storage import FileSystemStorage
from django.db.models import Q
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render

# Create your views here.
from myapp.models import *


def login(request):
    return render(request,"login.html")

def login_post(request):
    username=request.POST['textfield']
    password=request.POST['textfield2']
    var=Login.objects.filter(username=username,password=password)
    if var.exists():
        var2 = Login.objects.get(username=username, password=password)
        request.session['lid']=var2.id
        if var2.type == 'admin':
            return HttpResponse('''<script>alert("Successfully Login");window.location='/myapp/admin_home/'</script>''')
        elif var2.type == 'evstation':
            return HttpResponse('''<script>alert("Successfully Login");window.location='/myapp/ev_charging_home/'</script>''')

        else:
            return HttpResponse('''<script>alert("Invalid username and password");window.location='/myapp/login/'</script>''')


    else:
        return HttpResponse(
            '''<script>alert("Invalid username and password");window.location='/myapp/login/'</script>''')

def logout(request):
    request.session['lid']=''
    return HttpResponse('''<script>alert("Logout successfully");window.location='/myapp/login/'</script>''')


def add_category(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:

        return render(request,"Admin/Add category.html")

def category_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        name=request.POST['textfield']
        a=Category()
        a.name=name
        a.save()

        return HttpResponse('''<script>alert("Successfully Added");window.location='/myapp/admin_home/'</script>''')


def change_password(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        return render(request,"Admin/Change password.html")

def change_passwordpost(request):
    Currentpassword=request.POST['textfield']
    new_password=request.POST['textfield2']
    Confirm_password=request.POST['textfield3']
    var=Login.objects.get(id=request.session['lid'],password=Currentpassword)
    if new_password==Confirm_password:
        var2 = Login.objects.filter(id=request.session['lid']).update(password=Confirm_password)
        return HttpResponse('''<script>alert("Successfully changed");window.location='/myapp/login/'</script>''')

    else:
        return HttpResponse('''<script>alert("Password does not match");window.location='/myapp/change_password/'</script>''')


def complaints_view(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var=Complaints.objects.all()

    return render(request,"Admin/Complaints view.html",{'data':var})

def complaints_viewpost(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        fdate=request.POST['textfield']
        todate=request.POST['textfield2']

        var=Complaints.objects.filter(date__range=[fdate,todate])

        return render(request,"Admin/Complaints view.html",{'data':var})





def edit_category(request,id):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var = Category.objects.get(id=id)
        return render(request,"Admin/Edit category.html",{'data':var})

def edit_categorypost(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        id=request.POST['id']
        name=request.POST['textfield']
        b=Category.objects.get(id=id)
        b.name=name
        b.save()
        return HttpResponse('''<script>alert("Edited");window.location='/myapp/view_category/'</script>''')

def send_reply(request,id):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        return render(request,"Admin/Send replay.html",{'id':id})

def send_reply_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        Reply=request.POST['textarea']
        id=request.POST['rid']
        a=Complaints.objects.get(id=id)
        a.status='Replied'
        a.replay=Reply
        a.save()
        return HttpResponse('''<script>alert("success");window.location='/myapp/complaints_view/'</script>''')


def view_ev_station(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var=Evstation.objects.filter(status="pending")
        return render(request,"Admin/View EV Station.html",{'data':var})

def view_ev_station_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        name = request.POST['textfield']
        var = Evstation.objects.filter(status="pending",station_name__icontains=name)
        return render(request, "Admin/View EV Station.html", {'data': var})


def approve_ev_station(request,id):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var=Evstation.objects.filter(LOGIN=id).update(status='approved')
        var2=Login.objects.filter(id=id).update(type='evstation')
        return HttpResponse("""<script>alert('Approved'); window.location='/myapp/view_ev_station/'</script>""")

def view_approved_ev_station(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var=Evstation.objects.filter(status="approved")
        return render(request,"Admin/Veiw approved Ev station.html",{'data':var})

def view_approved_ev_station_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        name=request.POST['textfield']
        var = Evstation.objects.filter(status="approved",station_name__icontains=name)
        return render(request, "Admin/Veiw approved Ev station.html", {'data': var})


# def view_approved_ev_station_POST(request):
#
#     return render(request, "Admin/Veiw approved Ev station.html")

def reject_ev_station(request, id):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var=Evstation.objects.filter(LOGIN=id).update(status='rejected')
        return HttpResponse("""<script>alert('Rejected'); window.location='/myapp/view_ev_station/'</script>""")

def view_rejected_ev_station(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var = Evstation.objects.filter(status="rejected")
        return render(request,"Admin/Veiw Rejected Ev station.html",{'data':var})

def view_rejected_ev_station_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        name = request.POST['textfield']
        var = Evstation.objects.filter(status="rejected",station_name__icontains=name)
        return render(request, "Admin/Veiw Rejected Ev station.html", {'data': var})


def approve_workers(request, id):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var=Workers.objects.filter(LOGIN__id=id).update(status='approve')
        var1=Login.objects.filter(id=id).update(type='worker')

        return HttpResponse("""<script>alert('approved'); window.location='/myapp/view_pending_workers_and_verify/'</script>""")

def view_approved_workers(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var=Workers.objects.filter(status="approve")
        return render(request,"Admin/View Approved workers.html",{'data':var})

def view_approved_workers_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        name = request.POST['textfield']
        return HttpResponse("OK")


def delete_category(request, id):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var=Category.objects.filter(id=id).delete()
        return HttpResponse("""<script>alert('Deleted'); window.location='/myapp/view_category/'</script>""")

def view_category(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var=Category.objects.all()
        return render(request,"Admin/View category.html",{'data':var})

def view_category_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        name = request.POST['textfield']
        var = Category.objects.filter(name__icontains=name)
        return render(request, "Admin/View category.html", {'data': var})

def view_feedback(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var=Feedback.objects.all()
        return render(request,"Admin/View feedback.html",{'data':var})

def view_feedback_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        fdate = request.POST['textfield']
        tdate = request.POST['textfield2']
        var=Feedback.objects.filter(date__range=[fdate,tdate])

        return render(request,"Admin/View feedback.html",{'data':var})



def view_pending_workers_and_verify(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var=Workers.objects.filter(status="pending")
        return render(request,"Admin/View pending workers and verify.html",{'data':var})

def view_pending_workers_and_verify_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        name = request.POST['textfield']
        var = Workers.objects.filter(status="pending",worker_name__icontains=name)
        return render(request, "Admin/View pending workers and verify.html", {'data': var})


def reject_workers(request, id):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var=Workers.objects.filter(id=id).update(status='reject')
        return HttpResponse("""<script>alert('rejected'); window.location='/myapp/view_pending_workers_and_verify/'</script>""")

def view_rejected_workers(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var=Workers.objects.filter(status="reject")
        return render(request,"Admin/View rejected workers.html",{'data':var})

def view_rejected_workers_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        name = request.POST['textfield']
        var = Workers.objects.filter(status="rejected", worker_name__icontains=name)
        return render(request, "Admin/View rejected workers.html", {'data': var})

def view_review_about_workers(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var=Reveiw.objects.all()
        return render(request,"Admin/view review about workers.html",{'data':var})

def view_review_about_workers_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        fdate = request.POST['textfield']
        tdate = request.POST['textfield2']
        var=Reveiw.objects.filter(date__range=[fdate,tdate])
        return render(request,"Admin/view review about workers.html",{'data':var})

def view_review_about_evstation(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var=StationReview.objects.all()
        return render(request,"Admin/view review about evstation.html",{'data':var})

def view_review_about_evstation_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        fdate = request.POST['textfield']
        tdate = request.POST['textfield2']
        var = StationReview.objects.filter(date__range=[fdate, tdate])
        return render(request, "Admin/view review about evstation.html", {'data': var})




def view_user(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var=Users.objects.all()
        return render(request,"Admin/View User.html",{'data':var})

def view_user_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        name = request.POST['textfield']
        var = Users.objects.filter(uname__icontains=name)
        return render(request, "Admin/View User.html", {'data': var})


def admin_home(request):
    return render(request,"Admin/home_index.html")

#=======Ev charging==========================

def ev_signup(request):
    return render(request, "EVcharging/Signup.html")

def ev_signup_post(request):
    sname= request.POST['textfield']
    email= request.POST['textfield2']
    password= request.POST['textfield4']
    place= request.POST['textfield5']
    city= request.POST['textfield6']
    state= request.POST['textfield7']
    pin= request.POST['textfield8']
    phone= request.POST['textfield9']
    photo= request.FILES['textfield10']

    from datetime import datetime
    date=datetime.now().strftime('%Y%m%d-%H%M%S')
    fs=FileSystemStorage()
    fs.save(date,photo)
    path=fs.url(date)


    lobj=Login()
    lobj.username=email
    lobj.password=password
    lobj.type='pending'
    lobj.save()


    var=Evstation()
    var.station_name=sname
    var.email=email
    var.place=place
    var.city=city
    var.state=state
    var.pin=pin
    var.phone_number=phone
    var.photo=path
    var.status='pending'
    var.LOGIN=lobj
    var.save()

    return HttpResponse("""<script>alert('Registration request send, We will check your information to approve your account.');window.location='/myapp/login/'</script>""")

def ev_editstation(request,id):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var=Evstation.objects.get(id=id)
        return render(request,'EVcharging/Edit ev station.html',{'data':var})

def ev_editstation_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        id=request.POST['id']
        sname = request.POST['textfield']
        email = request.POST['textfield2']
        place = request.POST['textfield5']
        city = request.POST['textfield6']
        state = request.POST['textfield7']
        pin = request.POST['textfield8']
        phone = request.POST['textfield9']


        var=Evstation.objects.get(id=id)
        if 'textfield10' in request.FILES:
            photo = request.FILES['textfield10']

            from datetime import datetime
            date = datetime.now().strftime('%Y%m%d-%H%M%S')
            fs = FileSystemStorage()
            fs.save(date,photo)
            path=fs.url(date)
            var.photo=path
        var.station_name = sname
        var.email = email
        var.place = place
        var.city = city
        var.state = state
        var.pin = pin
        var.phone_number = phone
        var.status = 'pending'
        var.save()
        return HttpResponse("""<script>alert('Edited');window.location='/myapp/ev_manageprofile/'</script>""")

def ev_changepassword(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        return render(request, "EVcharging/Change password.html")

def ev_changepassword_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        currentpassword= request.POST['textfield']
        newpassword= request.POST['textfield2']
        confirmpassword= request.POST['textfield3']
        var = Login.objects.get(id=request.session['lid'], password=currentpassword)
        if newpassword == confirmpassword:
            var2 = Login.objects.filter(id=request.session['lid']).update(password=confirmpassword)
            return HttpResponse('''<script>alert("Successfully changed");window.location='/myapp/login/'</script>''')

        else:
            return HttpResponse('''<script>alert("Password does not match");window.location='/myapp/ev_change_password/'</script>''')


# def ev_manageprofile(request):
#     return render(request, "EVcharging/Manage profile.html")
#
# def ev_manageprofile_post(request):
#     sname = request.POST['textfield']
#     email = request.POST['textfield2']
#     password = request.POST['textfield3']
#     place = request.POST['textfield4']
#     city = request.POST['textfield5']
#     state = request.POST['textfield6']
#     pin = request.POST['textfield7']
#     phone = request.POST['textfield8']
#     photo = request.POST['textfield9']
#     return HttpResponse("""<script>alert('Profile updated')window.location='/myapp/ev_manageprofile/'</script>""")
def ev_manageprofile(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var=Evstation.objects.get(LOGIN=request.session['lid'])
        return render(request,"EVcharging/Manage profile.html",{'data':var})


def ev_managecharges(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        return render(request, "EVcharging/Manage Charges.html")

def ev_managecharges_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        unit = request.POST['select']
        amount = request.POST['textfield']
        cobj=Charger()
        cobj.unit=unit
        cobj.amount=amount
        cobj.EV_STATION_id=Evstation.objects.get(LOGIN=request.session['lid']).id
        cobj.save()
        return HttpResponse("""<script>alert('Charge added');window.location='/myapp/ev_managecharges/'</script>""")

def ev_view_charges(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        cobj=Charger.objects.all()
        return render(request, "EVcharging/view charges.html",{"data":cobj})

def ev_view_charges_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        a= request.POST['textfield']
        var=Charger.objects.filter(unit__icontains=a)
        return render(request, "EVcharging/view charges.html",{"data":var})

def ev_edit_charges(request,id):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        cobj=Charger.objects.get(id=id)
        return render(request, "EVcharging/edit charges.html",{"data":cobj})

def ev_edit_charges_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        unit = request.POST['select']
        amount = request.POST['textfield']
        id=request.POST['id']
        Charger.objects.filter(pk=id).update(unit=unit,amount=amount)
        return HttpResponse("""<script>alert('Charge edited');window.location='/myapp/ev_view_charges/'</script>""")

def ev_delete_charges_post(request,id):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        Charger.objects.filter(pk=id).delete()
        return HttpResponse("""<script>alert('Charge deleted');window.location='/myapp/ev_edit_charges/'</script>""")

def ev_view_bookingforslot(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        bobj=BookingSlot.objects.filter(status='pending')
        # SLOT_ID__EV_STATION__LOGIN_id = request.session['lid']
        return render(request, "EVcharging/view booking for slot.html",{"data":bobj})

def ev_view_bookingforslot_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        a = request.POST['textfield']
        b = request.POST['textfield2']
        bobj=BookingSlot.objects.filter(date__range=[a,b])
        return render(request, "EVcharging/view booking for slot.html",{"data":bobj})

def approve_evstation(request,id):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var=BookingSlot.objects.filter(id=id).update(status='approve')
        return HttpResponse("""<script>alert('Approved');window.location='/myapp/ev_view_bookingforslot/'</script>""")

def reject_evstation(request,id):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var=BookingSlot.objects.filter(id=id).update(status='reject')
        return HttpResponse("""<script>alert('Rejected');window.location='/myapp/ev_view_bookingforslot/'</script>""")


def ev_addslots(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        # r=Evstation.objects.all()
        return render(request, "EVcharging/Add slots.html")
        # return render(request, "EVcharging/Add slots.html",{'data':r})


def add_slot(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        return render(request,"EVcharging/Add slots.html")

def add_slot_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        date = request.POST['textfield2']
        freeslots = request.POST['textfield3']
        unit = request.POST['textfield5']
        charges = request.POST['textfield4']

        obj=Slots()
        obj.date=date
        obj.free_slot = freeslots
        obj.unit = unit
        obj.charges = charges
        obj.EV_STATION = Evstation.objects.get(LOGIN=request.session['lid'])
        obj.save()
        return HttpResponse("ok")


def ev_addslots_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        date = request.POST['textfield2']
        freeslots = request.POST['textfield3']
        unit=request.POST['textfield5']
        charges= request.POST['textfield4']
        # ss=Evstation()
        obj=Slots()
        obj.date=date
        obj.free_slot=freeslots
        obj.unit=unit
        obj.charges=charges
        obj.EV_STATION=Evstation.objects.get(LOGIN=request.session['lid'])
        # obj.EV_STATION=ss
        obj.save()
        # return HttpResponse("""<script>alert('Slot added')window.location='/myapp/ev_addslots/'</script>""")
        return HttpResponse("""<script>alert('Slot added');window.location='/myapp/ev_addslots/'</script>""")

def ev_edit_slots(request,id):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        ss = Slots.objects.get(id=id)
        r = Evstation.objects.all()
        return render(request, "EVcharging/Edit slots.html",{'data':r, 'data1':ss})

def ev_edit_slots_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        id = request.POST['id']
        date = request.POST['textfield2']
        freeslots = request.POST['textfield3']
        charges = request.POST['textfield4']
        # ss = Evstation.objects.get(id=id)
        obj = Slots.objects.get(id=id)
        obj.date = date
        obj.free_slot = freeslots
        obj.charges = charges
        obj.save()
        return HttpResponse("""<script>alert('Slot update');window.location='/myapp/ev_view_slots/'</script>""")

def ev_delete_slots(request,id):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        obj = Slots.objects.get(id=id)
        obj.delete()
        return HttpResponse("""<script>alert('Slot Delete');window.location='/myapp/ev_view_slots/'</script>""")

def ev_view_slots(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var=Slots.objects.filter(EV_STATION__LOGIN_id=request.session['lid'])
        return render(request, "EVcharging/view slots.html",{'data':var})

def ev_view_slots_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        date1=request.POST['textfield']
        date=request.POST['textfield2']
        var = Slots.objects.filter(EV_STATION__LOGIN_id=request.session['lid'],date__range=[date1,date])
        return render(request, "EVcharging/view slots.html", {'data': var})

def ev_view_user(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        var = Users.objects.all()
        return render(request, "EVcharging/view  users.html",{'data':var})

def ev_view_user_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        name = request.POST['textfield']
        var = Users.objects.filter(uname__icontains=name)
        return render(request, "EVcharging/view  users.html",{'data':var})

def ev_view_complaints(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        res=EvComplaints.objects.filter(EVSTATION__LOGIN_id=request.session['lid'])
        return render(request, "EVcharging/complaints view.html/",{'data':res})

def ev_view_complaints_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        a = request.POST['textfield']
        b = request.POST['textfield2']
        res=EvComplaints.objects.filter(EVSTATION__LOGIN_id=request.session['lid'],date__range=[a,b])
        return render(request, "EVcharging/complaints view.html/",{'data':res})

def ev_sendreply(request,did):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        res=EvComplaints.objects.get(id=did)
        return render(request, "EVcharging/Send reply.html",{'data':res})

def ev_sendreply_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        did=request.POST["id1"]
        Reply = request.POST['textarea']
        obj=EvComplaints.objects.get(id=did)
        obj.replay=Reply
        obj.status='replied'
        obj.save()
        return HttpResponse("""<script>alert('Replied Successfully');window.location='/myapp/ev_view_complaints/'</script>""")

def ev_view_review(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        # var=StationReview.objects.filter(EV_STATION__LOGIN_id=request.session['lid'])
        var=StationReview.objects.filter(EV_STATION__LOGIN_id= request.session['lid'])
        # for i in var:
        #     l=[]
        #     if i.type = 'worker':
        #         w=Workers.objects.get(LOGIN_id=i.LOGIN.id)
        #         l.append({'reveiw':i.reveiw,'date':i.date,'type':i.type,)

        return render(request, "EVcharging/view review about charging station.html",{'data':var})

def ev_view_review_post(request):
    if request.session['lid'] == '':
        return HttpResponse('''<script>alert("Allready logouted");window.location='/myapp/login/'</script>''')
    else:
        fdate = request.POST['textfield']
        tdate = request.POST['textfield2']
        var=StationReview.objects.filter(date__range=[fdate,tdate],EV_STATION__LOGIN_id=request.session['lid'])
        return render(request, "EVcharging/view review about charging station.html",{'data':var})

def ev_charging_home(request):
    return render(request, "EVcharging/EVcharging_home.html")


#=======Worker==========================
def login_android(request):
    username = request.POST['username']
    password = request.POST['password']
    var = Login.objects.filter(username=username, password=password)
    if var.exists():
        var2 = Login.objects.get(username=username, password=password)
        lid= var2.id
        if var2.type == 'worker':
            return JsonResponse({'status':'ok','lid':lid,'type':var2.type})
        elif var2.type == 'user':
            return JsonResponse({'status':'ok','lid':lid,'type':var2.type})
        else:
            return JsonResponse({'status':'no'})

    else:
        return JsonResponse({'status':'no'})

def worker_signup(request):
    wname=request.POST['wname']
    email=request.POST['email']
    password=request.POST['password']
    confirm_password=request.POST['confirm_password']
    place = request.POST['place']
    city=request.POST['city']
    state=request.POST['state']
    pin=request.POST['pin']
    category=request.POST['category']
    phone=request.POST['phone']
    photo=request.POST['photo']
    gender=request.POST['gender']
    import datetime
    import base64
    #
    date = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
    a = base64.b64decode(photo)
    fh = open("C:\\Users\\adilt\\OneDrive\\Documents\\EvDirect[1]\\EvDirect\\media\\worker\\" + date + ".jpg", "wb")
    path = "/media/worker/" + date + ".jpg"
    fh.write(a)
    fh.close()

    var=Login()
    var.username=email
    var.password=confirm_password
    var.type='pending'
    var.save()
    obj=Workers()
    obj.worker_name=wname
    obj.place=place
    obj.email=email
    obj.city=city
    obj.state=state
    obj.pin=pin
    obj.CATEGORY_id=category
    obj.phone_number=phone
    obj.photo=path
    obj.status='pending'
    obj.gender=gender
    obj.LOGIN_id=var.id
    obj.save()
    return JsonResponse({'status': 'ok'})


def view_category_worker(request):
    res=Category.objects.all()
    l=[]
    for i in res:
        l.append({'id':i.id,'category':i.name})
    return JsonResponse({'status': 'ok','data':l})


def worker_changepassword(request):
    current_password=request.POST['current_password']
    new_password=request.POST['new_password']
    confirm_password=request.POST['confirm_password']
    lid=request.POST['lid']

    var = Login.objects.filter(id=lid, password=current_password)
    if var.exists():
        if new_password == confirm_password:
            var2 = Login.objects.filter(id=lid).update(password=confirm_password)
            return JsonResponse({'status': 'ok'})

        else:
            return JsonResponse({'status': 'not ok'})

    else:
        return JsonResponse({'status': 'not ok'})

def worker_view_profile(request):
    lid = request.POST['lid']
    res = Workers.objects.get(LOGIN_id=lid)
    return JsonResponse({"status":"ok", "name":res.worker_name, "gender":res.gender,"cat":res.CATEGORY.name, "email":res.email, "phone":res.phone_number, "place":res.place, "city":res.city, "pin":res.pin, "state":res.state, "photo":res.photo})

def  worker_edit_profile(request):
    wname = request.POST['wname']
    email = request.POST['email']
    place = request.POST['place']
    city = request.POST['city']
    state = request.POST['state']
    pin = request.POST['pin']
    category = request.POST['category']
    phone = request.POST['phone']
    photo = request.POST['photo']
    gender = request.POST['gender']
    lid = request.POST['lid']
    obj = Workers.objects.get(LOGIN_id=lid)

    if len(photo)>0:
        import datetime
        import base64
        #
        date = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
        a = base64.b64decode(photo)
        fh = open("C:\\Users\\adilt\\OneDrive\\Documents\\EvDirect[1]\\EvDirect\\media\\worker\\" + date + ".jpg", "wb")
        path = "/media/worker/" + date + ".jpg"
        fh.write(a)
        fh.close()
        obj.photo = path
        obj.save()
    var = Login.objects.get(id=lid)
    var.username = email
    var.save()

    obj.worker_name = wname
    obj.place = place
    obj.email = email
    obj.city = city
    obj.state = state
    obj.pin = pin
    obj.CATEGORY_id = category
    obj.phone_number = phone
    obj.gender = gender
    obj.save()
    return JsonResponse({"status": "ok"})

def worker_add_services(request):
    services=request.POST['services']
    lid=request.POST['lid']
    obj=Service()
    obj.services=services
    obj.WORKERS=Workers.objects.get(LOGIN_id=lid)
    obj.save()
    return JsonResponse({"status":"ok"})

def worker_edit_services(request):
    services=request.POST['services']
    workers=request.POST['workers']
    return JsonResponse('ok')

def worker_view_services(request):
    lid=request.POST['lid']
    res = Service.objects.filter(WORKERS__LOGIN_id=lid)
    l = []
    for i in res:
        l.append({'id': i.id, 'service': i.services})
    return JsonResponse({'status': 'ok', 'data': l})

def worker_view_userbooking(request):
    lid=request.POST['lid']
    res = BookingService.objects.filter(SERVICE_ID__WORKERS__LOGIN_id=lid,status='pending')
    l = []
    for i in res:
        l.append({'id': i.id, 'service': i.SERVICE_ID.services,'user':i.USER.uname,'date':i.date,'status':i.status})
    return JsonResponse({'status': 'ok', 'data': l})


def worker_confirm_userbooking(request):
    sts = request.POST['status']
    bid = request.POST['bid']
    res = BookingService.objects.filter(id=bid).update(status=sts)
    return JsonResponse({"status":"ok"})

def worker_view_verified_userbooking(request):
    lid=request.POST['lid']
    print(lid)
    res = BookingService.objects.filter(SERVICE_ID__WORKERS__LOGIN_id=lid,status='accepted')
    l = []
    for i in res:
        l.append({'id': i.id, 'service': i.SERVICE_ID.services,'user':i.USER.uname,'date':i.date,'status':i.status,'logid':i.USER.LOGIN.id})
    print(l)
    return JsonResponse({'status': 'ok', 'data': l})

def worker_view_rejected_userbooking(request):
    lid=request.POST['lid']
    res = BookingService.objects.filter(SERVICE_ID__WORKERS__LOGIN_id=lid,status='rejected')
    l = []
    for i in res:
        l.append({'id': i.id, 'service': i.SERVICE_ID.services,'user':i.USER.uname,'date':i.date,'status':i.status})
    return JsonResponse({'status': 'ok', 'data': l})

def worker_chat(request):
    return JsonResponse('ok')

def worker_view_review(request):
    lid=request.POST['lid']
    # var=Reveiw.objects.all()
    var=Reveiw.objects.filter(LOGIN_id=lid)
    l=[]
    for i in var:
        l.append({'id':i.id,'review':i.reveiw,'user':i.USER.uname,'type':i.type,'date':i.date})
    print(l)
    return JsonResponse({'status': 'ok', 'data': l})


#=============== USER ==================

def usr_signup(request):
    uname=request.POST['uname']
    email=request.POST['email']
    password=request.POST['password']
    confirm_password=request.POST['confirm_password']
    place=request.POST['place']
    city=request.POST['city']
    state=request.POST['state']
    pin=request.POST['pin']
    photo=request.POST['photo']
    gender=request.POST['gender']
    phone=request.POST['phone']
    import datetime
    import base64
    #
    date = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
    a = base64.b64decode(photo)
    # fh = open("C:\\Users\\adilt\\OneDrive\\Documents\\EvDirect[1]\\EvDirect\\media\\user\\" + date + ".jpg", "wb")
    fh = open("C:\\Users\\adilt\\OneDrive\\Documents\\EvDirect[1]\\EvDirect\\media\\user\\" + date + ".jpg", "wb")
    path = "/media/user/" + date + ".jpg"
    fh.write(a)
    fh.close()

    var=Login()
    var.username=email
    var.password=confirm_password
    var.type='user'
    var.save()
    obj=Users()
    obj.uname=uname
    obj.place=place
    obj.email=email
    obj.city=city
    obj.state=state
    obj.pin=pin
    obj.phone=phone
    obj.photo=path
    obj.gender=gender
    obj.LOGIN_id=var.id
    obj.save()

    return JsonResponse({'status': 'ok'})

def usr_change_password(request):
    current_password = request.POST['current_password']
    new_password = request.POST['new_password']
    confirm_password = request.POST['confirm_password']
    lid = request.POST['lid']

    var = Login.objects.filter(id=lid, password=current_password)
    if var.exists():
        if new_password == confirm_password:
            var2 = Login.objects.filter(id=lid).update(password=confirm_password)
            return JsonResponse({'status': 'ok'})

        else:
            return JsonResponse({'status': 'not ok'})

    else:
        return JsonResponse({'status': 'not ok'})


def usr_view_profile(request):
    lid=request.POST['lid']
    var=Users.objects.get(LOGIN_id=lid)
    return JsonResponse({'status':'ok','uname':var.uname,'place':var.place,'email':var.email,
                         'city':var.city,'state':var.state,'pin':var.pin,'photo':var.photo,
                         'gender':var.gender,'phone':var.phone})

def usr_edit_profile(request):
    uname = request.POST['uname']
    email = request.POST['email']
    place = request.POST['place']
    city = request.POST['city']
    state = request.POST['state']
    pin = request.POST['pin']
    phone = request.POST['phone']
    photo = request.POST['photo']
    gender = request.POST['gender']
    lid = request.POST['lid']
    obj = Users.objects.get(LOGIN_id=lid)

    if len(photo)>0:
        import datetime
        import base64
        #
        date = datetime.datetime.now().strftime("%Y%m%d%H%M%S")
        a = base64.b64decode(photo)
        fh = open("C:\\Users\\adilt\\OneDrive\\Documents\\EvDirect[1]\\EvDirect\\media\\user\\" + date + ".jpg", "wb")
        path = "/media/user/" + date + ".jpg"
        fh.write(a)
        fh.close()
        obj.photo = path
        obj.save()
    var = Login.objects.get(id=lid)
    var.username = email
    var.save()

    obj.uname = uname
    obj.place = place
    obj.email = email
    obj.city = city
    obj.state = state
    obj.pin = pin

    obj.phone = phone
    obj.gender = gender
    obj.save()
    return JsonResponse({"status": "ok"})

def usr_view_services(request):
    wid = request.POST['wid']
    res = Service.objects.filter(WORKERS__id=wid)
    l = []
    for i in res:
        l.append({'id': i.id, 'service': i.services})
    return JsonResponse({'status': 'ok', 'data': l})

def usr_view_workers(request):
    res=Workers.objects.all()
    l = []
    for i in res:
        l.append({'worker':i.LOGIN.id,'id': i.id, 'worker_name': i.worker_name,'place':i.place,'email':i.email,
                  'city':i.city,'state':i.city,'pin':i.pin,'CATEGORY':i.CATEGORY.name,
                  'phone_number':i.phone_number,'photo':i.photo,'status':i.status,'gender':i.gender,'logid':i.LOGIN.id})
    return JsonResponse({'status': 'ok', 'data': l})


def usr_book_services(request):
    lid=request.POST['lid']
    sid=request.POST['sid']
    from datetime import datetime
    date=datetime.now().date().today()
    status='pending'
    obj=BookingService()
    obj.status=status
    obj.date=date
    obj.USER=Users.objects.get(LOGIN__id=lid)
    obj.SERVICE_ID_id=Service.objects.get(id=sid).id
    obj.save()

    return JsonResponse({'status': 'ok'})


def usr_view_service_status(request):
    lid=request.POST['lid']
    id=Users.objects.get(LOGIN__id=lid)
    res=BookingService.objects.filter(USER_id=id)
    # res=BookingService.objects.all()
    l=[]
    for i in res:
        l.append({'id':i.id,'USER':i.USER.uname,'date':i.date,'status':i.status,'SERVICE':i.SERVICE_ID.services})
    return JsonResponse({'status': 'ok','data':l})

def usr_add_doubts(request):

    return JsonResponse('ok')

def usr_view_solutions(request):
    return JsonResponse('ok')

def usr_view_other_users(request):
    lid=request.POST['lid']
    var = Users.objects.exclude(LOGIN_id=lid)
    l = []
    for i in var:
        l.append({'id': i.id, 'uname': i.uname, 'place': i.place, 'email': i.email, 'city': i.city,
                  'state': i.state, 'pin': i.pin, 'photo': i.photo, 'phone': i.phone,
                  'gender': i.gender, })
    return JsonResponse({'status': 'ok', 'data': l})

def usr_view_ev_stations(request):
    var=Evstation.objects.filter(status='approved')
    l=[]
    for i in var:
        l.append({'id':i.id,'station_name':i.station_name,'place':i.place,'email':i.email,'city':i.city,'state':i.state,'pin':i.pin,'photo':i.photo,'status':i.status,'phone_number':i.phone_number,})
    return JsonResponse({'status': 'ok','data':l})

def usr_book_slots(request):
    lid = request.POST['lid']
    sid = request.POST['slid']
    from datetime import datetime
    date = datetime.now().date().today()
    status = 'pending'
    obj =  BookingSlot()
    obj.status = status
    obj.date = date
    obj.USER = Users.objects.get(LOGIN__id=lid)
    obj.SLOT_ID_id= Slots.objects.get(id=sid).id
    obj.save()
    return JsonResponse({'status': 'ok'})

def usr_view_slots(request):
    evid=request.POST['evid']
    res=Slots.objects.filter(EV_STATION__id=evid)
    l=[]
    for i in res:
        l.append({"id":i.id,"date":i.date,"charges":i.charges,"free_slot":i.free_slot,"unit":i.unit})
    return JsonResponse({"status":"ok","data":l})


def usr_view_booking_status(request):
    lid = request.POST['lid']
    id = Users.objects.get(LOGIN__id=lid)
    res = BookingSlot.objects.filter(USER_id=id)
    l = []
    for i in res:
        l.append(
            {'id': i.id, 'USER': i.USER.uname, 'date': i.date, 'status': i.status, 'SLOT_ID': i.SLOT_ID.charges,'unit':i.SLOT_ID.unit})
    return JsonResponse({'status': 'ok', 'data': l})


def usr_send_feedback(request):
    lid=request.POST['lid']
    feedback=request.POST['feedback']

    obj = Feedback()
    from datetime import datetime
    date=datetime.now().date().today()
    obj.feedback=feedback
    obj.replay = 'pending'
    obj.status = 'pending'
    u=Users.objects.get(LOGIN_id=lid)
    obj.USER_id=u.id
    obj.date=date
    obj.save()
    return JsonResponse({'status':'ok'})

def usr_send_complaint(request):
    lid=request.POST['lid']
    complaint=request.POST['complaint']

    obj = Complaints()
    from datetime import datetime
    date=datetime.now().date().today()
    obj.complaints=complaint
    obj.replay = 'pending'
    obj.status = 'pending'
    u=Users.objects.get(LOGIN_id=lid)
    obj.USER_id=u.id
    obj.date=date
    obj.save()
    return JsonResponse({'status':'ok'})



def usr_send_evstation_complaint(request):
    lid=request.POST['lid']
    eid=request.POST['eid']
    complaint=request.POST['complaint']

    obj = EvComplaints()
    from datetime import datetime
    date=datetime.now().date().today()
    obj.complaints=complaint
    obj.replay = 'pending'
    obj.status = 'pending'
    obj.EVSTATION_id=eid
    u=Users.objects.get(LOGIN_id=lid)
    obj.USER_id=u.id
    obj.date=date
    obj.save()
    return JsonResponse({'status':'ok'})



def usr_view_reply(request):
    lid=request.POST['lid']
    res=Complaints.objects.filter(USER__LOGIN_id=lid)
    l=[]
    for i in res:
        l.append({'id':i.id,'complaints':i.complaints,'date':i.date,'replay':i.replay})
    return JsonResponse({'status':'ok','data':l})




def ev_usr_view_reply(request):
    lid=request.POST['lid']
    eid=request.POST['eid']
    res=EvComplaints.objects.filter(USER__LOGIN_id=lid,EVSTATION_id= eid)
    l=[]
    for i in res:
        l.append({'id':i.id,'complaints':i.complaints,'date':i.date,'replay':i.replay})
    return JsonResponse({'status':'ok','data':l})



def usr_send_review(request):
    lid=request.POST['lid']
    did=request.POST['did']
    print(did)
    reveiw=request.POST['review']
    from datetime import datetime
    date=datetime.now().date().today()
    obj=Reveiw()
    obj.Reveiw=reveiw

    u = Users.objects.get(LOGIN_id=lid)
    obj.USER_id = u.id
    obj.date=date
    obj.type='user'
    obj.reveiw=reveiw
    obj.LOGIN_id=did
    obj.save()
    return JsonResponse({'status':'ok'})




def and_userviewchat(request):
    lid = request.POST['from_id']
    d=request.POST['to_id']
    toid=d
    a=[]
    msg=Chat.objects.filter(Q(FROMID_id=lid, TOID_id=toid) | Q(FROMID_id=toid, TOID_id=lid)).order_by('id')
    for i in msg:
        a.append({"id":i.id,"message":i.messages,"from":i.FROMID_id,"to":i.TOID_id,"date":i.date})
    return JsonResponse({'status': 'ok',"data":a})

def ins_and_userinschat(request):
    lid = request.POST['from_id']
    print(lid)
    message=request.POST["message"]
    d = request.POST['toid']
    # toid = Login.objects.get(id=d)
    toid = d
    msg=Chat()
    msg.messages=message
    msg.FROMID_id=lid
    msg.TOID_id=toid
    from datetime import datetime
    date = datetime.now().strftime("%Y-%m-%d")
    msg.date = date
    # time=datetime.now().strftime("%H:%M:%S")
    # msg.time=time
    msg.save()
    return JsonResponse({'status': 'ok'})


def and_userinschat(request):
    lid = request.POST['from_id']
    print(lid)
    message=request.POST["message"]
    d = request.POST['to_id']
    print(d)
    toid=d
    msg=Chat()
    msg.messages=message
    msg.FROMID_id=lid
    msg.TOID_id=toid
    from datetime import datetime
    date = datetime.now().strftime("%Y-%m-%d")
    msg.date = date
    # time=datetime.now().strftime("%H:%M:%S")

    # msg.time=time
    msg.save()
    return JsonResponse({'status': 'ok'})