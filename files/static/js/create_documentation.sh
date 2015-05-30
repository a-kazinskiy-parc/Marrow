#!/bin/bash
rm -rf docs
mkdir docs
mkdir docs/testapp
mkdir docs/testapp/views
mkdir docs/testapp/models
mkdir docs/testapp/routes
mkdir docs/testapp/collections

docco apps/testapp/views/*.js
mv docs/*.html docs/testapp/views/
cp docs/docco.css docs/testapp/views/

docco apps/testapp/models/*.js
mv docs/*.html docs/testapp/models/
cp docs/docco.css docs/testapp/models/

docco apps/testapp/routes/*.js
mv docs/*.html docs/testapp/routes/
cp docs/docco.css docs/testapp/routes/

docco apps/testapp/collections/*.js
mv docs/*.html docs/testapp/collections/
cp docs/docco.css docs/testapp/collections/

docco apps/testapp/*.js
mv docs/*.html docs/testapp/
cp docs/docco.css docs/testapp/

docco *.js
