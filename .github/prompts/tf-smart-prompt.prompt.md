High-Level Project Prompt:

Build an integrated system that transforms simple, “lazy” prompts into rich, high-quality prompts, and makes this functionality accessible both as a web API and via Terraform. The project consists of four interconnected components:

Prompt Refinement API (FastAPI):
Create a RESTful service that receives a simple prompt and returns an enhanced, detailed prompt. The API should provide an endpoint (POST /refine-prompt) that accepts a JSON payload with a “lazy_prompt” field, refines the prompt (initially via a basic transformation, with future capability to integrate advanced language models), and returns the refined version. The service should include proper error handling, logging, and auto-generated OpenAPI documentation.

Golang Client Library:
Develop a Golang library that serves as a client for the prompt refinement API. This library must offer a simple interface (for example, a RefinePrompt(lazyPrompt string) (string, error) function) that abstracts the API communication details. It should handle configuration (such as the API endpoint and timeouts), perform robust error handling (including retries), and provide clear documentation so that other systems can easily integrate prompt refinement functionality.

Terraform Provider (Golang):
Implement a Terraform provider in Golang that integrates the client library to offer prompt refinement as part of Terraform configurations. Users should be able to define a resource (or data source) that takes a “lazy_prompt” as an input and outputs the refined prompt as an attribute (e.g., “refined_prompt”). This provider should adhere to Terraform Plugin SDK best practices, include full schema definitions, logging, and error handling, and be accompanied by clear documentation and build instructions.

GCP Deployment Code:
Write Terraform code to deploy the FastAPI-based prompt refinement API to Google Cloud Platform. The deployment should use containerized infrastructure (via Cloud Run or App Engine) and include a Dockerfile for building the FastAPI application image. The Terraform code must handle the entire lifecycle: building and pushing the Docker image to a container registry, provisioning the cloud service with appropriate IAM roles and environment variables, and configuring scalable and secure access to the API.

Overall Integration:

This project aims to simplify prompt management for users who may not be skilled in prompt engineering. By allowing users to supply a simple “lazy” prompt, the system automatically refines it into a detailed, high-quality prompt. The FastAPI service handles the prompt enhancement logic, while the Golang client library and Terraform provider ensure that this capability can be seamlessly integrated into infrastructure as code and automated workflows. The GCP deployment code enables easy, scalable deployment of the API, ensuring the entire solution is cloud-native and production-ready.

This high-level project prompt serves as the blueprint for building each component, ensuring that they all work together to provide a robust and user-friendly prompt refinement solution.