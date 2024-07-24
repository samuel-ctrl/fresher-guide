# Advanced Task: Deploying a Docker Application on Microsoft Azure

### 1. Dockerize Your Application

**1.1 Create a Dockerfile**

- Use the same `Dockerfile` as in the AWS and GCP sections.

### 2. Set Up Azure Infrastructure

**2.1 Create an Azure Account**

- Sign up or log in to your Azure account at [azure.microsoft.com](https://azure.microsoft.com/).

**2.2 Install and Configure Azure CLI**

- Install the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) on your local machine.
- Log in using `az login`.

```sh
az login
az account set --subscription <your-subscription-id>
```

**2.3 Create an Azure Container Registry (ACR)**

- Create a new container registry through the Azure Portal or CLI.

```sh
az acr create --resource-group <resource-group> --name <registry-name> --sku Basic
```

**2.4 Push Docker Image to ACR**

```sh
# Log in to ACR
az acr login --name <registry-name>

# Tag the Docker image
docker tag my-web-app <registry-name>.azurecr.io/my-web-app:latest

# Push the Docker image
docker push <registry-name>.azurecr.io/my-web-app:latest
```

### 3. Deploy to Azure Kubernetes Service (AKS)

**3.1 Create an AKS Cluster**

- Create a new AKS cluster through the Azure Portal or CLI.

```sh
az aks create --resource-group <resource-group> --name <aks-cluster-name> --node-count 1 --enable-addons monitoring --generate-ssh-keys
```

**3.2 Deploy Docker Image to AKS**

- Configure `kubectl` to interact with your AKS cluster.

```sh
az aks get-credentials --resource-group <resource-group> --name <aks-cluster-name>
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
        image: <registry-name>.azurecr.io/my-web-app:latest
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

**4.1 Set Up Azure Pipelines**

- Create a pipeline in Azure DevOps or use GitHub Actions for Azure.

**4.2 Example Azure Pipeline YAML**

```yaml
trigger:
- main

pool:
  vmImage: 'ubuntu-latest'

steps:
- task: Docker@2
  inputs:
    command: 'buildAndPush'
    containerRegistry: '<your-container-registry-service-connection>'
    repository: '<registry-name>/my-web-app'
    dockerfile: '**/Dockerfile'
    tags: |
      $(Build.BuildId)

- task: Kubernetes@1
  inputs:
    kubernetesServiceEndpoint: '<your-aks-service-connection>'
    namespace: 'default'
    command: 'apply'
    arguments: '-f deployment.yaml -f service.yaml'
```