PROJECT_ID := cloud-run-sample-249304
SERVICE_NAME := cloud-run-sample
DOCKER_IMAGE := gcr.io/$(PROJECT_ID)/$(SERVICE_NAME)
REGION := us-central

gcloud/build:
	gcloud builds submit --project $(PROJECT_ID) --tag $(DOCKER_IMAGE)

gcloud/deploy:
	gcloud beta run deploy $(SERVICE_NAME) --project $(PROJECT_ID) --image $(DOCKER_IMAGE) --platform managed -q
