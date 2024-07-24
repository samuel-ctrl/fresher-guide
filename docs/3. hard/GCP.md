# Advanced Task: Deploying a Docker Application on GCP (Google Cloud Platform)

### 1. Dockerize Your Application

**1.1 Create a Dockerfile**

- Ensure your application is Dockerized with a `Dockerfile` similar to the one provided in the AWS section.

### 2. Set Up GCP Infrastructure

**2.1 Create a Google Cloud Account**

- Sign up or log in to your Google Cloud account at [cloud.google.com](https://cloud.google.com/).

**2.2 Install and Configure Google Cloud SDK**

- Install the [Google Cloud SDK](https://cloud.google.com/sdk) on your local machine.
- Authenticate using `gcloud auth login`.

```sh
gcloud auth login
gcloud config set project <your-project-id>
```

**2.3 Create a Google Container Registry (GCR)**

- Navigate to the Container Registry section in the GCP Console.
- Create a new repository or use the existing one.

**2.4 Push Docker Image to GCR**

```sh
# Tag the Docker image
docker tag my-web-app gcr.io/<your-project-id>/my-web-app:latest

# Push the Docker image
docker push gcr.io/<your-project-id>/my-web-app:latest
```

### 3. Deploy to Google Kubernetes Engine (GKE)

**3.1 Create a GKE Cluster**

- Go to the Kubernetes Engine section in the GCP Console.
- Create a new cluster with desired specifications.

**3.2 Deploy Docker Image to GKE**

- Configure `kubectl` to interact with your GKE cluster.

```sh
gcloud container clusters get-credentials <cluster-name> --zone <zone>
```

- Create a Kubernetes deployment YAML file (e.g., `deployment.yaml`).

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-web-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: my-web-app
  template:
    metadata:
      labels:
        app: my-web-app
    spec:
      containers:
      - name: my-web-app
        image: gcr.io/<your-project-id>/my-web-app:latest
        ports:
        - containerPort: 8000
```

- Apply the deployment:

```sh
kubectl apply -f deployment.yaml
```

**3.3 Set Up a Load Balancer**

- Expose your deployment using a service YAML file (e.g., `service.yaml`).

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-web-app-service
spec:
  type: LoadBalancer
  ports:
  - port: 80
    targetPort: 8000
  selector:
    app: my-web-app
```

- Apply the service:

```sh
kubectl apply -f service.yaml
```

### 4. Automate Deployment with CI/CD

**4.1 Set Up Cloud Build**

- Create a `cloudbuild.yaml` file for Google Cloud Build.

```yaml
steps:
- name: 'gcr.io/cloud-builders/docker'
  args: ['build', '-t', 'gcr.io/$PROJECT_ID/my-web-app:$COMMIT_SHA', '.']
- name: 'gcr.io/cloud-builders/docker'
  args: ['push', 'gcr.io/$PROJECT_ID/my-web-app:$COMMIT_SHA']
images:
- 'gcr.io/$PROJECT_ID/my-web-app:$COMMIT_SHA'
```

- Trigger builds using Google Cloud Build.

```sh
gcloud builds submit --config cloudbuild.yaml
```