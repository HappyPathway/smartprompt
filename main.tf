terraform {
  required_providers {
    smartprompt = {
      source = "yourusername/smartprompt"
    }
  }
}

provider "smartprompt" {
  api_url = "https://smartprompt-api-xxxxx-uc.a.run.app" # Will be replaced with actual Cloud Run URL
  timeout = 30
}

# Basic usage example
data "smartprompt_refined" "simple" {
  lazy_prompt = "how to implement ci/cd pipeline"
}

# Advanced usage with all features
data "smartprompt_refined" "advanced" {
  lazy_prompt            = "design a microservices architecture"
  domain                 = "architecture"
  expertise_level        = "expert"
  output_format          = "checklist"
  include_best_practices = true
  include_examples       = true
}

output "simple_refined_prompt" {
  value = data.smartprompt_refined.simple.refined_prompt
}

output "advanced_refined_prompt" {
  value = data.smartprompt_refined.advanced.refined_prompt
}

output "detected_topics" {
  value = data.smartprompt_refined.advanced.detected_topics
}

output "recommended_references" {
  value = data.smartprompt_refined.advanced.recommended_references
}
