# Railway Deployment Guide

This guide will help you deploy your Open SaaS Wasp application to Railway.

## Prerequisites

1. **Railway Account**: Sign up at [railway.app](https://railway.app)
2. **GitHub Repository**: Your code must be in a GitHub repository
3. **Environment Variables**: You'll need to configure several environment variables

## Required Environment Variables

### Essential Variables
- `DATABASE_URL` - Railway will provide this automatically when you add a PostgreSQL service
- `ADMIN_EMAILS` - Comma-separated list of admin emails (e.g., "your-email@example.com")

### Payment Processing (Choose One)

#### Option A: Stripe
- `STRIPE_API_KEY` - Your Stripe API key (starts with sk_test_ or sk_live_)
- `STRIPE_WEBHOOK_SECRET` - Stripe webhook signing secret
- `STRIPE_CUSTOMER_PORTAL_URL` - Your Stripe customer portal URL
- `PAYMENTS_HOBBY_SUBSCRIPTION_PLAN_ID` - Stripe product ID for hobby plan
- `PAYMENTS_PRO_SUBSCRIPTION_PLAN_ID` - Stripe product ID for pro plan

#### Option B: Lemon Squeezy
- `LEMONSQUEEZY_API_KEY` - Your Lemon Squeezy API key
- `LEMONSQUEEZY_STORE_ID` - Your store ID
- `LEMONSQUEEZY_WEBHOOK_SECRET` - Your webhook secret
- `PAYMENTS_HOBBY_SUBSCRIPTION_PLAN_ID` - Product variant ID for hobby plan
- `PAYMENTS_PRO_SUBSCRIPTION_PLAN_ID` - Product variant ID for pro plan

### Optional Features
- `OPENAI_API_KEY` - For AI features (optional)
- `SENDGRID_API_KEY` - For email sending (optional)
- `AWS_S3_IAM_ACCESS_KEY` - For file uploads (optional)
- `AWS_S3_IAM_SECRET_KEY` - For file uploads (optional)
- `AWS_S3_FILES_BUCKET` - S3 bucket name (optional)
- `AWS_S3_REGION` - S3 region (optional)

## Deployment Steps

1. **Create Railway Project**
   - Go to [railway.app](https://railway.app)
   - Click "New Project"
   - Select "Deploy from GitHub repo"
   - Connect your GitHub account and select your repository

2. **Add PostgreSQL Service**
   - In your Railway project, click "New Service"
   - Select "Database" → "PostgreSQL"
   - Railway will automatically provide the `DATABASE_URL` environment variable

3. **Configure Environment Variables**
   - Go to your app service settings
   - Add all the required environment variables listed above
   - Make sure to set `ADMIN_EMAILS` with your email address

4. **Deploy**
   - Railway will automatically deploy your app when you push changes to your GitHub repository
   - The first deployment may take several minutes

## Post-Deployment

1. **Run Database Migrations**
   - Railway will automatically run `wasp db migrate-dev` during deployment
   - If you need to run additional migrations, you can use Railway's CLI or dashboard

2. **Access Your App**
   - Railway will provide you with a URL for your deployed application
   - You can also set up a custom domain in the Railway dashboard

## Troubleshooting

- **Build Failures**: Check the Railway build logs for any errors
- **Database Issues**: Ensure the `DATABASE_URL` is correctly set
- **Environment Variables**: Double-check all required environment variables are set
- **Payment Issues**: Verify your payment provider credentials are correct

## Support

For more help with Railway deployment, check out:
- [Railway Documentation](https://docs.railway.app/)
- [Wasp Deployment Guide](https://wasp.sh/docs/deployment/overview)
