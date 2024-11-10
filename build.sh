set -o errexit  # Exit on error

# Install dependencies
pip install -r requirements.txt

# Collect static files
python manage.py collectstatic --noinput

# Apply database migrations
python manage.py migrate

# Create a superuser if environment variables are set
if [[ "$CREATE_SUPERUSER" == "true" ]]; then
    python manage.py createsuperuser --noinput --email "$DJANGO_SUPERUSER_EMAIL"
fi
