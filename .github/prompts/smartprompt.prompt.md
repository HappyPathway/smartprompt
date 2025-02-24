# Prompt Refinement System

## Overview
This project transforms simple "lazy" prompts into rich, high-quality prompts, making the functionality accessible via both web API and Terraform.

## Components

### 1. Prompt Refinement API (FastAPI)
- RESTful service for prompt enhancement
- Endpoint: POST /refine-prompt
- Features:
  - JSON payload with "lazy_prompt" field
  - Enhanced prompt response
  - Error handling and logging
  - OpenAPI documentation
  - Token-based authentication
  - Request validation

### 2. Golang Client Library
- Client interface for prompt refinement API
- Core functionality:
  - Simple RefinePrompt function
  - Configuration management
  - Error handling with retries
  - Comprehensive documentation
  - Authentication token management
  - Secure token storage

### 3. Terraform Provider (Golang)
- Integration with client library
- Features:
  - Resource/data source for prompt refinement
  - Input: "lazy_prompt"
  - Output: "refined_prompt"
  - Terraform Plugin SDK compliance
  - Complete schema definitions
  - Documentation and build instructions
  - Authentication configuration
  - Token validation

### 4. GCP Deployment Code
- Terraform deployment configuration for GCP
- Components:
  - Containerized infrastructure (Cloud Run/App Engine)
  - Dockerfile for FastAPI application
  - Container registry integration
  - IAM role configuration
  - Environment variable management
  - Secure API access setup

## Authentication
The system implements token-based authentication across all components:

### API Authentication
- Bearer token authentication required for all API endpoints
- Token validation middleware
- Rate limiting per token
- Token expiration and rotation support

### Client Library Authentication
- Token management utilities
- Secure token storage
- Automatic token refresh handling
- Configuration via environment variables or explicit setup

### Terraform Provider Authentication
- Token configuration via provider block
- Support for environment variables
- Sensitive value handling for tokens
- Optional token rotation configuration

## Integration Overview
The system simplifies prompt management through:
- Automatic refinement of simple prompts
- Seamless infrastructure integration
- Cloud-native deployment
- Production-ready architecture

This project serves as a complete solution for transforming basic prompts into detailed, high-quality versions while maintaining ease of use and scalability.