#!/bin/bash

EXTERNAL_HOSTNAME=`curl http://169.254.169.254/latest/meta-data/public-hostname`
if [ "$(curl -u toto:python -X GET $EXTERNAL_HOSTNAME':4000/pozos/api/v1.0/get_student_ages' | python -c "import sys, json; print json.load(sys.stdin)['student_ages']['bob']")" = "13" ] && [ "$(curl -u toto:python -X GET $EXTERNAL_HOSTNAME':5000/pozos/api/v1.0/get_student_ages' | python -c "import sys, json; print json.load(sys.stdin)['student_ages']['alice']")" = "12" ]; then echo "Application deployed"; exit 0; else echo "Application not deployed"; exit 1; fi

