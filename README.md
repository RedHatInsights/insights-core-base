# Insights Core Base Image

This image was designed with dependencies required for the insights-engine. These
dependencies had to be installed from an rpm that we had to locate manually so it's 
a bit of a special case.

## How Builds Work

A PR is created by a github action in this repo. The action checks for updates to the
ubi8-minimal image that core-base uses as it's `FROM` image.

That PR must be merged in order for a new image to be built properly. Once the PR is
merged, a build job will kick off in quay.io that builds this image. If you need to build
the image manually, you can kick off the build trigger directly from the `cloudservices/core-base`
repository.
