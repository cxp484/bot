@echo off
:: This scripts defines revisions and tags for a bundle.
:: It is run by the other BUILD scripts.
:: You do not need to run it.

set BUNDLE_FDS_REVISION=c6187c747
set BUNDLE_FDS_TAG=FDS-6.9.0
set BUNDLE_SMV_REVISION=d5e9e21f2
set BUNDLE_SMV_TAG=SMV-6.9.0

:: lines below should not need to be changed

set GH_REPO=test_bundles
set GH_FDS_TAG=BUNDLE_TEST
set GH_SMOKEVIEW_TAG=BUNDLE_TEST
