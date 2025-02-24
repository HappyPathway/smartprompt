# SmartPrompt Django Frontend Requirements

## Overview
Create a web-based frontend for the SmartPrompt system using Django that provides a user-friendly interface for prompt refinement and management. The application should focus on user management and provide a seamless interface to the existing FastAPI backend.

## Core Features

### 1. User Management
- User registration with email verification
- OAuth support (GitHub, Google)
- Password reset functionality
- User profile management
- API key management for each user
- Usage tracking and quota display
- Role-based access control (Admin, Standard User)

### 2. Prompt Management
- Interactive prompt refinement interface
- Prompt history and favorites
- Batch prompt processing
- Real-time preview of refined prompts
- Export/import functionality
- Tagging and categorization
- Sharing capabilities between users

### 3. Dashboard
- Usage statistics visualization
- Recent activity feed
- Saved prompts overview
- API key usage metrics
- Rate limit status
- System status indicators

### 4. Administration
- User management interface
- Usage monitoring
- System settings configuration
- Rate limit management
- API key administration
- Audit logging

## Technical Requirements

### Backend
- Django 4.2+ with Python 3.8+
- Django REST framework for API endpoints
- Celery for background tasks
- Redis for caching and Celery broker
- PostgreSQL for primary database
- JWT authentication
- Django Channels for real-time features

### Frontend Integration
- Modern frontend framework (e.g., React with django-vite)
- Real-time updates using WebSockets
- Responsive design
- Progressive Web App capabilities
- Markdown support for documentation
- Code syntax highlighting

### Security
- CSRF protection
- XSS prevention
- Rate limiting per user/IP
- Secure password handling
- API key encryption
- Session management
- Input sanitization
- CORS configuration

### Integration Points
- FastAPI backend integration
- OAuth provider integration
- Email service integration
- Monitoring system integration
- Logging service integration

## Database Schema

### Users
```python
class User(AbstractUser):
    email = models.EmailField(unique=True)
    is_email_verified = models.BooleanField(default=False)
    account_tier = models.CharField(choices=TIER_CHOICES)
    daily_quota = models.IntegerField()
    usage_count = models.IntegerField(default=0)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class APIKey(models.Model):
    user = models.ForeignKey(User)
    key = models.CharField(unique=True)
    name = models.CharField()
    is_active = models.BooleanField(default=True)
    last_used = models.DateTimeField(null=True)
    created_at = models.DateTimeField(auto_now_add=True)

class UserProfile(models.Model):
    user = models.OneToOneField(User)
    default_domain = models.CharField(null=True)
    default_expertise = models.CharField(null=True)
    default_format = models.CharField(null=True)
    notification_preferences = models.JSONField()
```

### Prompts
```python
class Prompt(models.Model):
    user = models.ForeignKey(User)
    lazy_prompt = models.TextField()
    refined_prompt = models.TextField()
    domain = models.CharField(null=True)
    expertise_level = models.CharField(null=True)
    output_format = models.CharField(null=True)
    is_favorite = models.BooleanField(default=False)
    tags = models.ManyToManyField('Tag')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class Tag(models.Model):
    name = models.CharField(unique=True)
    user = models.ForeignKey(User)
    created_at = models.DateTimeField(auto_now_add=True)
```

### Usage Tracking
```python
class Usage(models.Model):
    user = models.ForeignKey(User)
    api_key = models.ForeignKey(APIKey, null=True)
    prompt = models.ForeignKey(Prompt)
    request_time = models.DateTimeField()
    response_time = models.IntegerField()  # in milliseconds
    status = models.CharField()
    error = models.TextField(null=True)
```

## Development Guidelines

### Code Style
- Follow PEP 8 conventions
- Use Django coding style guidelines
- Implement comprehensive docstrings
- Write unit tests for all features
- Use type hints where applicable

### Testing Requirements
- Unit tests for all models and views
- Integration tests for API endpoints
- End-to-end testing with Selenium
- Performance testing
- Security testing

### Documentation
- API documentation using drf-spectacular
- User guide for all features
- Administrator documentation
- Development setup guide
- Deployment documentation

### Deployment
- Docker containerization
- CI/CD pipeline configuration
- Environment-specific settings
- Backup and recovery procedures
- Monitoring setup
- Log aggregation

## Project Structure
```
smartprompt_frontend/
├── manage.py
├── requirements/
│   ├── base.txt
│   ├── development.txt
│   └── production.txt
├── smartprompt/
│   ├── __init__.py
│   ├── settings/
│   │   ├── base.py
│   │   ├── development.py
│   │   └── production.py
│   ├── urls.py
│   └── wsgi.py
├── apps/
│   ├── users/
│   ├── prompts/
│   ├── dashboard/
│   └── admin/
├── static/
├── templates/
├── tests/
└── docs/
```

## Performance Requirements
- Page load time < 2 seconds
- API response time < 500ms
- Support for 10,000+ concurrent users
- 99.9% uptime SLA
- Efficient caching strategy
- Database query optimization

## Monitoring and Logging
- Application performance monitoring
- Error tracking and reporting
- User activity logging
- Security event logging
- Resource usage monitoring
- Automated alerting

This document serves as the foundation for developing the Django-based frontend for the SmartPrompt system, focusing on robust user management and seamless integration with the existing backend services.