```
oc new-app https://github.com/andregri/nginx120-app.git
oc logs -f buildconfig/nginx120-app
oc delete all --selector app=nginx120-app
```
