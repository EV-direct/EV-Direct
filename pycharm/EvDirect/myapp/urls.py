"""
URL configuration for EvDirect project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from myapp import views

urlpatterns = [
    path('login/',views.login),
    path('add_category/',views.add_category),
    path('change_password/',views.change_password),
    path('complaints_view/',views.complaints_view),
    path('send_reply/<id>',views.send_reply),
    path('view_approved_ev_station/',views.view_approved_ev_station),
    path('view_rejected_ev_station/',views.view_rejected_ev_station),
    path('view_approved_workers/',views.view_approved_workers),
    path('view_category/',views.view_category),
    path('view_ev_station/', views.view_ev_station),
    path('view_feedback/', views.view_feedback),
    path('view_pending_workers_and_verify/', views.view_pending_workers_and_verify),
    path('view_rejected_workers/', views.view_rejected_workers),
    path('view_review_about_workers/', views.view_review_about_workers),
    path('view_review_about_evstation/', views.view_review_about_evstation),
    path('view_user/', views.view_user),

    path('loginpost/',views.login_post),
    path('categorypost/',views.category_post),
    path('change_passwordpost/',views.change_passwordpost),
    path('complaints_viewpost/',views.complaints_viewpost),
    path('send_replaypost/',views.send_reply_post),
    path('view_approved_ev_station_post/', views.view_approved_ev_station_post),
    path('view_rejected_ev_station_post/', views.view_rejected_ev_station_post),
    path('view_approved_workers_post/', views.view_approved_workers_post),
    path('view_category_post/', views.view_category_post),
    path('delete_category/<id>', views.delete_category),
    path('edit_category/<id>', views.edit_category),
    path('edit_categorypost/',views.edit_categorypost),
    path('view_ev_station_post/', views.view_ev_station_post),
    path('approve_ev_station/<id>', views.approve_ev_station),
    path('reject_ev_station/<id>', views.reject_ev_station),

    path('view_feedback_post/', views.view_feedback_post),
    path('view_pending_workers_and_verify_post/', views.view_pending_workers_and_verify_post),
    path('approve_workers/<id>', views.approve_workers),
    path('reject_workers/<id>', views.reject_workers),

    path('view_rejected_workers_post/', views.view_rejected_workers_post),
    path('view_review_about_workers_post/', views.view_review_about_workers_post),
    path('view_review_about_evstation_post/', views.view_review_about_evstation_post),
    path('view_user_post/', views.view_user_post),
    path('admin_home/', views.admin_home),



    path('ev_signup/',views.ev_signup),
    path('ev_changepassword/', views.ev_changepassword),
    path('ev_manageprofile/', views.ev_manageprofile),
    path('ev_editstation/<id>', views.ev_editstation),
    path('ev_managecharges/', views.ev_managecharges),
    path('ev_view_charges/', views.ev_view_charges),
    path('ev_edit_charges/<id>', views.ev_edit_charges),
    path('ev_view_bookingforslot/', views.ev_view_bookingforslot),
    path('ev_addslots/', views.ev_addslots),
    path('ev_edit_slots/<id>', views.ev_edit_slots),
    path('ev_delete_slots/<id>', views.ev_delete_slots),
    path('ev_view_user/', views.ev_view_user),
    path('ev_view_complaints/', views.ev_view_complaints),
    path('ev_sendreply/<did>', views.ev_sendreply),
    path('ev_sendreply_post/', views.ev_sendreply_post),


    path('add_slot/', views.add_slot),
    path('add_slot_post/', views.add_slot_post),

    path('ev_view_review/', views.ev_view_review),
    path('ev_charging_home/', views.ev_charging_home),

    path('ev_signup_post/', views.ev_signup_post),
    path('ev_changepassword_post/', views.ev_changepassword_post),
    path('ev_editstation_post/', views.ev_editstation_post),
    # path('ev_manageprofile_post/', views.ev_manageprofile_post),
    path('ev_managecharges_post/', views.ev_managecharges_post),
    path('ev_view_charges_post/', views.ev_view_charges_post),
    path('ev_edit_charges_post/', views.ev_edit_charges_post),
    path('ev_delete_charges_post/<id>', views.ev_delete_charges_post),
    path('ev_view_bookingforslot_post/', views.ev_view_bookingforslot_post),
    path('approve_evstation/<id>', views.approve_evstation),
    path('reject_evstation/<id>', views.reject_evstation),
    path('ev_addslots_post/', views.ev_addslots_post),
    path('ev_edit_slots_post/', views.ev_edit_slots_post),
    path('ev_view_slots/', views.ev_view_slots),
    path('ev_view_slots_post/', views.ev_view_slots_post),
    path('ev_view_user_post/', views.ev_view_user_post),
    path('ev_view_complaints_post/', views.ev_view_complaints_post),
    path('ev_view_review_post/', views.ev_view_review_post),



    path('login_android/',views.login_android),
    path('worker_signup/',views.worker_signup),
    path('view_category_worker/',views.view_category_worker),
    path('worker_changepassword/',views.worker_changepassword),
    path('worker_view_profile/',views.worker_view_profile),
    path('worker_edit_profile/',views.worker_edit_profile),
    path('worker_add_services/',views.worker_add_services),
    path('worker_edit_services/',views.worker_edit_services),
    path('worker_view_services/',views.worker_view_services),
    path('worker_view_userbooking/',views.worker_view_userbooking),
    path('worker_confirm_userbooking/',views.worker_confirm_userbooking),
    path('worker_view_verified_userbooking/',views.worker_view_verified_userbooking),
    path('worker_view_rejected_userbooking/',views.worker_view_rejected_userbooking),
    path('worker_chat/',views.worker_chat),
    path('worker_view_review/',views.worker_view_review),



    path('usr_signup/',views.usr_signup),
    path('usr_change_password/',views.usr_change_password),
    path('usr_view_profile/',views.usr_view_profile),
    path('usr_edit_profile/',views.usr_edit_profile),
    path('usr_view_services/',views.usr_view_services),
    path('usr_view_workers/',views.usr_view_workers),
    path('usr_book_services/',views.usr_book_services),
    path('usr_view_service_status/',views.usr_view_service_status),
    path('usr_add_doubts/',views.usr_add_doubts),
    path('usr_view_solutions/',views.usr_view_solutions),
    path('usr_view_other_users/',views.usr_view_other_users),
    path('usr_view_ev_stations/',views.usr_view_ev_stations),
    path('usr_book_slots/',views.usr_book_slots),
    path('usr_view_booking_status/',views.usr_view_booking_status),
    path('usr_send_complaint/',views.usr_send_complaint),
    path('usr_view_reply/',views.usr_view_reply),
    path('usr_send_review/',views.usr_send_review),
    path('usr_view_slots/',views.usr_view_slots),
    path('and_userviewchat/',views.and_userviewchat),
    path('ins_and_userinschat/',views.ins_and_userinschat),
    path('and_userinschat/',views.and_userinschat),
    path('usr_send_evstation_complaint/',views.usr_send_evstation_complaint),
    path('ev_usr_view_reply/',views.ev_usr_view_reply),
    path('usr_send_feedback/',views.usr_send_feedback),

    path('logout/',views.logout),
]


