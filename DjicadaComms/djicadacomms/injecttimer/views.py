from django.shortcuts import render

injects = [
        {
                'name': 'Create AD User',
                'type': 'Windows',
                'time_limit': '120',
                'resources': 'Desktop01',
                'services': 'Active Directory',
                'priority': '3',
                'notes': 'LEAST PRIVILEGE'
        },
        {
                'name': 'Add cronjob',
                'type': 'Linux',
                'time_limit': '180',
                'resources': 'Desktop04',
                'services': 'Crontab daemon',
                'priority': '4',
                'notes': 'Reset LSMS after adding'
        }
]

def home(request):
        context = {
                'injects': injects
        }
        return render(request, 'injecttimer/inject.html', context)
