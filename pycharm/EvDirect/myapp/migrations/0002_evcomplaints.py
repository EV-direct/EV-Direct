# Generated by Django 4.0.1 on 2024-02-25 05:47

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='EvComplaints',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('complaints', models.CharField(max_length=100)),
                ('date', models.CharField(max_length=100)),
                ('replay', models.CharField(max_length=100)),
                ('status', models.CharField(max_length=100)),
                ('EVSTATION', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='myapp.evstation')),
                ('USER', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='myapp.users')),
            ],
        ),
    ]