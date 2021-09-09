# DASH_BUILDER

Dash_Builder uses the github action Nature40/pimod to build the images

## Process
The below process is performed on both armhf and arm64.

### Build Base Image

1. Get RPI Debian Lite image
1. Increase Image by 2000MB
1. Update image

### Build OpenDsh Image

1. Get Base Image
1. Install packages required for Lite OS
1. Clone dash repo
1. Run install.sh -deps
1. Add matt2005 repo public key
1. Add matt2005 apt repo
1. Install aasdk, OpenAuto, qtgstreamer, opendsh from matt2005 apt repo.
