set -o errexit

# Run the tests
pip install  -r requirements.txt
python manage.py collectstatic --noinput
python manage.py migrate
if [[ $CREATE_SUPERUSER ]];
then
    python manage.py createsuperuser --noinput --email "$DJANGO_SUPERUSER_EMAIL"
fi
