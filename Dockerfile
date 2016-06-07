FROM ruby:2.3-onbuild

RUN gem install foreman

EXPOSE 9000
ENV PORT 9000

# To run this, you need a JSON service account key from Google – step #3
# on this page https://github.com/afeld/face_detect#face-detect
#
# With the downloaded key, you can mv it to this directory, and rename
# it "google-key.json" so that it is ignored by git.
#
# Finally, run the server after building using:
#   $ docker build -t mustachio .
#   $ docker run --detach --name mustachio --publish 9000:9000 \
#       --env GOOGLE_CREDENTIALS_JSON="$(cat google-key.json)" mustachio

CMD ["foreman", "start", "-f", "Procfile"]
