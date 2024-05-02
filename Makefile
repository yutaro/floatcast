build_all:
	go build -C ./api/app -o ./../../bin/api

build_cloudbuild:
	@gcloud builds submit . \
		--project=${GCR_PROJECT} \
		--config=cloudbuild.yaml
		--gcs-log-dir=gs://${GCR_PROJECT}-cloudbuild/logs \
		--substitutions="_COMPLETE_IMAGE_NAME=$(COMPLETE_IMAGE_NAME),_GITHUB_TOKEN=$(GITHUB_TOKEN),_VER=$(VER),_REV=$(REV)"