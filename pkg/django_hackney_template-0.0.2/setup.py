from setuptools import setup

setup(
  name = 'hackney_template_django',
  packages = ['hackney_template'],
  include_package_data=True,
  version = '0.0.2',
  license = 'MIT',
  description = 'Django packaged version of the Hackney Council template',
  author = 'Government Digital Service developers',
  url = 'http://github.com/unboxed/hackney_template',
  download_url = 'https://github.com/unboxed/hackney_template/releases/download/v0.0.2/django_hackney_template-0.0.2.tgz',
  keywords = ["alphagov", "govuk", "django", "template"],
)
